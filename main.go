package main

import (
	"fmt"
	"os"

	"github.com/openconfig/ygot/ygot"
	oc "yang.to.cue/pkg"
)

func main() {
	dev := &oc.Device{}

	dev.Interfaces = &oc.OpenconfigInterfaces_Interfaces{}
	ygot.BuildEmptyTree(dev)
	i, _ := dev.Interfaces.NewInterface("loopback0")
	ygot.BuildEmptyTree(i)
	i.Config.Mtu = ygot.Uint16(1500)
	i.Config.Name = ygot.String("loopback0")
	i.Config.Description = ygot.String("loopback interface")

	i.Subinterfaces = &oc.OpenconfigInterfaces_Interfaces_Interface_Subinterfaces{}

	s, _ := i.Subinterfaces.NewSubinterface(0)
	ygot.BuildEmptyTree(s)
	s.Config.Description = ygot.String("default subinterface")
	s.Config.Index = ygot.Uint32(0)

	s.Ipv4.Addresses = &oc.OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses{}
	addr, _ := s.Ipv4.Addresses.NewAddress("192.0.2.1")
	ygot.BuildEmptyTree(addr)
	addr.Config.PrefixLength = ygot.Uint8(24)
	addr.Config.Ip = ygot.String("192.0.2.1")
	addr.Config.AddrType = oc.AristaIntfAugments_AristaAddrType_PRIMARY

	dev.NetworkInstances = &oc.OpenconfigNetworkInstance_NetworkInstances{}
	ninst, _ := dev.NetworkInstances.NewNetworkInstance("default")
	ninst.Config = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Config{
		Name: ygot.String("default"),
	}

	ninst.Protocols = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols{}
	protocol, _ := ninst.Protocols.NewProtocol(oc.OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_BGP, "BGP")
	protocol.Config = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Config{
		Identifier: oc.OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_BGP,
		Name:       ygot.String("BGP"),
	}
	protocol.Bgp = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp{}
	protocol.Bgp.Global = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global{}
	protocol.Bgp.Global.Config = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Config{}
	protocol.Bgp.Global.Config.As = ygot.Uint32(65000)
	protocol.Bgp.Neighbors = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors{}
	n, _ := protocol.Bgp.Neighbors.NewNeighbor("169.254.0.1")
	n.Config = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Config{}
	n.Config.NeighborAddress = ygot.String("169.254.0.1")
	n.Config.PeerAs = ygot.Uint32(65001)

	n.AfiSafis = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis{}
	afisafi, _ := n.AfiSafis.NewAfiSafi(oc.OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_UNICAST)
	afisafi.Config = &oc.OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Config{
		AfiSafiName: oc.OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_UNICAST,
	}

	json, err := ygot.EmitJSON(dev, &ygot.EmitJSONConfig{
		Format: ygot.RFC7951,
		Indent: "  ",
	})
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(json)
	os.WriteFile("go.json", []byte(json), 0644)
}
