package main

import (
	"bytes"
	"fmt"
	goast "go/ast"
	goparser "go/parser"
	gotoken "go/token"
	"log"
	"os"
	"strings"
	"text/template"

	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"

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
	receiver, key, resource string
}

var (
	genPath = "./cue.mod/gen/yang.to.cue/pkg/yang_go_gen.cue"
)

func main() {

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

	// Generate YANG list constraints

	fset := gotoken.NewFileSet()
	f, err := os.ReadFile("pkg/yang.go")
	if err != nil {
		log.Fatalln(err)
	}

	file, err := goparser.ParseFile(fset, "yang.go", f, 0)
	if err != nil {
		fmt.Println(err)
		return
	}

	// extract YANG list details
	store := []YangList{}
	var rcvName, listKey, resource string
	goast.Inspect(file, func(n goast.Node) bool {
		switch x := n.(type) {
		case *goast.FuncDecl:
			// identify a constructor function
			if strings.HasPrefix(x.Name.Name, "New") {
				for _, receiver := range x.Recv.List {
					starExpr := receiver.Type.(*goast.StarExpr)
					name := starExpr.X.(*goast.Ident)
					rcvName = name.Name
					resource = strings.ToLower(strings.Split(x.Name.Name, "New")[1])

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
						name := v2.(*goast.Ident)
						listKey = name.Name
						// save 'receiver type -> key' name binding
						store = append(store, YangList{
							receiver: rcvName,
							key:      strings.ToLower(listKey),
							resource: resource,
						})
					}
				}
			}
		}
		return true
	})

	uniqCode := template.Must(template.New("validate").Parse(`
	_check: {
		for e in {{.resource}} { (e.config.{{.key}}): true }
	}
	if len(_check) != len({{.resource}}) { _|_ }
	`))
	for k, v := range store {
		fmt.Printf("Key: %s, value: %s\n", k, v)
		var b bytes.Buffer
		uniqCode.Execute(&b, map[string]interface{}{
			"resource": v.resource,
			"key":      v.key,
		})
		fmt.Println(string(b.Bytes()))
		astFile, err := parser.ParseFile("foo.cue", b.Bytes())
		if err != nil {
			fmt.Println(err)
			continue
		}
		// TODO: insert these declarations into CUE definition instead
		cueFile.Decls = append(cueFile.Decls, astFile.Decls...)

	}

	bytes, err := format.Node(cueFile, format.Simplify())
	if err != nil {
		fmt.Println(err)
		return
	}
	//fmt.Println(string(bytes))
	os.WriteFile(genPath, bytes, 0644)
}
