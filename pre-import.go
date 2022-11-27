package main

import (
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/token"
	"fmt"
	//"github.com/openconfig/ygot/ygot"
	"io/ioutil"
	oc "yang.to.cue/pkg"
)

//#E_AristaIntfAugments_AristaAddrType: int64 // #enumE_AristaIntfAugments_AristaAddrType

//var ΛEnum = map[string]map[int64]ygot.EnumDefinition{
//	"E_AristaIntfAugments_AristaAddrType": {
//		1: {Name: "PRIMARY"},
//		2: {Name: "SECONDARY"},
//		3: {Name: "IPV6"},
//	},

const (
	pkgPath = "./cue.mod/gen/yang.to.cue/pkg/extra.cue"
	pkgName = "yang"
)

func main() {

	// Generate enum definitions
	s := &ast.File{Decls: []ast.Decl{
		&ast.Package{
			Name: ast.NewIdent(pkgName),
		},
	}}

	for k, v := range oc.ΛEnum {
		f := &ast.Field{}
		f.Label = ast.NewLit(token.STRING, fmt.Sprintf("#%s", k))
		enums := []ast.Expr{}
		for _, val := range v {
			enums = append(enums, ast.NewString(val.Name))
		}
		f.Value = ast.NewBinExpr(token.OR, enums...)
		s.Decls = append(s.Decls, f)
	}

	// Generate YANG list constraints (TODO)

	bytes, err := format.Node(s, format.Simplify())
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(string(bytes))
	ioutil.WriteFile(pkgPath, bytes, 0644)
}
