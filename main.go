package main

import (
	"fmt"
	"os"

	oc "github.com/networkop/yang-to-cue/pkg"
	"github.com/openconfig/ygot/ygot"
)

//go:generate go run github.com/openconfig/ygot/generator -path=yang -generate_fakeroot -fakeroot_name=device -output_file=pkg/yang.go -compress_paths=true -exclude_modules=ietf-interfaces -package_name=yang openconfig/release/models/interfaces/openconfig-if-ip.yang

func main() {
	dev := &oc.OpenconfigInterfaces_Interfaces{}

	i, _ := dev.NewInterface("loopback0")
	ygot.BuildEmptyTree(i)
	i.Config.Mtu = ygot.Uint16(1500)
	i.Config.Description = ygot.String("loopback interface")

	i.Subinterfaces = &oc.OpenconfigInterfaces_Interfaces_Interface_Subinterfaces{}

	s, _ := i.Subinterfaces.NewSubinterface(0)
	ygot.BuildEmptyTree(s)
	s.Config.Description = ygot.String("default subinterface")

	s.Ipv4.Addresses = &oc.OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses{}
	addr, _ := s.Ipv4.Addresses.NewAddress("192.0.2.1")
	ygot.BuildEmptyTree(addr)
	addr.Config.PrefixLength = ygot.Uint8(24)
	json, _ := ygot.EmitJSON(dev, &ygot.EmitJSONConfig{
		Format: ygot.RFC7951,
		Indent: "  ",
	})

	fmt.Println(json)
	os.WriteFile("go.json", []byte(json), 0644)
}
