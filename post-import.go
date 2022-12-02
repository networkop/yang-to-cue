package main

import (
	"bytes"
	"flag"
	"fmt"
	goast "go/ast"
	goparser "go/parser"
	gotoken "go/token"
	"os"
	"strings"
	"text/template"
	"unicode"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"
	log "github.com/sirupsen/logrus"

	//"github.com/openconfig/ygot/ygot"

	oc "yang.to.cue/pkg"
)

//#E_AristaIntfAugments_AristaAddrType: int64 // #enumE_AristaIntfAugments_AristaAddrType

//var ΛEnum = map[string]map[int64]ygot.EnumDefinition{
//	"E_AristaIntfAugments_AristaAddrType": {
//		1: {Name: "PRIMARY"},
//		2: {Name: "SECONDARY"},
//		3: {Name: "IPV6"},
//	},

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

	debug := flag.Bool("debug", false, "Enable debugging")
	yangList := flag.Bool("yanglist", true, "Include YANG lists validation")
	flag.Parse()

	if *debug {
		log.SetLevel(log.DebugLevel)
	}

	f, err := os.OpenFile("log", os.O_APPEND|os.O_CREATE|os.O_RDWR, 0666)
	if err != nil {
		fmt.Printf("error opening file: %v", err)
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
	for k, v := range oc.ΛEnum {
		f := &ast.Field{}
		f.Label = ast.NewLit(token.STRING, fmt.Sprintf("#%s", k))
		enums := []ast.Expr{}
		for _, val := range v {
			enums = append(enums, ast.NewString(val.Name))
		}
		f.Value = ast.NewBinExpr(token.OR, enums...)
		cueFile.Decls = append(cueFile.Decls, f)
	}

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
		// all of the above is combined in map[methodReceiver]struct{resource, key}
		store := make(map[string]YangList)
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
					if name.Name == "key" {
						for _, v2 := range x.Rhs {
							switch x2 := v2.(type) {
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
								var keys []string
								for _, elt := range x2.Elts {
									kv, ok := elt.(*goast.KeyValueExpr)
									if !ok {
										log.Infof("Found unexpected composite key ", elt)
									}
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
			}
			return true
		})

		for rcvName, v := range store {
			log.Infof("receiver: %s, key: %s, resource: %s\n", rcvName, v.key, v.resource)
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

		var foundDef string
		ast.Walk(cueFile, nil, func(n ast.Node) {
			switch x := n.(type) {

			case *ast.Ident:
				// find all definitions
				if strings.HasPrefix(x.Name, "#") {
					// check if we have that definition in store
					if _, ok := store[x.Name]; ok {
						if x.Node == nil {
							foundDef = x.Name
						}
					}
				}

			case *ast.StructLit:
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
							if name == yl.resource {
								// replace field expression with alias
								// this is done to be able to reference local fields that may be double-quoted
								// see https://cuelang.slack.com/archives/CLT3ULF6C/p1669733898748219 for more details
								alias := ast.Alias{
									Ident: ast.NewIdent(aliasName),
									Expr:  ast.NewBinExpr(token.COLON, ast.NewString(name), field.Value),
								}
								x.Elts[i] = &alias
								addedAlias = true
							}
							if name != yl.resource {
								// this is temporary because sometimes my reverse parsing code translates
								// strings like P2PPrimaryPath into p2-p-primary-path
								// this is so small a portion of the total number of definitions that I can ignore it
								log.Infof("Ignoring resource name :%s because it doesn't match name %s\n", yl.resource, name)
							}
						}
					}

					// Only append validation code if we've added an alias
					if addedAlias {
						x.Elts = append(x.Elts, astFile.Decls...)
					}

					// reset found definition
					foundDef = ""
				}
			}
		})
	}

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
