package main

import (
	"bytes"
	"flag"
	"fmt"
	goast "go/ast"
	goparser "go/parser"
	gotoken "go/token"
	"os"
	"strconv"
	"strings"
	"text/template"
	"unicode"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"
	log "github.com/sirupsen/logrus"
	oc "yang.to.cue/pkg"
	//"github.com/openconfig/ygot/ygot"
)

type YangList struct {
	resource, key string
}

const (
	aliasName = "X"
)

var (
	genPath = "./cue.mod/gen/yang.to.cue/pkg/yang_go_gen.cue"
)

func main() {

	debug := flag.Bool("debug", true, "Enable debugging")
	yangList := flag.Bool("yanglist", true, "Include YANG lists validation")
	flag.Parse()

	if *debug {
		log.SetLevel(log.DebugLevel)
	}

	if err := os.Truncate("log", 0); err != nil {
		log.Fatalln(err)
	}
	f, err := os.OpenFile("log", os.O_APPEND|os.O_CREATE|os.O_RDWR, 0666)
	if err != nil {
		log.Fatalln(err)
	}
	defer f.Close()
	log.SetOutput(f)

	// read auto-generated file
	genFile, err := os.ReadFile(genPath)
	if err != nil {
		log.Fatalln(err)
	}
	cueFile, err := parser.ParseFile(genPath, genFile)
	if err != nil {
		log.Fatalln(err)
	}

	// Generate enum definitions
	// obsolete code block, not used anymore
	//for k, v := range oc.ΛEnum {
	//	f := &ast.Field{}
	//	f.Label = ast.NewLit(token.STRING, fmt.Sprintf("#%s", k))
	//	enums := []ast.Expr{}
	//	for _, val := range v {
	//		enums = append(enums, ast.NewString(val.Name))
	//	}
	//	f.Value = ast.NewBinExpr(token.OR, enums...)
	//	cueFile.Decls = append(cueFile.Decls, f)
	//}

	store := make(map[string]YangList)
	if *yangList {

		// Generate YANG list constraints
		fset := gotoken.NewFileSet()
		f, err := os.ReadFile("pkg/yang.go")
		if err != nil {
			log.Fatalln(err)
		}

		file, err := goparser.ParseFile(fset, "yang.go", f, 0)
		if err != nil {
			log.Fatalln(err)
		}

		// extract YANG list details from a constructor function, e.g.
		// func (t *OpenconfigInterfaces_Interfaces) NewInterface(Name string) (*OpenconfigInterfaces_Interfaces_Interface, error){
		// 		key := Name
		// From the above function we need to extract
		// a) The value of method received, e.g. 'OpenconfigInterfaces_Interfaces'
		// b) The variable assigned to key, e.g. 'Name'
		// c) The name of the resource, e.g. 'interface
		// all of the above is combined in the 'store' = map[methodReceiver]struct{resource, key}

		var rcvName, listKey, resource string
		goast.Inspect(file, func(n goast.Node) bool {
			switch x := n.(type) {
			case *goast.FuncDecl:
				// identify a constructor function
				if strings.HasPrefix(x.Name.Name, "New") {
					for _, receiver := range x.Recv.List {

						starExpr := receiver.Type.(*goast.StarExpr)
						name := starExpr.X.(*goast.Ident)
						rcvName = fmt.Sprintf("#%s", name.Name)
						resource = strings.Split(x.Name.Name, "New")[1]

						log.Debugf("Found constructor for %s and receiver %s\n", resource, rcvName)
					}
				}

			case *goast.AssignStmt:
				// identify a 'key: = <name>' statement
				for _, v := range x.Lhs {
					name, ok := v.(*goast.Ident)
					if !ok {
						continue
					}
					if name.Name != "key" {
						continue
					}
					// parsing the right-hand side of the 'key :=' expression
					for _, v2 := range x.Rhs {
						switch x2 := v2.(type) {
						// this is the case for 'key := Name' basic literal
						case *goast.Ident:
							listKey = x2.Name
							// save 'receiver type -> key, resource' name binding
							store[rcvName] = YangList{
								resource: normalizeName(resource),
								key:      normalizeName(listKey),
							}
						// this is the case for the composite key, e.g.
						// key := OpenconfigAcl_Acl_AclSets_AclSet_Key{
						// 	 Name: Name,
						// 	 Type: Type,
						// }
						case *goast.CompositeLit:
							// keys will store all key values []string{Name, Type}
							var keys []string
							for _, elt := range x2.Elts {
								kv, ok := elt.(*goast.KeyValueExpr)
								if !ok {
									log.Infof("Found unexpected composite key ", elt)
								}
								// I think this might be a bug, I need to store kv.Value??
								keys = append(keys, normalizeName(kv.Key.(*goast.Ident).Name))
							}
							store[rcvName] = YangList{
								resource: normalizeName(resource),
								// I build a single string by joining multiple keys with a '+'
								key: strings.Join(keys, "+"),
							}
						}
					}
				}
			}
			return true
		})

		for rcvName, v := range store {
			log.Infof("receiver: %s, key: %s, resource: %s\n", rcvName, v.key, v.resource)
		}

		// insert a global "import strings" statement
		// assumes no pre-existing import statements
		// create an import declaration
		importDecl := ast.ImportDecl{
			Specs: []*ast.ImportSpec{
				ast.NewImport(nil, "strings"),
			},
		}
		// create a header from the first declaration (assuming it's the package name) and the import
		header := []ast.Decl{cueFile.Decls[0], &importDecl}
		cueFile.Decls = append(header, cueFile.Decls[1:]...)
	}

	// the code to be injected into CUE definitions
	uniqCode := template.Must(template.New("validate").Parse(`
			_check: {
				for e in X { 
					for k in strings.Split("{{.key}}", "+") {
						let kValue = e.config[k]
						if kValue != e[k] {_|_}
					}
					let kValues = [for k in strings.Split("{{.key}}", "+") { "\(e.config[k])" }]
					let compK = strings.Join(kValues, "+")
					"\(compK)": true 
				}
			}
			if len(_check) != len(X) { _|_ } 
			`))

	// walk the cuefile AST
	var foundDef string
	ast.Walk(cueFile, nil, func(n ast.Node) {
		switch x := n.(type) {

		// First two cases are for ENUM patching
		case *ast.Field:
			// find enum definitions
			// e.g. #E_AristaIntfAugments_AristaAddrType: int64
			name, isIdent, err := ast.LabelName(x.Label)
			if err != nil {
				log.Fatalf("Error parsing label %+v", x.Label)
			}
			if isIdent && strings.HasPrefix(name, "#E_") {
				// all ENUM values are strings because EnumDefinition.Name is string
				// e.g. #E_AristaIntfAugments_AristaAddrType: string
				x.Value = ast.NewIdent("string")
			}
		case *ast.BinaryExpr:
			// looking for expressions like '#E_foo_bar & 0'
			if x.Op == token.AND {
				if strings.HasPrefix(fmt.Sprintf("%+v", x.X), "#E_") {
					log.Debugf("Found candidate BinaryExpr %+v", x)
					xX, ok := x.X.(*ast.Ident)
					if !ok {
						log.Fatalf("xX is not ast.Ident")
					}
					// at this point x.X is guaranteed to start with '#'
					enumName := strings.Split(xX.Name, "#")[1]
					log.Debugf("Found binary expression with &. X:%+v, Y:%+v", x.X, x.Y)
					if v, ok := x.Y.(*ast.BasicLit); ok {
						log.Debugf("Value of Y is basicLit: %+v", v)
						if v.Kind == token.INT {
							idx, _ := strconv.ParseInt(v.Value, 10, 64)
							// foundValue tracks if we found a match
							foundValue := false
							// Lookup in the map
							// var ΛEnum = map[string]map[int64]ygot.EnumDefinition{
							//	"E_AristaIntfAugments_AristaAddrType": {
							//		1: {Name: "PRIMARY"},
							//		2: {Name: "SECONDARY"},
							//		3: {Name: "IPV6"},
							//	},
							if v1, ok := oc.ΛEnum[enumName]; ok {
								log.Debugf("Found v1: %+v", v1)
								// v1 is { 1: {Name: "PRIMARY"}, 2: {Name: "SECONDARY"},3: {Name: "IPV6"}, }
								if v2, ok := v1[idx]; ok {
									// v2 is {Name: "PRIMARY"}
									log.Debugf("Found v2: %+v", v2)
									// change '#E_foo_bar & 0' -> '#E_foo_bar & "PRIMARY"'
									x.Y = ast.NewString(v2.Name)
									foundValue = true
								}
							}
							// I think this default works for all ygot enums
							if !foundValue {
								x.Y = ast.NewString("UNSET")
							}
						}
					}
				}
			}

		// Next case is for YANG lists patching
		// find all definitions that have previsouly been saved during goast.Inspect
		case *ast.Ident:
			// find all definitions
			if strings.HasPrefix(x.Name, "#") {
				// check if we have that definition in store
				if _, ok := store[x.Name]; ok {
					// if x is a global definitoin
					if x.Node == nil {
						foundDef = x.Name
					}
				}
			}

		case *ast.StructLit:
			// making all fields optional as some of them (e.g. tpid) are incorrectly marked as required
			for _, elt := range x.Elts {
				if field, ok := elt.(*ast.Field); ok {
					name, _, err := ast.LabelName(field.Label)
					if err != nil {
						log.Fatal(err)
					}
					if field.Optional == token.NoPos {
						log.Debugf("found mandadory field: %s", name)
						field.Optional = token.Blank.Pos()
					}
				}
			}

			// patching the yang lists with validation logic
			// only do this if we've just seen a definition (works due to Walk using DFS)
			if foundDef != "" {
				log.Debugf("foundDef: %s", foundDef)
				yl := store[foundDef]
				var b bytes.Buffer
				uniqCode.Execute(&b, map[string]interface{}{
					"resource": yl.resource,
					"key":      yl.key,
				})
				astFile, err := parser.ParseFile("patch.cue", b.Bytes())
				if err != nil {
					log.Fatal(err)
				}

				addedAlias := false
				for i, elt := range x.Elts {
					if field, ok := elt.(*ast.Field); ok {
						name, _, err := ast.LabelName(field.Label)
						if err != nil {
							log.Fatal(err)
						}

						if name != yl.resource {
							// this is temporary because sometimes my reverse parsing code translates
							// strings like P2PPrimaryPath into p2-p-primary-path
							// this is a small portion of the total number of definitions, so I can ignore it
							log.Infof("Ignoring resource name :%s because it doesn't match name %s\n", yl.resource, name)
							continue
						}

						// replacing field expression with alias
						// this is done to be able to reference local fields that may be double-quoted
						// see https://cuelang.slack.com/archives/CLT3ULF6C/p1669733898748219 for more details
						alias := ast.Alias{
							Ident: ast.NewIdent(aliasName),
							Expr:  ast.NewBinExpr(token.COLON, ast.NewString(name), field.Value),
						}
						x.Elts[i] = &alias
						addedAlias = true
					}
				}

				// Append validation code to the current StructLit
				// Only append if we've just added an alias
				if addedAlias {
					x.Elts = append(x.Elts, astFile.Decls...)
				}
				// reset found definition
				foundDef = ""
			}
		}
	})

	bytes, err := format.Node(cueFile, format.Simplify())
	if err != nil {
		log.Fatalln(err)
	}
	if err := os.Truncate(genPath, 0); err != nil {
		log.Fatalln(err)
	}
	os.WriteFile(genPath, bytes, 0644)
}

// this function converts 'CamelCase' and 'Capitalised' words into 'camel-case' and 'capitalised'
// borrowed from https://groups.google.com/g/golang-nuts/c/VCvbLMDE2F0
func normalizeName(input string) string {
	var words []string
	l := 0
	for s := input; s != ""; s = s[l:] {
		l = strings.IndexFunc(s[1:], unicode.IsUpper) + 1
		if l <= 0 {
			l = len(s)
		}
		words = append(words, strings.ToLower(s[:l]))
	}
	return strings.Join(words, "-")
}
