package yang

#Binary: bytes

#YANGEmpty: bool

#Device: {
	interfaces?: null | #OpenconfigInterfaces_Interfaces @go(Interfaces,*OpenconfigInterfaces_Interfaces)
}

#OpenconfigInterfaces_Interfaces: {
	interface: [...null | #OpenconfigInterfaces_Interfaces_Interface] @go(Interface,[]*OpenconfigInterfaces_Interfaces_Interface)
	_check: {
		for e in interface {
			(e.config[name]): true
		}
	}
	if len(_check) != len(interface) {
		_|_
	}
}

#OpenconfigInterfaces_Interfaces_Interface: {
	aggregation?:   null | #OpenconfigInterfaces_Interfaces_Interface_Aggregation   @go(Aggregation,*OpenconfigInterfaces_Interfaces_Interface_Aggregation)
	config?:        null | #OpenconfigInterfaces_Interfaces_Interface_Config        @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Config)
	ethernet?:      null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet      @go(Ethernet,*OpenconfigInterfaces_Interfaces_Interface_Ethernet)
	"hold-time"?:   null | #OpenconfigInterfaces_Interfaces_Interface_HoldTime      @go(HoldTime,*OpenconfigInterfaces_Interfaces_Interface_HoldTime)
	name?:          null | string                                                   @go(Name,*string)
	"routed-vlan"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan    @go(RoutedVlan,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan)
	subinterfaces?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces @go(Subinterfaces,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation: {
	config?:          null | #OpenconfigInterfaces_Interfaces_Interface_Aggregation_Config       @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Aggregation_Config)
	"switched-vlan"?: null | #OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan @go(SwitchedVlan,*OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_Config: {
	fallback?:           #E_AristaIntfAugments_FallbackEnum       @go(Fallback)
	"fallback-timeout"?: null | uint16                            @go(FallbackTimeout,*uint16)
	"lag-type"?:         #E_OpenconfigIfAggregate_AggregationType @go(LagType)
	"min-links"?:        null | uint16                            @go(MinLinks,*uint16)
	mlag?:               null | uint16                            @go(Mlag,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config: {
	"access-vlan"?:    null | uint16                  @go(AccessVlan,*uint16)
	"interface-mode"?: #E_OpenconfigVlan_VlanModeType @go(InterfaceMode)
	"native-vlan"?:    null | uint16                  @go(NativeVlan,*uint16)
	"trunk-groups": [...string] @go(TrunkGroups,[]string)
	"trunk-vlans": [...#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config_TrunkVlans_Union] @go(TrunkVlans,[]OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config_TrunkVlans_Union)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config_TrunkVlans_Union: _

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config_TrunkVlans_Union_String: String: string

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config_TrunkVlans_Union_Uint16: Uint16: uint16

#OpenconfigInterfaces_Interfaces_Interface_Config: {
	description?:     null | string                     @go(Description,*string)
	enabled?:         null | bool                       @go(Enabled,*bool)
	"load-interval"?: null | uint16                     @go(LoadInterval,*uint16)
	"loopback-mode"?: null | bool                       @go(LoopbackMode,*bool)
	mtu?:             null | uint16                     @go(Mtu,*uint16)
	name?:            null | string                     @go(Name,*string)
	tpid?:            #E_OpenconfigVlanTypes_TPID_TYPES @go(Tpid)
	type?:            #E_IETFInterfaces_InterfaceType   @go(Type)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet: {
	config?:          null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config       @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config)
	pfc?:             null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Pfc          @go(Pfc,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Pfc)
	poe?:             null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Poe          @go(Poe,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Poe)
	reflector?:       null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Reflector    @go(Reflector,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Reflector)
	"switched-vlan"?: null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan @go(SwitchedVlan,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config: {
	"aggregate-id"?:             null | string                                                                 @go(AggregateId,*string)
	"auto-negotiate"?:           null | bool                                                                   @go(AutoNegotiate,*bool)
	"duplex-mode"?:              #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode       @go(DuplexMode)
	"enable-flow-control"?:      null | bool                                                                   @go(EnableFlowControl,*bool)
	"fec-encoding"?:             null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding @go(FecEncoding,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding)
	"fec-mode"?:                 #E_OpenconfigIfEthernet_INTERFACE_FEC                                         @go(FecMode)
	"mac-address"?:              null | string                                                                 @go(MacAddress,*string)
	"port-speed"?:               #E_OpenconfigIfEthernet_ETHERNET_SPEED                                        @go(PortSpeed)
	"sfp-1000base-t"?:           null | bool                                                                   @go(Sfp_1000BaseT,*bool)
	"standalone-link-training"?: null | bool                                                                   @go(StandaloneLinkTraining,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding: {
	"coherent-fec-encoding"?: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding @go(CoherentFecEncoding)
	disabled?:                null | bool                                                                                  @go(Disabled,*bool)
	"fire-code"?:             null | bool                                                                                  @go(FireCode,*bool)
	"reed-solomon"?:          null | bool                                                                                  @go(ReedSolomon,*bool)
	"reed-solomon544"?:       null | bool                                                                                  @go(ReedSolomon544,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Pfc: {
	watchdog?: null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Pfc_Watchdog @go(Watchdog,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Pfc_Watchdog)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Pfc_Watchdog: {
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Poe: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Poe_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Poe_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Poe_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Reflector: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Reflector_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Reflector_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Reflector_Config: {
	direction?:    #E_AristaIntfAugments_ReflectorDirection @go(Direction)
	"mac-action"?: #E_AristaIntfAugments_ReflectorMacAction @go(MacAction)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config: {
	"access-vlan"?:    null | uint16                  @go(AccessVlan,*uint16)
	"interface-mode"?: #E_OpenconfigVlan_VlanModeType @go(InterfaceMode)
	"native-vlan"?:    null | uint16                  @go(NativeVlan,*uint16)
	"trunk-groups": [...string] @go(TrunkGroups,[]string)
	"trunk-vlans": [...#OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config_TrunkVlans_Union] @go(TrunkVlans,[]OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config_TrunkVlans_Union)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config_TrunkVlans_Union: _

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config_TrunkVlans_Union_String: String: string

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_SwitchedVlan_Config_TrunkVlans_Union_Uint16: Uint16: uint16

#OpenconfigInterfaces_Interfaces_Interface_HoldTime: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_HoldTime_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_HoldTime_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_HoldTime_Config: {
	down?: null | uint32 @go(Down,*uint32)
	up?:   null | uint32 @go(Up,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config)
	ipv4?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4   @go(Ipv4,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4)
	ipv6?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6   @go(Ipv6,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config: {
	vlan: #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config_Vlan_Union @go(Vlan)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config_Vlan_Union: _

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config_Vlan_Union_String: String: string

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Config_Vlan_Union_Uint16: Uint16: uint16

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4: {
	addresses?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses  @go(Addresses,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses)
	config?:      null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Config     @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Config)
	neighbors?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors  @go(Neighbors,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors)
	"proxy-arp"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp   @go(ProxyArp,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp)
	unnumbered?:  null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered @go(Unnumbered,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses: {
	address: [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address] @go(Address,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Config)
	ip?:     null | string                                                                              @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Config: {
	"addr-type"?:     #E_AristaIntfAugments_AristaAddrType @go(AddrType)
	ip?:              null | string                        @go(Ip,*string)
	"prefix-length"?: null | uint8                         @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup: {
	config?:               null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config            @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config)
	"interface-tracking"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking @go(InterfaceTracking,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking)
	"track-interfaces"?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces   @go(TrackInterfaces,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces)
	"virtual-router-id"?:  null | uint8                                                                                                         @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config: {
	"accept-mode"?:            null | bool   @go(AcceptMode,*bool)
	"advertisement-interval"?: null | uint16 @go(AdvertisementInterval,*uint16)
	preempt?:                  null | bool   @go(Preempt,*bool)
	"preempt-delay"?:          null | uint16 @go(PreemptDelay,*uint16)
	priority?:                 null | uint8  @go(Priority,*uint8)
	"virtual-address": [...string] @go(VirtualAddress,[]string)
	"virtual-addresses": [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses] @go(VirtualAddresses,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses)
	"virtual-router-id"?: null | uint8 @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:        null | string                        @go(Addr,*string)
	"addr-type"?: #E_AristaIntfAugments_AristaAddrType @go(AddrType)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config: {
	"priority-decrement"?: null | uint8 @go(PriorityDecrement,*uint8)
	"track-interface": [...string] @go(TrackInterface,[]string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces: {
	"track-interface": [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface] @go(TrackInterface,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config)
	name?:   null | string                                                                                                                            @go(Name,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config: {
	name?:                 null | string @go(Name,*string)
	"priority-decrement"?: null | uint8  @go(PriorityDecrement,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Config: {
	"dhcp-client"?: null | bool   @go(DhcpClient,*bool)
	enabled?:       null | bool   @go(Enabled,*bool)
	mtu?:           null | uint16 @go(Mtu,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors: {
	neighbor: [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor] @go(Neighbor,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor_Config)
	ip?:     null | string                                                                               @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor_Config: {
	ip?:                   null | string @go(Ip,*string)
	"link-layer-address"?: null | string @go(LinkLayerAddress,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config: {
	mode?: #E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode @go(Mode)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered: {
	config?:          null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_Config       @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_Config)
	"interface-ref"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_InterfaceRef @go(InterfaceRef,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_InterfaceRef)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_InterfaceRef: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_InterfaceRef_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_InterfaceRef_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Unnumbered_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6: {
	addresses?:              null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses           @go(Addresses,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses)
	config?:                 null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Config              @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Config)
	neighbors?:              null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors           @go(Neighbors,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors)
	"router-advertisement"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_RouterAdvertisement @go(RouterAdvertisement,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_RouterAdvertisement)
	unnumbered?:             null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered          @go(Unnumbered,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses: {
	address: [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address] @go(Address,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Config)
	ip?:     null | string                                                                              @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Config: {
	ip?:              null | string @go(Ip,*string)
	"prefix-length"?: null | uint8  @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup: {
	config?:               null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config            @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config)
	"interface-tracking"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking @go(InterfaceTracking,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking)
	"track-interfaces"?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces   @go(TrackInterfaces,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces)
	"virtual-router-id"?:  null | uint8                                                                                                         @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config: {
	"accept-mode"?:            null | bool   @go(AcceptMode,*bool)
	"advertisement-interval"?: null | uint16 @go(AdvertisementInterval,*uint16)
	preempt?:                  null | bool   @go(Preempt,*bool)
	"preempt-delay"?:          null | uint16 @go(PreemptDelay,*uint16)
	priority?:                 null | uint8  @go(Priority,*uint8)
	"virtual-address": [...string] @go(VirtualAddress,[]string)
	"virtual-addresses": [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses] @go(VirtualAddresses,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses)
	"virtual-link-local"?: null | string @go(VirtualLinkLocal,*string)
	"virtual-router-id"?:  null | uint8  @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:        null | string                        @go(Addr,*string)
	"addr-type"?: #E_AristaIntfAugments_AristaAddrType @go(AddrType)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config: {
	"priority-decrement"?: null | uint8 @go(PriorityDecrement,*uint8)
	"track-interface": [...string] @go(TrackInterface,[]string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces: {
	"track-interface": [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface] @go(TrackInterface,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config)
	name?:   null | string                                                                                                                            @go(Name,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config: {
	name?:                 null | string @go(Name,*string)
	"priority-decrement"?: null | uint8  @go(PriorityDecrement,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Config: {
	"dhcp-client"?:               null | bool   @go(DhcpClient,*bool)
	"dup-addr-detect-transmits"?: null | uint32 @go(DupAddrDetectTransmits,*uint32)
	enabled?:                     null | bool   @go(Enabled,*bool)
	mtu?:                         null | uint32 @go(Mtu,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors: {
	neighbor: [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor] @go(Neighbor,[]*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor_Config)
	ip?:     null | string                                                                               @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor_Config: {
	ip?:                   null | string @go(Ip,*string)
	"link-layer-address"?: null | string @go(LinkLayerAddress,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_RouterAdvertisement: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_RouterAdvertisement_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_RouterAdvertisement_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_RouterAdvertisement_Config: {
	interval?: null | uint32 @go(Interval,*uint32)
	lifetime?: null | uint32 @go(Lifetime,*uint32)
	suppress?: null | bool   @go(Suppress,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered: {
	config?:          null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_Config       @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_Config)
	"interface-ref"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_InterfaceRef @go(InterfaceRef,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_InterfaceRef)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_InterfaceRef: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_InterfaceRef_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_InterfaceRef_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Unnumbered_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces: {
	subinterface: [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface] @go(Subinterface,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Config)
	index?:  null | uint32                                                                       @go(Index,*uint32)
	ipv4?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4   @go(Ipv4,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4)
	ipv6?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6   @go(Ipv6,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6)
	vlan?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan   @go(Vlan,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Config: {
	description?:                     null | string @go(Description,*string)
	enabled?:                         null | bool   @go(Enabled,*bool)
	index?:                           null | uint32 @go(Index,*uint32)
	"l2protocol-forwarding-profile"?: null | string @go(L2ProtocolForwardingProfile,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4: {
	addresses?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses  @go(Addresses,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses)
	config?:      null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Config     @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Config)
	neighbors?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors  @go(Neighbors,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors)
	"proxy-arp"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_ProxyArp   @go(ProxyArp,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_ProxyArp)
	unnumbered?:  null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered @go(Unnumbered,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses: {
	address: [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address] @go(Address,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Config)
	ip?:     null | string                                                                                              @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Config: {
	"addr-type"?:     #E_AristaIntfAugments_AristaAddrType @go(AddrType)
	ip?:              null | string                        @go(Ip,*string)
	"prefix-length"?: null | uint8                         @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup: {
	config?:               null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config            @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config)
	"interface-tracking"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking @go(InterfaceTracking,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking)
	"track-interfaces"?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces   @go(TrackInterfaces,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces)
	"virtual-router-id"?:  null | uint8                                                                                                                         @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config: {
	"accept-mode"?:            null | bool   @go(AcceptMode,*bool)
	"advertisement-interval"?: null | uint16 @go(AdvertisementInterval,*uint16)
	preempt?:                  null | bool   @go(Preempt,*bool)
	"preempt-delay"?:          null | uint16 @go(PreemptDelay,*uint16)
	priority?:                 null | uint8  @go(Priority,*uint8)
	"virtual-address": [...string] @go(VirtualAddress,[]string)
	"virtual-addresses": [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses] @go(VirtualAddresses,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses)
	"virtual-router-id"?: null | uint8 @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:        null | string                        @go(Addr,*string)
	"addr-type"?: #E_AristaIntfAugments_AristaAddrType @go(AddrType)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config: {
	"priority-decrement"?: null | uint8 @go(PriorityDecrement,*uint8)
	"track-interface": [...string] @go(TrackInterface,[]string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces: {
	"track-interface": [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface] @go(TrackInterface,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config)
	name?:   null | string                                                                                                                                            @go(Name,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config: {
	name?:                 null | string @go(Name,*string)
	"priority-decrement"?: null | uint8  @go(PriorityDecrement,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Config: {
	"dhcp-client"?: null | bool   @go(DhcpClient,*bool)
	enabled?:       null | bool   @go(Enabled,*bool)
	mtu?:           null | uint16 @go(Mtu,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors: {
	neighbor: [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor] @go(Neighbor,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor_Config)
	ip?:     null | string                                                                                               @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor_Config: {
	ip?:                   null | string @go(Ip,*string)
	"link-layer-address"?: null | string @go(LinkLayerAddress,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_ProxyArp: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_ProxyArp_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_ProxyArp_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_ProxyArp_Config: {
	mode?: #E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode @go(Mode)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered: {
	config?:          null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_Config       @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_Config)
	"interface-ref"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_InterfaceRef @go(InterfaceRef,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_InterfaceRef)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_InterfaceRef: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_InterfaceRef_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_InterfaceRef_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Unnumbered_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6: {
	addresses?:              null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses           @go(Addresses,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses)
	config?:                 null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Config              @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Config)
	neighbors?:              null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors           @go(Neighbors,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors)
	"router-advertisement"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_RouterAdvertisement @go(RouterAdvertisement,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_RouterAdvertisement)
	unnumbered?:             null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered          @go(Unnumbered,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses: {
	address: [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address] @go(Address,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Config)
	ip?:     null | string                                                                                              @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Config: {
	ip?:              null | string @go(Ip,*string)
	"prefix-length"?: null | uint8  @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup: {
	config?:               null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config            @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config)
	"interface-tracking"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking @go(InterfaceTracking,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking)
	"track-interfaces"?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces   @go(TrackInterfaces,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces)
	"virtual-router-id"?:  null | uint8                                                                                                                         @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config: {
	"accept-mode"?:            null | bool   @go(AcceptMode,*bool)
	"advertisement-interval"?: null | uint16 @go(AdvertisementInterval,*uint16)
	preempt?:                  null | bool   @go(Preempt,*bool)
	"preempt-delay"?:          null | uint16 @go(PreemptDelay,*uint16)
	priority?:                 null | uint8  @go(Priority,*uint8)
	"virtual-address": [...string] @go(VirtualAddress,[]string)
	"virtual-addresses": [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses] @go(VirtualAddresses,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses)
	"virtual-link-local"?: null | string @go(VirtualLinkLocal,*string)
	"virtual-router-id"?:  null | uint8  @go(VirtualRouterId,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:        null | string @go(Addr,*string)
	"addr-type"?: string        @go(AddrType)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config: {
	"priority-decrement"?: null | uint8 @go(PriorityDecrement,*uint8)
	"track-interface": [...string] @go(TrackInterface,[]string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces: {
	"track-interface": [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface] @go(TrackInterface,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config)
	name?:   null | string                                                                                                                                            @go(Name,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface_Config: {
	name?:                 null | string @go(Name,*string)
	"priority-decrement"?: null | uint8  @go(PriorityDecrement,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Config: {
	"dhcp-client"?:               null | bool   @go(DhcpClient,*bool)
	"dup-addr-detect-transmits"?: null | uint32 @go(DupAddrDetectTransmits,*uint32)
	enabled?:                     null | bool   @go(Enabled,*bool)
	mtu?:                         null | uint32 @go(Mtu,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors: {
	neighbor: [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor] @go(Neighbor,[]*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor_Config)
	ip?:     null | string                                                                                               @go(Ip,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor_Config: {
	ip?:                   null | string @go(Ip,*string)
	"link-layer-address"?: null | string @go(LinkLayerAddress,*string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_RouterAdvertisement: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_RouterAdvertisement_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_RouterAdvertisement_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_RouterAdvertisement_Config: {
	interval?: null | uint32 @go(Interval,*uint32)
	lifetime?: null | uint32 @go(Lifetime,*uint32)
	suppress?: null | bool   @go(Suppress,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered: {
	config?:          null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_Config       @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_Config)
	"interface-ref"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_InterfaceRef @go(InterfaceRef,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_InterfaceRef)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_InterfaceRef: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_InterfaceRef_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_InterfaceRef_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Unnumbered_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan: {
	config?:            null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config         @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config)
	"egress-mapping"?:  null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_EgressMapping  @go(EgressMapping,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_EgressMapping)
	"ingress-mapping"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping @go(IngressMapping,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping)
	match?:             null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match          @go(Match,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config: {
	"vlan-id": #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config_VlanId_Union @go(VlanId)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config_VlanId_Union: _

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config_VlanId_Union_String: String: string

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Config_VlanId_Union_Uint16: Uint16: uint16

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_EgressMapping: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_EgressMapping_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_EgressMapping_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_EgressMapping_Config: {
	tpid?:                #E_OpenconfigVlanTypes_TPID_TYPES @go(Tpid)
	"vlan-id"?:           null | uint16                     @go(VlanId,*uint16)
	"vlan-stack-action"?: #E_OpenconfigVlan_VlanStackAction @go(VlanStackAction)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping_Config: {
	tpid?:                #E_OpenconfigVlanTypes_TPID_TYPES @go(Tpid)
	"vlan-id"?:           null | uint16                     @go(VlanId,*uint16)
	"vlan-stack-action"?: #E_OpenconfigVlan_VlanStackAction @go(VlanStackAction)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match: {
	"double-tagged"?:                   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTagged                @go(DoubleTagged,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTagged)
	"double-tagged-inner-list"?:        null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerList       @go(DoubleTaggedInnerList,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerList)
	"double-tagged-inner-outer-range"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerOuterRange @go(DoubleTaggedInnerOuterRange,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerOuterRange)
	"double-tagged-inner-range"?:       null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerRange      @go(DoubleTaggedInnerRange,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerRange)
	"double-tagged-outer-list"?:        null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterList       @go(DoubleTaggedOuterList,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterList)
	"double-tagged-outer-range"?:       null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterRange      @go(DoubleTaggedOuterRange,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterRange)
	"single-tagged"?:                   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTagged                @go(SingleTagged,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTagged)
	"single-tagged-list"?:              null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedList            @go(SingleTaggedList,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedList)
	"single-tagged-range"?:             null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedRange           @go(SingleTaggedRange,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedRange)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTagged: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTagged_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTagged_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerList: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerList_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerList_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerList_Config: {
	"inner-vlan-ids": [...uint16] @go(InnerVlanIds,[]uint16)
	"outer-vlan-id"?: null | uint16 @go(OuterVlanId,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerOuterRange: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerOuterRange_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerOuterRange_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerOuterRange_Config: {
	"inner-high-vlan-id"?: null | uint16 @go(InnerHighVlanId,*uint16)
	"inner-low-vlan-id"?:  null | uint16 @go(InnerLowVlanId,*uint16)
	"outer-high-vlan-id"?: null | uint16 @go(OuterHighVlanId,*uint16)
	"outer-low-vlan-id"?:  null | uint16 @go(OuterLowVlanId,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerRange: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerRange_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerRange_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedInnerRange_Config: {
	"inner-high-vlan-id"?: null | uint16 @go(InnerHighVlanId,*uint16)
	"inner-low-vlan-id"?:  null | uint16 @go(InnerLowVlanId,*uint16)
	"outer-vlan-id": [...uint16] @go(OuterVlanId,[]uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterList: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterList_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterList_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterList_Config: {
	"inner-vlan-id"?: null | uint16 @go(InnerVlanId,*uint16)
	"outer-vlan-ids": [...uint16] @go(OuterVlanIds,[]uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterRange: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterRange_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterRange_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTaggedOuterRange_Config: {
	"inner-vlan-id"?:      null | uint16 @go(InnerVlanId,*uint16)
	"outer-high-vlan-id"?: null | uint16 @go(OuterHighVlanId,*uint16)
	"outer-low-vlan-id"?:  null | uint16 @go(OuterLowVlanId,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_DoubleTagged_Config: {
	"inner-vlan-id"?: null | uint16 @go(InnerVlanId,*uint16)
	"outer-vlan-id"?: null | uint16 @go(OuterVlanId,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTagged: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTagged_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTagged_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedList: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedList_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedList_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedList_Config: {
	"vlan-ids": [...uint16] @go(VlanIds,[]uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedRange: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedRange_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedRange_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTaggedRange_Config: {
	"high-vlan-id"?: null | uint16 @go(HighVlanId,*uint16)
	"low-vlan-id"?:  null | uint16 @go(LowVlanId,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_Match_SingleTagged_Config: {
	"vlan-id"?: null | uint16 @go(VlanId,*uint16)
}

#enumE_AristaIntfAugments_AristaAddrType:
	#AristaIntfAugments_AristaAddrType_UNSET |
	#AristaIntfAugments_AristaAddrType_PRIMARY |
	#AristaIntfAugments_AristaAddrType_SECONDARY |
	#AristaIntfAugments_AristaAddrType_IPV6

#values_E_AristaIntfAugments_AristaAddrType: {
	AristaIntfAugments_AristaAddrType_UNSET:     #AristaIntfAugments_AristaAddrType_UNSET
	AristaIntfAugments_AristaAddrType_PRIMARY:   #AristaIntfAugments_AristaAddrType_PRIMARY
	AristaIntfAugments_AristaAddrType_SECONDARY: #AristaIntfAugments_AristaAddrType_SECONDARY
	AristaIntfAugments_AristaAddrType_IPV6:      #AristaIntfAugments_AristaAddrType_IPV6
}

#AristaIntfAugments_AristaAddrType_UNSET: #E_AristaIntfAugments_AristaAddrType & 0

#AristaIntfAugments_AristaAddrType_PRIMARY: #E_AristaIntfAugments_AristaAddrType & 1

#AristaIntfAugments_AristaAddrType_SECONDARY: #E_AristaIntfAugments_AristaAddrType & 2

#AristaIntfAugments_AristaAddrType_IPV6: #E_AristaIntfAugments_AristaAddrType & 3

#enumE_AristaIntfAugments_FallbackEnum:
	#AristaIntfAugments_FallbackEnum_UNSET |
	#AristaIntfAugments_FallbackEnum_none |
	#AristaIntfAugments_FallbackEnum_static |
	#AristaIntfAugments_FallbackEnum_individual

#values_E_AristaIntfAugments_FallbackEnum: {
	AristaIntfAugments_FallbackEnum_UNSET:      #AristaIntfAugments_FallbackEnum_UNSET
	AristaIntfAugments_FallbackEnum_none:       #AristaIntfAugments_FallbackEnum_none
	AristaIntfAugments_FallbackEnum_static:     #AristaIntfAugments_FallbackEnum_static
	AristaIntfAugments_FallbackEnum_individual: #AristaIntfAugments_FallbackEnum_individual
}

#AristaIntfAugments_FallbackEnum_UNSET: #E_AristaIntfAugments_FallbackEnum & 0

#AristaIntfAugments_FallbackEnum_none: #E_AristaIntfAugments_FallbackEnum & 1

#AristaIntfAugments_FallbackEnum_static: #E_AristaIntfAugments_FallbackEnum & 2

#AristaIntfAugments_FallbackEnum_individual: #E_AristaIntfAugments_FallbackEnum & 3

#enumE_AristaIntfAugments_ReflectorDirection:
	#AristaIntfAugments_ReflectorDirection_UNSET |
	#AristaIntfAugments_ReflectorDirection_none |
	#AristaIntfAugments_ReflectorDirection_in |
	#AristaIntfAugments_ReflectorDirection_out

#values_E_AristaIntfAugments_ReflectorDirection: {
	AristaIntfAugments_ReflectorDirection_UNSET: #AristaIntfAugments_ReflectorDirection_UNSET
	AristaIntfAugments_ReflectorDirection_none:  #AristaIntfAugments_ReflectorDirection_none
	AristaIntfAugments_ReflectorDirection_in:    #AristaIntfAugments_ReflectorDirection_in
	AristaIntfAugments_ReflectorDirection_out:   #AristaIntfAugments_ReflectorDirection_out
}

#AristaIntfAugments_ReflectorDirection_UNSET: #E_AristaIntfAugments_ReflectorDirection & 0

#AristaIntfAugments_ReflectorDirection_none: #E_AristaIntfAugments_ReflectorDirection & 1

#AristaIntfAugments_ReflectorDirection_in: #E_AristaIntfAugments_ReflectorDirection & 2

#AristaIntfAugments_ReflectorDirection_out: #E_AristaIntfAugments_ReflectorDirection & 3

#enumE_AristaIntfAugments_ReflectorMacAction:
	#AristaIntfAugments_ReflectorMacAction_UNSET |
	#AristaIntfAugments_ReflectorMacAction_none |
	#AristaIntfAugments_ReflectorMacAction_swap

#values_E_AristaIntfAugments_ReflectorMacAction: {
	AristaIntfAugments_ReflectorMacAction_UNSET: #AristaIntfAugments_ReflectorMacAction_UNSET
	AristaIntfAugments_ReflectorMacAction_none:  #AristaIntfAugments_ReflectorMacAction_none
	AristaIntfAugments_ReflectorMacAction_swap:  #AristaIntfAugments_ReflectorMacAction_swap
}

#AristaIntfAugments_ReflectorMacAction_UNSET: #E_AristaIntfAugments_ReflectorMacAction & 0

#AristaIntfAugments_ReflectorMacAction_none: #E_AristaIntfAugments_ReflectorMacAction & 1

#AristaIntfAugments_ReflectorMacAction_swap: #E_AristaIntfAugments_ReflectorMacAction & 2

#enumE_IETFInterfaces_InterfaceType:
	#IETFInterfaces_InterfaceType_UNSET |
	#IETFInterfaces_InterfaceType_a12MppSwitch |
	#IETFInterfaces_InterfaceType_aal2 |
	#IETFInterfaces_InterfaceType_aal5 |
	#IETFInterfaces_InterfaceType_actelisMetaLOOP |
	#IETFInterfaces_InterfaceType_adsl |
	#IETFInterfaces_InterfaceType_adsl2 |
	#IETFInterfaces_InterfaceType_adsl2plus |
	#IETFInterfaces_InterfaceType_aflane8023 |
	#IETFInterfaces_InterfaceType_aflane8025 |
	#IETFInterfaces_InterfaceType_aluELP |
	#IETFInterfaces_InterfaceType_aluEpon |
	#IETFInterfaces_InterfaceType_aluEponLogicalLink |
	#IETFInterfaces_InterfaceType_aluEponOnu |
	#IETFInterfaces_InterfaceType_aluEponPhysicalUni |
	#IETFInterfaces_InterfaceType_aluGponOnu |
	#IETFInterfaces_InterfaceType_aluGponPhysicalUni |
	#IETFInterfaces_InterfaceType_arap |
	#IETFInterfaces_InterfaceType_arcnet |
	#IETFInterfaces_InterfaceType_arcnetPlus |
	#IETFInterfaces_InterfaceType_async |
	#IETFInterfaces_InterfaceType_atm |
	#IETFInterfaces_InterfaceType_atmDxi |
	#IETFInterfaces_InterfaceType_atmFuni |
	#IETFInterfaces_InterfaceType_atmIma |
	#IETFInterfaces_InterfaceType_atmLogical |
	#IETFInterfaces_InterfaceType_atmRadio |
	#IETFInterfaces_InterfaceType_atmSubInterface |
	#IETFInterfaces_InterfaceType_atmVciEndPt |
	#IETFInterfaces_InterfaceType_atmVirtual |
	#IETFInterfaces_InterfaceType_atmbond |
	#IETFInterfaces_InterfaceType_aviciOpticalEther |
	#IETFInterfaces_InterfaceType_basicISDN |
	#IETFInterfaces_InterfaceType_bgppolicyaccounting |
	#IETFInterfaces_InterfaceType_bits |
	#IETFInterfaces_InterfaceType_bridge |
	#IETFInterfaces_InterfaceType_bsc |
	#IETFInterfaces_InterfaceType_cableDownstreamRfPort |
	#IETFInterfaces_InterfaceType_capwapDot11Bss |
	#IETFInterfaces_InterfaceType_capwapDot11Profile |
	#IETFInterfaces_InterfaceType_capwapWtpVirtualRadio |
	#IETFInterfaces_InterfaceType_cblVectaStar |
	#IETFInterfaces_InterfaceType_cctEmul |
	#IETFInterfaces_InterfaceType_ces |
	#IETFInterfaces_InterfaceType_channel |
	#IETFInterfaces_InterfaceType_ciscoISLvlan |
	#IETFInterfaces_InterfaceType_cnr |
	#IETFInterfaces_InterfaceType_coffee |
	#IETFInterfaces_InterfaceType_compositeLink |
	#IETFInterfaces_InterfaceType_dcn |
	#IETFInterfaces_InterfaceType_ddnX25 |
	#IETFInterfaces_InterfaceType_digitalPowerline |
	#IETFInterfaces_InterfaceType_digitalWrapperOverheadChannel |
	#IETFInterfaces_InterfaceType_dlsw |
	#IETFInterfaces_InterfaceType_docsCableDownstream |
	#IETFInterfaces_InterfaceType_docsCableMCmtsDownstream |
	#IETFInterfaces_InterfaceType_docsCableMaclayer |
	#IETFInterfaces_InterfaceType_docsCableNdf |
	#IETFInterfaces_InterfaceType_docsCableNdr |
	#IETFInterfaces_InterfaceType_docsCableScte55d1FwdOob |
	#IETFInterfaces_InterfaceType_docsCableScte55d1RetOob |
	#IETFInterfaces_InterfaceType_docsCableScte55d2DsOob |
	#IETFInterfaces_InterfaceType_docsCableScte55d2UsOob |
	#IETFInterfaces_InterfaceType_docsCableUpstream |
	#IETFInterfaces_InterfaceType_docsCableUpstreamChannel |
	#IETFInterfaces_InterfaceType_docsCableUpstreamRfPort |
	#IETFInterfaces_InterfaceType_docsOfdmDownstream |
	#IETFInterfaces_InterfaceType_docsOfdmaUpstream |
	#IETFInterfaces_InterfaceType_ds0 |
	#IETFInterfaces_InterfaceType_ds0Bundle |
	#IETFInterfaces_InterfaceType_ds1 |
	#IETFInterfaces_InterfaceType_ds1FDL |
	#IETFInterfaces_InterfaceType_ds3 |
	#IETFInterfaces_InterfaceType_dtm |
	#IETFInterfaces_InterfaceType_dvbAsiIn |
	#IETFInterfaces_InterfaceType_dvbAsiOut |
	#IETFInterfaces_InterfaceType_dvbRccDownstream |
	#IETFInterfaces_InterfaceType_dvbRccMacLayer |
	#IETFInterfaces_InterfaceType_dvbRccUpstream |
	#IETFInterfaces_InterfaceType_dvbRcsMacLayer |
	#IETFInterfaces_InterfaceType_dvbRcsTdma |
	#IETFInterfaces_InterfaceType_dvbTdm |
	#IETFInterfaces_InterfaceType_e1 |
	#IETFInterfaces_InterfaceType_econet |
	#IETFInterfaces_InterfaceType_eon |
	#IETFInterfaces_InterfaceType_eplrs |
	#IETFInterfaces_InterfaceType_escon |
	#IETFInterfaces_InterfaceType_ethernet3Mbit |
	#IETFInterfaces_InterfaceType_ethernetCsmacd |
	#IETFInterfaces_InterfaceType_fast |
	#IETFInterfaces_InterfaceType_fastEther |
	#IETFInterfaces_InterfaceType_fastEtherFX |
	#IETFInterfaces_InterfaceType_fastdsl |
	#IETFInterfaces_InterfaceType_fcipLink |
	#IETFInterfaces_InterfaceType_fddi |
	#IETFInterfaces_InterfaceType_fibreChannel |
	#IETFInterfaces_InterfaceType_frDlciEndPt |
	#IETFInterfaces_InterfaceType_frForward |
	#IETFInterfaces_InterfaceType_frameRelay |
	#IETFInterfaces_InterfaceType_frameRelayInterconnect |
	#IETFInterfaces_InterfaceType_frameRelayMPI |
	#IETFInterfaces_InterfaceType_frameRelayService |
	#IETFInterfaces_InterfaceType_frf16MfrBundle |
	#IETFInterfaces_InterfaceType_g703at2mb |
	#IETFInterfaces_InterfaceType_g703at64k |
	#IETFInterfaces_InterfaceType_g9981 |
	#IETFInterfaces_InterfaceType_g9982 |
	#IETFInterfaces_InterfaceType_g9983 |
	#IETFInterfaces_InterfaceType_gfast |
	#IETFInterfaces_InterfaceType_gfp |
	#IETFInterfaces_InterfaceType_gigabitEthernet |
	#IETFInterfaces_InterfaceType_gpon |
	#IETFInterfaces_InterfaceType_gr303IDT |
	#IETFInterfaces_InterfaceType_gr303RDT |
	#IETFInterfaces_InterfaceType_gtp |
	#IETFInterfaces_InterfaceType_h323Gatekeeper |
	#IETFInterfaces_InterfaceType_h323Proxy |
	#IETFInterfaces_InterfaceType_hdh1822 |
	#IETFInterfaces_InterfaceType_hdlc |
	#IETFInterfaces_InterfaceType_hdsl2 |
	#IETFInterfaces_InterfaceType_hiperlan2 |
	#IETFInterfaces_InterfaceType_hippi |
	#IETFInterfaces_InterfaceType_hippiInterface |
	#IETFInterfaces_InterfaceType_homepna |
	#IETFInterfaces_InterfaceType_hostPad |
	#IETFInterfaces_InterfaceType_hssi |
	#IETFInterfaces_InterfaceType_hyperchannel |
	#IETFInterfaces_InterfaceType_iana_interface_type |
	#IETFInterfaces_InterfaceType_ibm370parChan |
	#IETFInterfaces_InterfaceType_idsl |
	#IETFInterfaces_InterfaceType_ieee1394 |
	#IETFInterfaces_InterfaceType_ieee80211 |
	#IETFInterfaces_InterfaceType_ieee80212 |
	#IETFInterfaces_InterfaceType_ieee802154 |
	#IETFInterfaces_InterfaceType_ieee80216WMAN |
	#IETFInterfaces_InterfaceType_ieee8023adLag |
	#IETFInterfaces_InterfaceType_if_gsn |
	#IETFInterfaces_InterfaceType_ifPwType |
	#IETFInterfaces_InterfaceType_ifVfiType |
	#IETFInterfaces_InterfaceType_ilan |
	#IETFInterfaces_InterfaceType_imt |
	#IETFInterfaces_InterfaceType_infiniband |
	#IETFInterfaces_InterfaceType_interleave |
	#IETFInterfaces_InterfaceType_ip |
	#IETFInterfaces_InterfaceType_ipForward |
	#IETFInterfaces_InterfaceType_ipOverAtm |
	#IETFInterfaces_InterfaceType_ipOverCdlc |
	#IETFInterfaces_InterfaceType_ipOverClaw |
	#IETFInterfaces_InterfaceType_ipSwitch |
	#IETFInterfaces_InterfaceType_isdn |
	#IETFInterfaces_InterfaceType_isdns |
	#IETFInterfaces_InterfaceType_isdnu |
	#IETFInterfaces_InterfaceType_iso88022llc |
	#IETFInterfaces_InterfaceType_iso88023Csmacd |
	#IETFInterfaces_InterfaceType_iso88024TokenBus |
	#IETFInterfaces_InterfaceType_iso88025CRFPInt |
	#IETFInterfaces_InterfaceType_iso88025Dtr |
	#IETFInterfaces_InterfaceType_iso88025Fiber |
	#IETFInterfaces_InterfaceType_iso88025TokenRing |
	#IETFInterfaces_InterfaceType_iso88026Man |
	#IETFInterfaces_InterfaceType_isup |
	#IETFInterfaces_InterfaceType_l2vlan |
	#IETFInterfaces_InterfaceType_l3ipvlan |
	#IETFInterfaces_InterfaceType_l3ipxvlan |
	#IETFInterfaces_InterfaceType_lapb |
	#IETFInterfaces_InterfaceType_lapd |
	#IETFInterfaces_InterfaceType_lapf |
	#IETFInterfaces_InterfaceType_linegroup |
	#IETFInterfaces_InterfaceType_lmp |
	#IETFInterfaces_InterfaceType_localTalk |
	#IETFInterfaces_InterfaceType_macSecControlledIF |
	#IETFInterfaces_InterfaceType_macSecUncontrolledIF |
	#IETFInterfaces_InterfaceType_mediaMailOverIp |
	#IETFInterfaces_InterfaceType_mfSigLink |
	#IETFInterfaces_InterfaceType_miox25 |
	#IETFInterfaces_InterfaceType_mocaVersion1 |
	#IETFInterfaces_InterfaceType_modem |
	#IETFInterfaces_InterfaceType_mpc |
	#IETFInterfaces_InterfaceType_mpegTransport |
	#IETFInterfaces_InterfaceType_mpls |
	#IETFInterfaces_InterfaceType_mplsTunnel |
	#IETFInterfaces_InterfaceType_msdsl |
	#IETFInterfaces_InterfaceType_mvl |
	#IETFInterfaces_InterfaceType_myrinet |
	#IETFInterfaces_InterfaceType_nfas |
	#IETFInterfaces_InterfaceType_nsip |
	#IETFInterfaces_InterfaceType_opticalChannel |
	#IETFInterfaces_InterfaceType_opticalChannelGroup |
	#IETFInterfaces_InterfaceType_opticalTransport |
	#IETFInterfaces_InterfaceType_other |
	#IETFInterfaces_InterfaceType_otnOdu |
	#IETFInterfaces_InterfaceType_otnOtu |
	#IETFInterfaces_InterfaceType_para |
	#IETFInterfaces_InterfaceType_pdnEtherLoop1 |
	#IETFInterfaces_InterfaceType_pdnEtherLoop2 |
	#IETFInterfaces_InterfaceType_pip |
	#IETFInterfaces_InterfaceType_plc |
	#IETFInterfaces_InterfaceType_pon155 |
	#IETFInterfaces_InterfaceType_pon622 |
	#IETFInterfaces_InterfaceType_pos |
	#IETFInterfaces_InterfaceType_ppp |
	#IETFInterfaces_InterfaceType_pppMultilinkBundle |
	#IETFInterfaces_InterfaceType_primaryISDN |
	#IETFInterfaces_InterfaceType_propAtm |
	#IETFInterfaces_InterfaceType_propBWAp2Mp |
	#IETFInterfaces_InterfaceType_propCnls |
	#IETFInterfaces_InterfaceType_propDocsWirelessDownstream |
	#IETFInterfaces_InterfaceType_propDocsWirelessMaclayer |
	#IETFInterfaces_InterfaceType_propDocsWirelessUpstream |
	#IETFInterfaces_InterfaceType_propMultiplexor |
	#IETFInterfaces_InterfaceType_propPointToPointSerial |
	#IETFInterfaces_InterfaceType_propVirtual |
	#IETFInterfaces_InterfaceType_propWirelessP2P |
	#IETFInterfaces_InterfaceType_proteon10Mbit |
	#IETFInterfaces_InterfaceType_proteon80Mbit |
	#IETFInterfaces_InterfaceType_ptm |
	#IETFInterfaces_InterfaceType_q2931 |
	#IETFInterfaces_InterfaceType_qam |
	#IETFInterfaces_InterfaceType_qllc |
	#IETFInterfaces_InterfaceType_radioMAC |
	#IETFInterfaces_InterfaceType_radsl |
	#IETFInterfaces_InterfaceType_reachDSL |
	#IETFInterfaces_InterfaceType_regular1822 |
	#IETFInterfaces_InterfaceType_rfc1483 |
	#IETFInterfaces_InterfaceType_rfc877x25 |
	#IETFInterfaces_InterfaceType_rpr |
	#IETFInterfaces_InterfaceType_rs232 |
	#IETFInterfaces_InterfaceType_rsrb |
	#IETFInterfaces_InterfaceType_sdci |
	#IETFInterfaces_InterfaceType_sdlc |
	#IETFInterfaces_InterfaceType_sdsl |
	#IETFInterfaces_InterfaceType_shdsl |
	#IETFInterfaces_InterfaceType_sip |
	#IETFInterfaces_InterfaceType_sipSig |
	#IETFInterfaces_InterfaceType_sipTg |
	#IETFInterfaces_InterfaceType_sixToFour |
	#IETFInterfaces_InterfaceType_slip |
	#IETFInterfaces_InterfaceType_smdsDxi |
	#IETFInterfaces_InterfaceType_smdsIcip |
	#IETFInterfaces_InterfaceType_softwareLoopback |
	#IETFInterfaces_InterfaceType_sonet |
	#IETFInterfaces_InterfaceType_sonetOverheadChannel |
	#IETFInterfaces_InterfaceType_sonetPath |
	#IETFInterfaces_InterfaceType_sonetVT |
	#IETFInterfaces_InterfaceType_srp |
	#IETFInterfaces_InterfaceType_ss7SigLink |
	#IETFInterfaces_InterfaceType_stackToStack |
	#IETFInterfaces_InterfaceType_starLan |
	#IETFInterfaces_InterfaceType_tdlc |
	#IETFInterfaces_InterfaceType_teLink |
	#IETFInterfaces_InterfaceType_termPad |
	#IETFInterfaces_InterfaceType_tr008 |
	#IETFInterfaces_InterfaceType_transpHdlc |
	#IETFInterfaces_InterfaceType_tunnel |
	#IETFInterfaces_InterfaceType_ultra |
	#IETFInterfaces_InterfaceType_usb |
	#IETFInterfaces_InterfaceType_v11 |
	#IETFInterfaces_InterfaceType_v35 |
	#IETFInterfaces_InterfaceType_v36 |
	#IETFInterfaces_InterfaceType_v37 |
	#IETFInterfaces_InterfaceType_vdsl |
	#IETFInterfaces_InterfaceType_vdsl2 |
	#IETFInterfaces_InterfaceType_virtualIpAddress |
	#IETFInterfaces_InterfaceType_virtualTg |
	#IETFInterfaces_InterfaceType_vmwareNicTeam |
	#IETFInterfaces_InterfaceType_vmwareVirtualNic |
	#IETFInterfaces_InterfaceType_voiceDID |
	#IETFInterfaces_InterfaceType_voiceEBS |
	#IETFInterfaces_InterfaceType_voiceEM |
	#IETFInterfaces_InterfaceType_voiceEMFGD |
	#IETFInterfaces_InterfaceType_voiceEncap |
	#IETFInterfaces_InterfaceType_voiceFGDEANA |
	#IETFInterfaces_InterfaceType_voiceFGDOS |
	#IETFInterfaces_InterfaceType_voiceFXO |
	#IETFInterfaces_InterfaceType_voiceFXS |
	#IETFInterfaces_InterfaceType_voiceOverAtm |
	#IETFInterfaces_InterfaceType_voiceOverCable |
	#IETFInterfaces_InterfaceType_voiceOverFrameRelay |
	#IETFInterfaces_InterfaceType_voiceOverIp |
	#IETFInterfaces_InterfaceType_wwanPP |
	#IETFInterfaces_InterfaceType_wwanPP2 |
	#IETFInterfaces_InterfaceType_x213 |
	#IETFInterfaces_InterfaceType_x25huntGroup |
	#IETFInterfaces_InterfaceType_x25mlp |
	#IETFInterfaces_InterfaceType_x25ple |
	#IETFInterfaces_InterfaceType_x86Laps |
	#IETFInterfaces_InterfaceType_xboxWireless

#values_E_IETFInterfaces_InterfaceType: {
	IETFInterfaces_InterfaceType_UNSET:                         #IETFInterfaces_InterfaceType_UNSET
	IETFInterfaces_InterfaceType_a12MppSwitch:                  #IETFInterfaces_InterfaceType_a12MppSwitch
	IETFInterfaces_InterfaceType_aal2:                          #IETFInterfaces_InterfaceType_aal2
	IETFInterfaces_InterfaceType_aal5:                          #IETFInterfaces_InterfaceType_aal5
	IETFInterfaces_InterfaceType_actelisMetaLOOP:               #IETFInterfaces_InterfaceType_actelisMetaLOOP
	IETFInterfaces_InterfaceType_adsl:                          #IETFInterfaces_InterfaceType_adsl
	IETFInterfaces_InterfaceType_adsl2:                         #IETFInterfaces_InterfaceType_adsl2
	IETFInterfaces_InterfaceType_adsl2plus:                     #IETFInterfaces_InterfaceType_adsl2plus
	IETFInterfaces_InterfaceType_aflane8023:                    #IETFInterfaces_InterfaceType_aflane8023
	IETFInterfaces_InterfaceType_aflane8025:                    #IETFInterfaces_InterfaceType_aflane8025
	IETFInterfaces_InterfaceType_aluELP:                        #IETFInterfaces_InterfaceType_aluELP
	IETFInterfaces_InterfaceType_aluEpon:                       #IETFInterfaces_InterfaceType_aluEpon
	IETFInterfaces_InterfaceType_aluEponLogicalLink:            #IETFInterfaces_InterfaceType_aluEponLogicalLink
	IETFInterfaces_InterfaceType_aluEponOnu:                    #IETFInterfaces_InterfaceType_aluEponOnu
	IETFInterfaces_InterfaceType_aluEponPhysicalUni:            #IETFInterfaces_InterfaceType_aluEponPhysicalUni
	IETFInterfaces_InterfaceType_aluGponOnu:                    #IETFInterfaces_InterfaceType_aluGponOnu
	IETFInterfaces_InterfaceType_aluGponPhysicalUni:            #IETFInterfaces_InterfaceType_aluGponPhysicalUni
	IETFInterfaces_InterfaceType_arap:                          #IETFInterfaces_InterfaceType_arap
	IETFInterfaces_InterfaceType_arcnet:                        #IETFInterfaces_InterfaceType_arcnet
	IETFInterfaces_InterfaceType_arcnetPlus:                    #IETFInterfaces_InterfaceType_arcnetPlus
	IETFInterfaces_InterfaceType_async:                         #IETFInterfaces_InterfaceType_async
	IETFInterfaces_InterfaceType_atm:                           #IETFInterfaces_InterfaceType_atm
	IETFInterfaces_InterfaceType_atmDxi:                        #IETFInterfaces_InterfaceType_atmDxi
	IETFInterfaces_InterfaceType_atmFuni:                       #IETFInterfaces_InterfaceType_atmFuni
	IETFInterfaces_InterfaceType_atmIma:                        #IETFInterfaces_InterfaceType_atmIma
	IETFInterfaces_InterfaceType_atmLogical:                    #IETFInterfaces_InterfaceType_atmLogical
	IETFInterfaces_InterfaceType_atmRadio:                      #IETFInterfaces_InterfaceType_atmRadio
	IETFInterfaces_InterfaceType_atmSubInterface:               #IETFInterfaces_InterfaceType_atmSubInterface
	IETFInterfaces_InterfaceType_atmVciEndPt:                   #IETFInterfaces_InterfaceType_atmVciEndPt
	IETFInterfaces_InterfaceType_atmVirtual:                    #IETFInterfaces_InterfaceType_atmVirtual
	IETFInterfaces_InterfaceType_atmbond:                       #IETFInterfaces_InterfaceType_atmbond
	IETFInterfaces_InterfaceType_aviciOpticalEther:             #IETFInterfaces_InterfaceType_aviciOpticalEther
	IETFInterfaces_InterfaceType_basicISDN:                     #IETFInterfaces_InterfaceType_basicISDN
	IETFInterfaces_InterfaceType_bgppolicyaccounting:           #IETFInterfaces_InterfaceType_bgppolicyaccounting
	IETFInterfaces_InterfaceType_bits:                          #IETFInterfaces_InterfaceType_bits
	IETFInterfaces_InterfaceType_bridge:                        #IETFInterfaces_InterfaceType_bridge
	IETFInterfaces_InterfaceType_bsc:                           #IETFInterfaces_InterfaceType_bsc
	IETFInterfaces_InterfaceType_cableDownstreamRfPort:         #IETFInterfaces_InterfaceType_cableDownstreamRfPort
	IETFInterfaces_InterfaceType_capwapDot11Bss:                #IETFInterfaces_InterfaceType_capwapDot11Bss
	IETFInterfaces_InterfaceType_capwapDot11Profile:            #IETFInterfaces_InterfaceType_capwapDot11Profile
	IETFInterfaces_InterfaceType_capwapWtpVirtualRadio:         #IETFInterfaces_InterfaceType_capwapWtpVirtualRadio
	IETFInterfaces_InterfaceType_cblVectaStar:                  #IETFInterfaces_InterfaceType_cblVectaStar
	IETFInterfaces_InterfaceType_cctEmul:                       #IETFInterfaces_InterfaceType_cctEmul
	IETFInterfaces_InterfaceType_ces:                           #IETFInterfaces_InterfaceType_ces
	IETFInterfaces_InterfaceType_channel:                       #IETFInterfaces_InterfaceType_channel
	IETFInterfaces_InterfaceType_ciscoISLvlan:                  #IETFInterfaces_InterfaceType_ciscoISLvlan
	IETFInterfaces_InterfaceType_cnr:                           #IETFInterfaces_InterfaceType_cnr
	IETFInterfaces_InterfaceType_coffee:                        #IETFInterfaces_InterfaceType_coffee
	IETFInterfaces_InterfaceType_compositeLink:                 #IETFInterfaces_InterfaceType_compositeLink
	IETFInterfaces_InterfaceType_dcn:                           #IETFInterfaces_InterfaceType_dcn
	IETFInterfaces_InterfaceType_ddnX25:                        #IETFInterfaces_InterfaceType_ddnX25
	IETFInterfaces_InterfaceType_digitalPowerline:              #IETFInterfaces_InterfaceType_digitalPowerline
	IETFInterfaces_InterfaceType_digitalWrapperOverheadChannel: #IETFInterfaces_InterfaceType_digitalWrapperOverheadChannel
	IETFInterfaces_InterfaceType_dlsw:                          #IETFInterfaces_InterfaceType_dlsw
	IETFInterfaces_InterfaceType_docsCableDownstream:           #IETFInterfaces_InterfaceType_docsCableDownstream
	IETFInterfaces_InterfaceType_docsCableMCmtsDownstream:      #IETFInterfaces_InterfaceType_docsCableMCmtsDownstream
	IETFInterfaces_InterfaceType_docsCableMaclayer:             #IETFInterfaces_InterfaceType_docsCableMaclayer
	IETFInterfaces_InterfaceType_docsCableNdf:                  #IETFInterfaces_InterfaceType_docsCableNdf
	IETFInterfaces_InterfaceType_docsCableNdr:                  #IETFInterfaces_InterfaceType_docsCableNdr
	IETFInterfaces_InterfaceType_docsCableScte55d1FwdOob:       #IETFInterfaces_InterfaceType_docsCableScte55d1FwdOob
	IETFInterfaces_InterfaceType_docsCableScte55d1RetOob:       #IETFInterfaces_InterfaceType_docsCableScte55d1RetOob
	IETFInterfaces_InterfaceType_docsCableScte55d2DsOob:        #IETFInterfaces_InterfaceType_docsCableScte55d2DsOob
	IETFInterfaces_InterfaceType_docsCableScte55d2UsOob:        #IETFInterfaces_InterfaceType_docsCableScte55d2UsOob
	IETFInterfaces_InterfaceType_docsCableUpstream:             #IETFInterfaces_InterfaceType_docsCableUpstream
	IETFInterfaces_InterfaceType_docsCableUpstreamChannel:      #IETFInterfaces_InterfaceType_docsCableUpstreamChannel
	IETFInterfaces_InterfaceType_docsCableUpstreamRfPort:       #IETFInterfaces_InterfaceType_docsCableUpstreamRfPort
	IETFInterfaces_InterfaceType_docsOfdmDownstream:            #IETFInterfaces_InterfaceType_docsOfdmDownstream
	IETFInterfaces_InterfaceType_docsOfdmaUpstream:             #IETFInterfaces_InterfaceType_docsOfdmaUpstream
	IETFInterfaces_InterfaceType_ds0:                           #IETFInterfaces_InterfaceType_ds0
	IETFInterfaces_InterfaceType_ds0Bundle:                     #IETFInterfaces_InterfaceType_ds0Bundle
	IETFInterfaces_InterfaceType_ds1:                           #IETFInterfaces_InterfaceType_ds1
	IETFInterfaces_InterfaceType_ds1FDL:                        #IETFInterfaces_InterfaceType_ds1FDL
	IETFInterfaces_InterfaceType_ds3:                           #IETFInterfaces_InterfaceType_ds3
	IETFInterfaces_InterfaceType_dtm:                           #IETFInterfaces_InterfaceType_dtm
	IETFInterfaces_InterfaceType_dvbAsiIn:                      #IETFInterfaces_InterfaceType_dvbAsiIn
	IETFInterfaces_InterfaceType_dvbAsiOut:                     #IETFInterfaces_InterfaceType_dvbAsiOut
	IETFInterfaces_InterfaceType_dvbRccDownstream:              #IETFInterfaces_InterfaceType_dvbRccDownstream
	IETFInterfaces_InterfaceType_dvbRccMacLayer:                #IETFInterfaces_InterfaceType_dvbRccMacLayer
	IETFInterfaces_InterfaceType_dvbRccUpstream:                #IETFInterfaces_InterfaceType_dvbRccUpstream
	IETFInterfaces_InterfaceType_dvbRcsMacLayer:                #IETFInterfaces_InterfaceType_dvbRcsMacLayer
	IETFInterfaces_InterfaceType_dvbRcsTdma:                    #IETFInterfaces_InterfaceType_dvbRcsTdma
	IETFInterfaces_InterfaceType_dvbTdm:                        #IETFInterfaces_InterfaceType_dvbTdm
	IETFInterfaces_InterfaceType_e1:                            #IETFInterfaces_InterfaceType_e1
	IETFInterfaces_InterfaceType_econet:                        #IETFInterfaces_InterfaceType_econet
	IETFInterfaces_InterfaceType_eon:                           #IETFInterfaces_InterfaceType_eon
	IETFInterfaces_InterfaceType_eplrs:                         #IETFInterfaces_InterfaceType_eplrs
	IETFInterfaces_InterfaceType_escon:                         #IETFInterfaces_InterfaceType_escon
	IETFInterfaces_InterfaceType_ethernet3Mbit:                 #IETFInterfaces_InterfaceType_ethernet3Mbit
	IETFInterfaces_InterfaceType_ethernetCsmacd:                #IETFInterfaces_InterfaceType_ethernetCsmacd
	IETFInterfaces_InterfaceType_fast:                          #IETFInterfaces_InterfaceType_fast
	IETFInterfaces_InterfaceType_fastEther:                     #IETFInterfaces_InterfaceType_fastEther
	IETFInterfaces_InterfaceType_fastEtherFX:                   #IETFInterfaces_InterfaceType_fastEtherFX
	IETFInterfaces_InterfaceType_fastdsl:                       #IETFInterfaces_InterfaceType_fastdsl
	IETFInterfaces_InterfaceType_fcipLink:                      #IETFInterfaces_InterfaceType_fcipLink
	IETFInterfaces_InterfaceType_fddi:                          #IETFInterfaces_InterfaceType_fddi
	IETFInterfaces_InterfaceType_fibreChannel:                  #IETFInterfaces_InterfaceType_fibreChannel
	IETFInterfaces_InterfaceType_frDlciEndPt:                   #IETFInterfaces_InterfaceType_frDlciEndPt
	IETFInterfaces_InterfaceType_frForward:                     #IETFInterfaces_InterfaceType_frForward
	IETFInterfaces_InterfaceType_frameRelay:                    #IETFInterfaces_InterfaceType_frameRelay
	IETFInterfaces_InterfaceType_frameRelayInterconnect:        #IETFInterfaces_InterfaceType_frameRelayInterconnect
	IETFInterfaces_InterfaceType_frameRelayMPI:                 #IETFInterfaces_InterfaceType_frameRelayMPI
	IETFInterfaces_InterfaceType_frameRelayService:             #IETFInterfaces_InterfaceType_frameRelayService
	IETFInterfaces_InterfaceType_frf16MfrBundle:                #IETFInterfaces_InterfaceType_frf16MfrBundle
	IETFInterfaces_InterfaceType_g703at2mb:                     #IETFInterfaces_InterfaceType_g703at2mb
	IETFInterfaces_InterfaceType_g703at64k:                     #IETFInterfaces_InterfaceType_g703at64k
	IETFInterfaces_InterfaceType_g9981:                         #IETFInterfaces_InterfaceType_g9981
	IETFInterfaces_InterfaceType_g9982:                         #IETFInterfaces_InterfaceType_g9982
	IETFInterfaces_InterfaceType_g9983:                         #IETFInterfaces_InterfaceType_g9983
	IETFInterfaces_InterfaceType_gfast:                         #IETFInterfaces_InterfaceType_gfast
	IETFInterfaces_InterfaceType_gfp:                           #IETFInterfaces_InterfaceType_gfp
	IETFInterfaces_InterfaceType_gigabitEthernet:               #IETFInterfaces_InterfaceType_gigabitEthernet
	IETFInterfaces_InterfaceType_gpon:                          #IETFInterfaces_InterfaceType_gpon
	IETFInterfaces_InterfaceType_gr303IDT:                      #IETFInterfaces_InterfaceType_gr303IDT
	IETFInterfaces_InterfaceType_gr303RDT:                      #IETFInterfaces_InterfaceType_gr303RDT
	IETFInterfaces_InterfaceType_gtp:                           #IETFInterfaces_InterfaceType_gtp
	IETFInterfaces_InterfaceType_h323Gatekeeper:                #IETFInterfaces_InterfaceType_h323Gatekeeper
	IETFInterfaces_InterfaceType_h323Proxy:                     #IETFInterfaces_InterfaceType_h323Proxy
	IETFInterfaces_InterfaceType_hdh1822:                       #IETFInterfaces_InterfaceType_hdh1822
	IETFInterfaces_InterfaceType_hdlc:                          #IETFInterfaces_InterfaceType_hdlc
	IETFInterfaces_InterfaceType_hdsl2:                         #IETFInterfaces_InterfaceType_hdsl2
	IETFInterfaces_InterfaceType_hiperlan2:                     #IETFInterfaces_InterfaceType_hiperlan2
	IETFInterfaces_InterfaceType_hippi:                         #IETFInterfaces_InterfaceType_hippi
	IETFInterfaces_InterfaceType_hippiInterface:                #IETFInterfaces_InterfaceType_hippiInterface
	IETFInterfaces_InterfaceType_homepna:                       #IETFInterfaces_InterfaceType_homepna
	IETFInterfaces_InterfaceType_hostPad:                       #IETFInterfaces_InterfaceType_hostPad
	IETFInterfaces_InterfaceType_hssi:                          #IETFInterfaces_InterfaceType_hssi
	IETFInterfaces_InterfaceType_hyperchannel:                  #IETFInterfaces_InterfaceType_hyperchannel
	IETFInterfaces_InterfaceType_iana_interface_type:           #IETFInterfaces_InterfaceType_iana_interface_type
	IETFInterfaces_InterfaceType_ibm370parChan:                 #IETFInterfaces_InterfaceType_ibm370parChan
	IETFInterfaces_InterfaceType_idsl:                          #IETFInterfaces_InterfaceType_idsl
	IETFInterfaces_InterfaceType_ieee1394:                      #IETFInterfaces_InterfaceType_ieee1394
	IETFInterfaces_InterfaceType_ieee80211:                     #IETFInterfaces_InterfaceType_ieee80211
	IETFInterfaces_InterfaceType_ieee80212:                     #IETFInterfaces_InterfaceType_ieee80212
	IETFInterfaces_InterfaceType_ieee802154:                    #IETFInterfaces_InterfaceType_ieee802154
	IETFInterfaces_InterfaceType_ieee80216WMAN:                 #IETFInterfaces_InterfaceType_ieee80216WMAN
	IETFInterfaces_InterfaceType_ieee8023adLag:                 #IETFInterfaces_InterfaceType_ieee8023adLag
	IETFInterfaces_InterfaceType_if_gsn:                        #IETFInterfaces_InterfaceType_if_gsn
	IETFInterfaces_InterfaceType_ifPwType:                      #IETFInterfaces_InterfaceType_ifPwType
	IETFInterfaces_InterfaceType_ifVfiType:                     #IETFInterfaces_InterfaceType_ifVfiType
	IETFInterfaces_InterfaceType_ilan:                          #IETFInterfaces_InterfaceType_ilan
	IETFInterfaces_InterfaceType_imt:                           #IETFInterfaces_InterfaceType_imt
	IETFInterfaces_InterfaceType_infiniband:                    #IETFInterfaces_InterfaceType_infiniband
	IETFInterfaces_InterfaceType_interleave:                    #IETFInterfaces_InterfaceType_interleave
	IETFInterfaces_InterfaceType_ip:                            #IETFInterfaces_InterfaceType_ip
	IETFInterfaces_InterfaceType_ipForward:                     #IETFInterfaces_InterfaceType_ipForward
	IETFInterfaces_InterfaceType_ipOverAtm:                     #IETFInterfaces_InterfaceType_ipOverAtm
	IETFInterfaces_InterfaceType_ipOverCdlc:                    #IETFInterfaces_InterfaceType_ipOverCdlc
	IETFInterfaces_InterfaceType_ipOverClaw:                    #IETFInterfaces_InterfaceType_ipOverClaw
	IETFInterfaces_InterfaceType_ipSwitch:                      #IETFInterfaces_InterfaceType_ipSwitch
	IETFInterfaces_InterfaceType_isdn:                          #IETFInterfaces_InterfaceType_isdn
	IETFInterfaces_InterfaceType_isdns:                         #IETFInterfaces_InterfaceType_isdns
	IETFInterfaces_InterfaceType_isdnu:                         #IETFInterfaces_InterfaceType_isdnu
	IETFInterfaces_InterfaceType_iso88022llc:                   #IETFInterfaces_InterfaceType_iso88022llc
	IETFInterfaces_InterfaceType_iso88023Csmacd:                #IETFInterfaces_InterfaceType_iso88023Csmacd
	IETFInterfaces_InterfaceType_iso88024TokenBus:              #IETFInterfaces_InterfaceType_iso88024TokenBus
	IETFInterfaces_InterfaceType_iso88025CRFPInt:               #IETFInterfaces_InterfaceType_iso88025CRFPInt
	IETFInterfaces_InterfaceType_iso88025Dtr:                   #IETFInterfaces_InterfaceType_iso88025Dtr
	IETFInterfaces_InterfaceType_iso88025Fiber:                 #IETFInterfaces_InterfaceType_iso88025Fiber
	IETFInterfaces_InterfaceType_iso88025TokenRing:             #IETFInterfaces_InterfaceType_iso88025TokenRing
	IETFInterfaces_InterfaceType_iso88026Man:                   #IETFInterfaces_InterfaceType_iso88026Man
	IETFInterfaces_InterfaceType_isup:                          #IETFInterfaces_InterfaceType_isup
	IETFInterfaces_InterfaceType_l2vlan:                        #IETFInterfaces_InterfaceType_l2vlan
	IETFInterfaces_InterfaceType_l3ipvlan:                      #IETFInterfaces_InterfaceType_l3ipvlan
	IETFInterfaces_InterfaceType_l3ipxvlan:                     #IETFInterfaces_InterfaceType_l3ipxvlan
	IETFInterfaces_InterfaceType_lapb:                          #IETFInterfaces_InterfaceType_lapb
	IETFInterfaces_InterfaceType_lapd:                          #IETFInterfaces_InterfaceType_lapd
	IETFInterfaces_InterfaceType_lapf:                          #IETFInterfaces_InterfaceType_lapf
	IETFInterfaces_InterfaceType_linegroup:                     #IETFInterfaces_InterfaceType_linegroup
	IETFInterfaces_InterfaceType_lmp:                           #IETFInterfaces_InterfaceType_lmp
	IETFInterfaces_InterfaceType_localTalk:                     #IETFInterfaces_InterfaceType_localTalk
	IETFInterfaces_InterfaceType_macSecControlledIF:            #IETFInterfaces_InterfaceType_macSecControlledIF
	IETFInterfaces_InterfaceType_macSecUncontrolledIF:          #IETFInterfaces_InterfaceType_macSecUncontrolledIF
	IETFInterfaces_InterfaceType_mediaMailOverIp:               #IETFInterfaces_InterfaceType_mediaMailOverIp
	IETFInterfaces_InterfaceType_mfSigLink:                     #IETFInterfaces_InterfaceType_mfSigLink
	IETFInterfaces_InterfaceType_miox25:                        #IETFInterfaces_InterfaceType_miox25
	IETFInterfaces_InterfaceType_mocaVersion1:                  #IETFInterfaces_InterfaceType_mocaVersion1
	IETFInterfaces_InterfaceType_modem:                         #IETFInterfaces_InterfaceType_modem
	IETFInterfaces_InterfaceType_mpc:                           #IETFInterfaces_InterfaceType_mpc
	IETFInterfaces_InterfaceType_mpegTransport:                 #IETFInterfaces_InterfaceType_mpegTransport
	IETFInterfaces_InterfaceType_mpls:                          #IETFInterfaces_InterfaceType_mpls
	IETFInterfaces_InterfaceType_mplsTunnel:                    #IETFInterfaces_InterfaceType_mplsTunnel
	IETFInterfaces_InterfaceType_msdsl:                         #IETFInterfaces_InterfaceType_msdsl
	IETFInterfaces_InterfaceType_mvl:                           #IETFInterfaces_InterfaceType_mvl
	IETFInterfaces_InterfaceType_myrinet:                       #IETFInterfaces_InterfaceType_myrinet
	IETFInterfaces_InterfaceType_nfas:                          #IETFInterfaces_InterfaceType_nfas
	IETFInterfaces_InterfaceType_nsip:                          #IETFInterfaces_InterfaceType_nsip
	IETFInterfaces_InterfaceType_opticalChannel:                #IETFInterfaces_InterfaceType_opticalChannel
	IETFInterfaces_InterfaceType_opticalChannelGroup:           #IETFInterfaces_InterfaceType_opticalChannelGroup
	IETFInterfaces_InterfaceType_opticalTransport:              #IETFInterfaces_InterfaceType_opticalTransport
	IETFInterfaces_InterfaceType_other:                         #IETFInterfaces_InterfaceType_other
	IETFInterfaces_InterfaceType_otnOdu:                        #IETFInterfaces_InterfaceType_otnOdu
	IETFInterfaces_InterfaceType_otnOtu:                        #IETFInterfaces_InterfaceType_otnOtu
	IETFInterfaces_InterfaceType_para:                          #IETFInterfaces_InterfaceType_para
	IETFInterfaces_InterfaceType_pdnEtherLoop1:                 #IETFInterfaces_InterfaceType_pdnEtherLoop1
	IETFInterfaces_InterfaceType_pdnEtherLoop2:                 #IETFInterfaces_InterfaceType_pdnEtherLoop2
	IETFInterfaces_InterfaceType_pip:                           #IETFInterfaces_InterfaceType_pip
	IETFInterfaces_InterfaceType_plc:                           #IETFInterfaces_InterfaceType_plc
	IETFInterfaces_InterfaceType_pon155:                        #IETFInterfaces_InterfaceType_pon155
	IETFInterfaces_InterfaceType_pon622:                        #IETFInterfaces_InterfaceType_pon622
	IETFInterfaces_InterfaceType_pos:                           #IETFInterfaces_InterfaceType_pos
	IETFInterfaces_InterfaceType_ppp:                           #IETFInterfaces_InterfaceType_ppp
	IETFInterfaces_InterfaceType_pppMultilinkBundle:            #IETFInterfaces_InterfaceType_pppMultilinkBundle
	IETFInterfaces_InterfaceType_primaryISDN:                   #IETFInterfaces_InterfaceType_primaryISDN
	IETFInterfaces_InterfaceType_propAtm:                       #IETFInterfaces_InterfaceType_propAtm
	IETFInterfaces_InterfaceType_propBWAp2Mp:                   #IETFInterfaces_InterfaceType_propBWAp2Mp
	IETFInterfaces_InterfaceType_propCnls:                      #IETFInterfaces_InterfaceType_propCnls
	IETFInterfaces_InterfaceType_propDocsWirelessDownstream:    #IETFInterfaces_InterfaceType_propDocsWirelessDownstream
	IETFInterfaces_InterfaceType_propDocsWirelessMaclayer:      #IETFInterfaces_InterfaceType_propDocsWirelessMaclayer
	IETFInterfaces_InterfaceType_propDocsWirelessUpstream:      #IETFInterfaces_InterfaceType_propDocsWirelessUpstream
	IETFInterfaces_InterfaceType_propMultiplexor:               #IETFInterfaces_InterfaceType_propMultiplexor
	IETFInterfaces_InterfaceType_propPointToPointSerial:        #IETFInterfaces_InterfaceType_propPointToPointSerial
	IETFInterfaces_InterfaceType_propVirtual:                   #IETFInterfaces_InterfaceType_propVirtual
	IETFInterfaces_InterfaceType_propWirelessP2P:               #IETFInterfaces_InterfaceType_propWirelessP2P
	IETFInterfaces_InterfaceType_proteon10Mbit:                 #IETFInterfaces_InterfaceType_proteon10Mbit
	IETFInterfaces_InterfaceType_proteon80Mbit:                 #IETFInterfaces_InterfaceType_proteon80Mbit
	IETFInterfaces_InterfaceType_ptm:                           #IETFInterfaces_InterfaceType_ptm
	IETFInterfaces_InterfaceType_q2931:                         #IETFInterfaces_InterfaceType_q2931
	IETFInterfaces_InterfaceType_qam:                           #IETFInterfaces_InterfaceType_qam
	IETFInterfaces_InterfaceType_qllc:                          #IETFInterfaces_InterfaceType_qllc
	IETFInterfaces_InterfaceType_radioMAC:                      #IETFInterfaces_InterfaceType_radioMAC
	IETFInterfaces_InterfaceType_radsl:                         #IETFInterfaces_InterfaceType_radsl
	IETFInterfaces_InterfaceType_reachDSL:                      #IETFInterfaces_InterfaceType_reachDSL
	IETFInterfaces_InterfaceType_regular1822:                   #IETFInterfaces_InterfaceType_regular1822
	IETFInterfaces_InterfaceType_rfc1483:                       #IETFInterfaces_InterfaceType_rfc1483
	IETFInterfaces_InterfaceType_rfc877x25:                     #IETFInterfaces_InterfaceType_rfc877x25
	IETFInterfaces_InterfaceType_rpr:                           #IETFInterfaces_InterfaceType_rpr
	IETFInterfaces_InterfaceType_rs232:                         #IETFInterfaces_InterfaceType_rs232
	IETFInterfaces_InterfaceType_rsrb:                          #IETFInterfaces_InterfaceType_rsrb
	IETFInterfaces_InterfaceType_sdci:                          #IETFInterfaces_InterfaceType_sdci
	IETFInterfaces_InterfaceType_sdlc:                          #IETFInterfaces_InterfaceType_sdlc
	IETFInterfaces_InterfaceType_sdsl:                          #IETFInterfaces_InterfaceType_sdsl
	IETFInterfaces_InterfaceType_shdsl:                         #IETFInterfaces_InterfaceType_shdsl
	IETFInterfaces_InterfaceType_sip:                           #IETFInterfaces_InterfaceType_sip
	IETFInterfaces_InterfaceType_sipSig:                        #IETFInterfaces_InterfaceType_sipSig
	IETFInterfaces_InterfaceType_sipTg:                         #IETFInterfaces_InterfaceType_sipTg
	IETFInterfaces_InterfaceType_sixToFour:                     #IETFInterfaces_InterfaceType_sixToFour
	IETFInterfaces_InterfaceType_slip:                          #IETFInterfaces_InterfaceType_slip
	IETFInterfaces_InterfaceType_smdsDxi:                       #IETFInterfaces_InterfaceType_smdsDxi
	IETFInterfaces_InterfaceType_smdsIcip:                      #IETFInterfaces_InterfaceType_smdsIcip
	IETFInterfaces_InterfaceType_softwareLoopback:              #IETFInterfaces_InterfaceType_softwareLoopback
	IETFInterfaces_InterfaceType_sonet:                         #IETFInterfaces_InterfaceType_sonet
	IETFInterfaces_InterfaceType_sonetOverheadChannel:          #IETFInterfaces_InterfaceType_sonetOverheadChannel
	IETFInterfaces_InterfaceType_sonetPath:                     #IETFInterfaces_InterfaceType_sonetPath
	IETFInterfaces_InterfaceType_sonetVT:                       #IETFInterfaces_InterfaceType_sonetVT
	IETFInterfaces_InterfaceType_srp:                           #IETFInterfaces_InterfaceType_srp
	IETFInterfaces_InterfaceType_ss7SigLink:                    #IETFInterfaces_InterfaceType_ss7SigLink
	IETFInterfaces_InterfaceType_stackToStack:                  #IETFInterfaces_InterfaceType_stackToStack
	IETFInterfaces_InterfaceType_starLan:                       #IETFInterfaces_InterfaceType_starLan
	IETFInterfaces_InterfaceType_tdlc:                          #IETFInterfaces_InterfaceType_tdlc
	IETFInterfaces_InterfaceType_teLink:                        #IETFInterfaces_InterfaceType_teLink
	IETFInterfaces_InterfaceType_termPad:                       #IETFInterfaces_InterfaceType_termPad
	IETFInterfaces_InterfaceType_tr008:                         #IETFInterfaces_InterfaceType_tr008
	IETFInterfaces_InterfaceType_transpHdlc:                    #IETFInterfaces_InterfaceType_transpHdlc
	IETFInterfaces_InterfaceType_tunnel:                        #IETFInterfaces_InterfaceType_tunnel
	IETFInterfaces_InterfaceType_ultra:                         #IETFInterfaces_InterfaceType_ultra
	IETFInterfaces_InterfaceType_usb:                           #IETFInterfaces_InterfaceType_usb
	IETFInterfaces_InterfaceType_v11:                           #IETFInterfaces_InterfaceType_v11
	IETFInterfaces_InterfaceType_v35:                           #IETFInterfaces_InterfaceType_v35
	IETFInterfaces_InterfaceType_v36:                           #IETFInterfaces_InterfaceType_v36
	IETFInterfaces_InterfaceType_v37:                           #IETFInterfaces_InterfaceType_v37
	IETFInterfaces_InterfaceType_vdsl:                          #IETFInterfaces_InterfaceType_vdsl
	IETFInterfaces_InterfaceType_vdsl2:                         #IETFInterfaces_InterfaceType_vdsl2
	IETFInterfaces_InterfaceType_virtualIpAddress:              #IETFInterfaces_InterfaceType_virtualIpAddress
	IETFInterfaces_InterfaceType_virtualTg:                     #IETFInterfaces_InterfaceType_virtualTg
	IETFInterfaces_InterfaceType_vmwareNicTeam:                 #IETFInterfaces_InterfaceType_vmwareNicTeam
	IETFInterfaces_InterfaceType_vmwareVirtualNic:              #IETFInterfaces_InterfaceType_vmwareVirtualNic
	IETFInterfaces_InterfaceType_voiceDID:                      #IETFInterfaces_InterfaceType_voiceDID
	IETFInterfaces_InterfaceType_voiceEBS:                      #IETFInterfaces_InterfaceType_voiceEBS
	IETFInterfaces_InterfaceType_voiceEM:                       #IETFInterfaces_InterfaceType_voiceEM
	IETFInterfaces_InterfaceType_voiceEMFGD:                    #IETFInterfaces_InterfaceType_voiceEMFGD
	IETFInterfaces_InterfaceType_voiceEncap:                    #IETFInterfaces_InterfaceType_voiceEncap
	IETFInterfaces_InterfaceType_voiceFGDEANA:                  #IETFInterfaces_InterfaceType_voiceFGDEANA
	IETFInterfaces_InterfaceType_voiceFGDOS:                    #IETFInterfaces_InterfaceType_voiceFGDOS
	IETFInterfaces_InterfaceType_voiceFXO:                      #IETFInterfaces_InterfaceType_voiceFXO
	IETFInterfaces_InterfaceType_voiceFXS:                      #IETFInterfaces_InterfaceType_voiceFXS
	IETFInterfaces_InterfaceType_voiceOverAtm:                  #IETFInterfaces_InterfaceType_voiceOverAtm
	IETFInterfaces_InterfaceType_voiceOverCable:                #IETFInterfaces_InterfaceType_voiceOverCable
	IETFInterfaces_InterfaceType_voiceOverFrameRelay:           #IETFInterfaces_InterfaceType_voiceOverFrameRelay
	IETFInterfaces_InterfaceType_voiceOverIp:                   #IETFInterfaces_InterfaceType_voiceOverIp
	IETFInterfaces_InterfaceType_wwanPP:                        #IETFInterfaces_InterfaceType_wwanPP
	IETFInterfaces_InterfaceType_wwanPP2:                       #IETFInterfaces_InterfaceType_wwanPP2
	IETFInterfaces_InterfaceType_x213:                          #IETFInterfaces_InterfaceType_x213
	IETFInterfaces_InterfaceType_x25huntGroup:                  #IETFInterfaces_InterfaceType_x25huntGroup
	IETFInterfaces_InterfaceType_x25mlp:                        #IETFInterfaces_InterfaceType_x25mlp
	IETFInterfaces_InterfaceType_x25ple:                        #IETFInterfaces_InterfaceType_x25ple
	IETFInterfaces_InterfaceType_x86Laps:                       #IETFInterfaces_InterfaceType_x86Laps
	IETFInterfaces_InterfaceType_xboxWireless:                  #IETFInterfaces_InterfaceType_xboxWireless
}

#IETFInterfaces_InterfaceType_UNSET: #E_IETFInterfaces_InterfaceType & 0

#IETFInterfaces_InterfaceType_a12MppSwitch: #E_IETFInterfaces_InterfaceType & 1

#IETFInterfaces_InterfaceType_aal2: #E_IETFInterfaces_InterfaceType & 2

#IETFInterfaces_InterfaceType_aal5: #E_IETFInterfaces_InterfaceType & 3

#IETFInterfaces_InterfaceType_actelisMetaLOOP: #E_IETFInterfaces_InterfaceType & 4

#IETFInterfaces_InterfaceType_adsl: #E_IETFInterfaces_InterfaceType & 5

#IETFInterfaces_InterfaceType_adsl2: #E_IETFInterfaces_InterfaceType & 6

#IETFInterfaces_InterfaceType_adsl2plus: #E_IETFInterfaces_InterfaceType & 7

#IETFInterfaces_InterfaceType_aflane8023: #E_IETFInterfaces_InterfaceType & 8

#IETFInterfaces_InterfaceType_aflane8025: #E_IETFInterfaces_InterfaceType & 9

#IETFInterfaces_InterfaceType_aluELP: #E_IETFInterfaces_InterfaceType & 10

#IETFInterfaces_InterfaceType_aluEpon: #E_IETFInterfaces_InterfaceType & 11

#IETFInterfaces_InterfaceType_aluEponLogicalLink: #E_IETFInterfaces_InterfaceType & 12

#IETFInterfaces_InterfaceType_aluEponOnu: #E_IETFInterfaces_InterfaceType & 13

#IETFInterfaces_InterfaceType_aluEponPhysicalUni: #E_IETFInterfaces_InterfaceType & 14

#IETFInterfaces_InterfaceType_aluGponOnu: #E_IETFInterfaces_InterfaceType & 15

#IETFInterfaces_InterfaceType_aluGponPhysicalUni: #E_IETFInterfaces_InterfaceType & 16

#IETFInterfaces_InterfaceType_arap: #E_IETFInterfaces_InterfaceType & 17

#IETFInterfaces_InterfaceType_arcnet: #E_IETFInterfaces_InterfaceType & 18

#IETFInterfaces_InterfaceType_arcnetPlus: #E_IETFInterfaces_InterfaceType & 19

#IETFInterfaces_InterfaceType_async: #E_IETFInterfaces_InterfaceType & 20

#IETFInterfaces_InterfaceType_atm: #E_IETFInterfaces_InterfaceType & 21

#IETFInterfaces_InterfaceType_atmDxi: #E_IETFInterfaces_InterfaceType & 22

#IETFInterfaces_InterfaceType_atmFuni: #E_IETFInterfaces_InterfaceType & 23

#IETFInterfaces_InterfaceType_atmIma: #E_IETFInterfaces_InterfaceType & 24

#IETFInterfaces_InterfaceType_atmLogical: #E_IETFInterfaces_InterfaceType & 25

#IETFInterfaces_InterfaceType_atmRadio: #E_IETFInterfaces_InterfaceType & 26

#IETFInterfaces_InterfaceType_atmSubInterface: #E_IETFInterfaces_InterfaceType & 27

#IETFInterfaces_InterfaceType_atmVciEndPt: #E_IETFInterfaces_InterfaceType & 28

#IETFInterfaces_InterfaceType_atmVirtual: #E_IETFInterfaces_InterfaceType & 29

#IETFInterfaces_InterfaceType_atmbond: #E_IETFInterfaces_InterfaceType & 30

#IETFInterfaces_InterfaceType_aviciOpticalEther: #E_IETFInterfaces_InterfaceType & 31

#IETFInterfaces_InterfaceType_basicISDN: #E_IETFInterfaces_InterfaceType & 32

#IETFInterfaces_InterfaceType_bgppolicyaccounting: #E_IETFInterfaces_InterfaceType & 33

#IETFInterfaces_InterfaceType_bits: #E_IETFInterfaces_InterfaceType & 34

#IETFInterfaces_InterfaceType_bridge: #E_IETFInterfaces_InterfaceType & 35

#IETFInterfaces_InterfaceType_bsc: #E_IETFInterfaces_InterfaceType & 36

#IETFInterfaces_InterfaceType_cableDownstreamRfPort: #E_IETFInterfaces_InterfaceType & 37

#IETFInterfaces_InterfaceType_capwapDot11Bss: #E_IETFInterfaces_InterfaceType & 38

#IETFInterfaces_InterfaceType_capwapDot11Profile: #E_IETFInterfaces_InterfaceType & 39

#IETFInterfaces_InterfaceType_capwapWtpVirtualRadio: #E_IETFInterfaces_InterfaceType & 40

#IETFInterfaces_InterfaceType_cblVectaStar: #E_IETFInterfaces_InterfaceType & 41

#IETFInterfaces_InterfaceType_cctEmul: #E_IETFInterfaces_InterfaceType & 42

#IETFInterfaces_InterfaceType_ces: #E_IETFInterfaces_InterfaceType & 43

#IETFInterfaces_InterfaceType_channel: #E_IETFInterfaces_InterfaceType & 44

#IETFInterfaces_InterfaceType_ciscoISLvlan: #E_IETFInterfaces_InterfaceType & 45

#IETFInterfaces_InterfaceType_cnr: #E_IETFInterfaces_InterfaceType & 46

#IETFInterfaces_InterfaceType_coffee: #E_IETFInterfaces_InterfaceType & 47

#IETFInterfaces_InterfaceType_compositeLink: #E_IETFInterfaces_InterfaceType & 48

#IETFInterfaces_InterfaceType_dcn: #E_IETFInterfaces_InterfaceType & 49

#IETFInterfaces_InterfaceType_ddnX25: #E_IETFInterfaces_InterfaceType & 50

#IETFInterfaces_InterfaceType_digitalPowerline: #E_IETFInterfaces_InterfaceType & 51

#IETFInterfaces_InterfaceType_digitalWrapperOverheadChannel: #E_IETFInterfaces_InterfaceType & 52

#IETFInterfaces_InterfaceType_dlsw: #E_IETFInterfaces_InterfaceType & 53

#IETFInterfaces_InterfaceType_docsCableDownstream: #E_IETFInterfaces_InterfaceType & 54

#IETFInterfaces_InterfaceType_docsCableMCmtsDownstream: #E_IETFInterfaces_InterfaceType & 55

#IETFInterfaces_InterfaceType_docsCableMaclayer: #E_IETFInterfaces_InterfaceType & 56

#IETFInterfaces_InterfaceType_docsCableNdf: #E_IETFInterfaces_InterfaceType & 57

#IETFInterfaces_InterfaceType_docsCableNdr: #E_IETFInterfaces_InterfaceType & 58

#IETFInterfaces_InterfaceType_docsCableScte55d1FwdOob: #E_IETFInterfaces_InterfaceType & 59

#IETFInterfaces_InterfaceType_docsCableScte55d1RetOob: #E_IETFInterfaces_InterfaceType & 60

#IETFInterfaces_InterfaceType_docsCableScte55d2DsOob: #E_IETFInterfaces_InterfaceType & 61

#IETFInterfaces_InterfaceType_docsCableScte55d2UsOob: #E_IETFInterfaces_InterfaceType & 62

#IETFInterfaces_InterfaceType_docsCableUpstream: #E_IETFInterfaces_InterfaceType & 63

#IETFInterfaces_InterfaceType_docsCableUpstreamChannel: #E_IETFInterfaces_InterfaceType & 64

#IETFInterfaces_InterfaceType_docsCableUpstreamRfPort: #E_IETFInterfaces_InterfaceType & 65

#IETFInterfaces_InterfaceType_docsOfdmDownstream: #E_IETFInterfaces_InterfaceType & 66

#IETFInterfaces_InterfaceType_docsOfdmaUpstream: #E_IETFInterfaces_InterfaceType & 67

#IETFInterfaces_InterfaceType_ds0: #E_IETFInterfaces_InterfaceType & 68

#IETFInterfaces_InterfaceType_ds0Bundle: #E_IETFInterfaces_InterfaceType & 69

#IETFInterfaces_InterfaceType_ds1: #E_IETFInterfaces_InterfaceType & 70

#IETFInterfaces_InterfaceType_ds1FDL: #E_IETFInterfaces_InterfaceType & 71

#IETFInterfaces_InterfaceType_ds3: #E_IETFInterfaces_InterfaceType & 72

#IETFInterfaces_InterfaceType_dtm: #E_IETFInterfaces_InterfaceType & 73

#IETFInterfaces_InterfaceType_dvbAsiIn: #E_IETFInterfaces_InterfaceType & 74

#IETFInterfaces_InterfaceType_dvbAsiOut: #E_IETFInterfaces_InterfaceType & 75

#IETFInterfaces_InterfaceType_dvbRccDownstream: #E_IETFInterfaces_InterfaceType & 76

#IETFInterfaces_InterfaceType_dvbRccMacLayer: #E_IETFInterfaces_InterfaceType & 77

#IETFInterfaces_InterfaceType_dvbRccUpstream: #E_IETFInterfaces_InterfaceType & 78

#IETFInterfaces_InterfaceType_dvbRcsMacLayer: #E_IETFInterfaces_InterfaceType & 79

#IETFInterfaces_InterfaceType_dvbRcsTdma: #E_IETFInterfaces_InterfaceType & 80

#IETFInterfaces_InterfaceType_dvbTdm: #E_IETFInterfaces_InterfaceType & 81

#IETFInterfaces_InterfaceType_e1: #E_IETFInterfaces_InterfaceType & 82

#IETFInterfaces_InterfaceType_econet: #E_IETFInterfaces_InterfaceType & 83

#IETFInterfaces_InterfaceType_eon: #E_IETFInterfaces_InterfaceType & 84

#IETFInterfaces_InterfaceType_eplrs: #E_IETFInterfaces_InterfaceType & 85

#IETFInterfaces_InterfaceType_escon: #E_IETFInterfaces_InterfaceType & 86

#IETFInterfaces_InterfaceType_ethernet3Mbit: #E_IETFInterfaces_InterfaceType & 87

#IETFInterfaces_InterfaceType_ethernetCsmacd: #E_IETFInterfaces_InterfaceType & 88

#IETFInterfaces_InterfaceType_fast: #E_IETFInterfaces_InterfaceType & 89

#IETFInterfaces_InterfaceType_fastEther: #E_IETFInterfaces_InterfaceType & 90

#IETFInterfaces_InterfaceType_fastEtherFX: #E_IETFInterfaces_InterfaceType & 91

#IETFInterfaces_InterfaceType_fastdsl: #E_IETFInterfaces_InterfaceType & 92

#IETFInterfaces_InterfaceType_fcipLink: #E_IETFInterfaces_InterfaceType & 93

#IETFInterfaces_InterfaceType_fddi: #E_IETFInterfaces_InterfaceType & 94

#IETFInterfaces_InterfaceType_fibreChannel: #E_IETFInterfaces_InterfaceType & 95

#IETFInterfaces_InterfaceType_frDlciEndPt: #E_IETFInterfaces_InterfaceType & 96

#IETFInterfaces_InterfaceType_frForward: #E_IETFInterfaces_InterfaceType & 97

#IETFInterfaces_InterfaceType_frameRelay: #E_IETFInterfaces_InterfaceType & 98

#IETFInterfaces_InterfaceType_frameRelayInterconnect: #E_IETFInterfaces_InterfaceType & 99

#IETFInterfaces_InterfaceType_frameRelayMPI: #E_IETFInterfaces_InterfaceType & 100

#IETFInterfaces_InterfaceType_frameRelayService: #E_IETFInterfaces_InterfaceType & 101

#IETFInterfaces_InterfaceType_frf16MfrBundle: #E_IETFInterfaces_InterfaceType & 102

#IETFInterfaces_InterfaceType_g703at2mb: #E_IETFInterfaces_InterfaceType & 103

#IETFInterfaces_InterfaceType_g703at64k: #E_IETFInterfaces_InterfaceType & 104

#IETFInterfaces_InterfaceType_g9981: #E_IETFInterfaces_InterfaceType & 105

#IETFInterfaces_InterfaceType_g9982: #E_IETFInterfaces_InterfaceType & 106

#IETFInterfaces_InterfaceType_g9983: #E_IETFInterfaces_InterfaceType & 107

#IETFInterfaces_InterfaceType_gfast: #E_IETFInterfaces_InterfaceType & 108

#IETFInterfaces_InterfaceType_gfp: #E_IETFInterfaces_InterfaceType & 109

#IETFInterfaces_InterfaceType_gigabitEthernet: #E_IETFInterfaces_InterfaceType & 110

#IETFInterfaces_InterfaceType_gpon: #E_IETFInterfaces_InterfaceType & 111

#IETFInterfaces_InterfaceType_gr303IDT: #E_IETFInterfaces_InterfaceType & 112

#IETFInterfaces_InterfaceType_gr303RDT: #E_IETFInterfaces_InterfaceType & 113

#IETFInterfaces_InterfaceType_gtp: #E_IETFInterfaces_InterfaceType & 114

#IETFInterfaces_InterfaceType_h323Gatekeeper: #E_IETFInterfaces_InterfaceType & 115

#IETFInterfaces_InterfaceType_h323Proxy: #E_IETFInterfaces_InterfaceType & 116

#IETFInterfaces_InterfaceType_hdh1822: #E_IETFInterfaces_InterfaceType & 117

#IETFInterfaces_InterfaceType_hdlc: #E_IETFInterfaces_InterfaceType & 118

#IETFInterfaces_InterfaceType_hdsl2: #E_IETFInterfaces_InterfaceType & 119

#IETFInterfaces_InterfaceType_hiperlan2: #E_IETFInterfaces_InterfaceType & 120

#IETFInterfaces_InterfaceType_hippi: #E_IETFInterfaces_InterfaceType & 121

#IETFInterfaces_InterfaceType_hippiInterface: #E_IETFInterfaces_InterfaceType & 122

#IETFInterfaces_InterfaceType_homepna: #E_IETFInterfaces_InterfaceType & 123

#IETFInterfaces_InterfaceType_hostPad: #E_IETFInterfaces_InterfaceType & 124

#IETFInterfaces_InterfaceType_hssi: #E_IETFInterfaces_InterfaceType & 125

#IETFInterfaces_InterfaceType_hyperchannel: #E_IETFInterfaces_InterfaceType & 126

#IETFInterfaces_InterfaceType_iana_interface_type: #E_IETFInterfaces_InterfaceType & 127

#IETFInterfaces_InterfaceType_ibm370parChan: #E_IETFInterfaces_InterfaceType & 128

#IETFInterfaces_InterfaceType_idsl: #E_IETFInterfaces_InterfaceType & 129

#IETFInterfaces_InterfaceType_ieee1394: #E_IETFInterfaces_InterfaceType & 130

#IETFInterfaces_InterfaceType_ieee80211: #E_IETFInterfaces_InterfaceType & 131

#IETFInterfaces_InterfaceType_ieee80212: #E_IETFInterfaces_InterfaceType & 132

#IETFInterfaces_InterfaceType_ieee802154: #E_IETFInterfaces_InterfaceType & 133

#IETFInterfaces_InterfaceType_ieee80216WMAN: #E_IETFInterfaces_InterfaceType & 134

#IETFInterfaces_InterfaceType_ieee8023adLag: #E_IETFInterfaces_InterfaceType & 135

#IETFInterfaces_InterfaceType_if_gsn: #E_IETFInterfaces_InterfaceType & 136

#IETFInterfaces_InterfaceType_ifPwType: #E_IETFInterfaces_InterfaceType & 137

#IETFInterfaces_InterfaceType_ifVfiType: #E_IETFInterfaces_InterfaceType & 138

#IETFInterfaces_InterfaceType_ilan: #E_IETFInterfaces_InterfaceType & 139

#IETFInterfaces_InterfaceType_imt: #E_IETFInterfaces_InterfaceType & 140

#IETFInterfaces_InterfaceType_infiniband: #E_IETFInterfaces_InterfaceType & 141

#IETFInterfaces_InterfaceType_interleave: #E_IETFInterfaces_InterfaceType & 142

#IETFInterfaces_InterfaceType_ip: #E_IETFInterfaces_InterfaceType & 143

#IETFInterfaces_InterfaceType_ipForward: #E_IETFInterfaces_InterfaceType & 144

#IETFInterfaces_InterfaceType_ipOverAtm: #E_IETFInterfaces_InterfaceType & 145

#IETFInterfaces_InterfaceType_ipOverCdlc: #E_IETFInterfaces_InterfaceType & 146

#IETFInterfaces_InterfaceType_ipOverClaw: #E_IETFInterfaces_InterfaceType & 147

#IETFInterfaces_InterfaceType_ipSwitch: #E_IETFInterfaces_InterfaceType & 148

#IETFInterfaces_InterfaceType_isdn: #E_IETFInterfaces_InterfaceType & 149

#IETFInterfaces_InterfaceType_isdns: #E_IETFInterfaces_InterfaceType & 150

#IETFInterfaces_InterfaceType_isdnu: #E_IETFInterfaces_InterfaceType & 151

#IETFInterfaces_InterfaceType_iso88022llc: #E_IETFInterfaces_InterfaceType & 152

#IETFInterfaces_InterfaceType_iso88023Csmacd: #E_IETFInterfaces_InterfaceType & 153

#IETFInterfaces_InterfaceType_iso88024TokenBus: #E_IETFInterfaces_InterfaceType & 154

#IETFInterfaces_InterfaceType_iso88025CRFPInt: #E_IETFInterfaces_InterfaceType & 155

#IETFInterfaces_InterfaceType_iso88025Dtr: #E_IETFInterfaces_InterfaceType & 156

#IETFInterfaces_InterfaceType_iso88025Fiber: #E_IETFInterfaces_InterfaceType & 157

#IETFInterfaces_InterfaceType_iso88025TokenRing: #E_IETFInterfaces_InterfaceType & 158

#IETFInterfaces_InterfaceType_iso88026Man: #E_IETFInterfaces_InterfaceType & 159

#IETFInterfaces_InterfaceType_isup: #E_IETFInterfaces_InterfaceType & 160

#IETFInterfaces_InterfaceType_l2vlan: #E_IETFInterfaces_InterfaceType & 161

#IETFInterfaces_InterfaceType_l3ipvlan: #E_IETFInterfaces_InterfaceType & 162

#IETFInterfaces_InterfaceType_l3ipxvlan: #E_IETFInterfaces_InterfaceType & 163

#IETFInterfaces_InterfaceType_lapb: #E_IETFInterfaces_InterfaceType & 164

#IETFInterfaces_InterfaceType_lapd: #E_IETFInterfaces_InterfaceType & 165

#IETFInterfaces_InterfaceType_lapf: #E_IETFInterfaces_InterfaceType & 166

#IETFInterfaces_InterfaceType_linegroup: #E_IETFInterfaces_InterfaceType & 167

#IETFInterfaces_InterfaceType_lmp: #E_IETFInterfaces_InterfaceType & 168

#IETFInterfaces_InterfaceType_localTalk: #E_IETFInterfaces_InterfaceType & 169

#IETFInterfaces_InterfaceType_macSecControlledIF: #E_IETFInterfaces_InterfaceType & 170

#IETFInterfaces_InterfaceType_macSecUncontrolledIF: #E_IETFInterfaces_InterfaceType & 171

#IETFInterfaces_InterfaceType_mediaMailOverIp: #E_IETFInterfaces_InterfaceType & 172

#IETFInterfaces_InterfaceType_mfSigLink: #E_IETFInterfaces_InterfaceType & 173

#IETFInterfaces_InterfaceType_miox25: #E_IETFInterfaces_InterfaceType & 174

#IETFInterfaces_InterfaceType_mocaVersion1: #E_IETFInterfaces_InterfaceType & 175

#IETFInterfaces_InterfaceType_modem: #E_IETFInterfaces_InterfaceType & 176

#IETFInterfaces_InterfaceType_mpc: #E_IETFInterfaces_InterfaceType & 177

#IETFInterfaces_InterfaceType_mpegTransport: #E_IETFInterfaces_InterfaceType & 178

#IETFInterfaces_InterfaceType_mpls: #E_IETFInterfaces_InterfaceType & 179

#IETFInterfaces_InterfaceType_mplsTunnel: #E_IETFInterfaces_InterfaceType & 180

#IETFInterfaces_InterfaceType_msdsl: #E_IETFInterfaces_InterfaceType & 181

#IETFInterfaces_InterfaceType_mvl: #E_IETFInterfaces_InterfaceType & 182

#IETFInterfaces_InterfaceType_myrinet: #E_IETFInterfaces_InterfaceType & 183

#IETFInterfaces_InterfaceType_nfas: #E_IETFInterfaces_InterfaceType & 184

#IETFInterfaces_InterfaceType_nsip: #E_IETFInterfaces_InterfaceType & 185

#IETFInterfaces_InterfaceType_opticalChannel: #E_IETFInterfaces_InterfaceType & 186

#IETFInterfaces_InterfaceType_opticalChannelGroup: #E_IETFInterfaces_InterfaceType & 187

#IETFInterfaces_InterfaceType_opticalTransport: #E_IETFInterfaces_InterfaceType & 188

#IETFInterfaces_InterfaceType_other: #E_IETFInterfaces_InterfaceType & 189

#IETFInterfaces_InterfaceType_otnOdu: #E_IETFInterfaces_InterfaceType & 190

#IETFInterfaces_InterfaceType_otnOtu: #E_IETFInterfaces_InterfaceType & 191

#IETFInterfaces_InterfaceType_para: #E_IETFInterfaces_InterfaceType & 192

#IETFInterfaces_InterfaceType_pdnEtherLoop1: #E_IETFInterfaces_InterfaceType & 193

#IETFInterfaces_InterfaceType_pdnEtherLoop2: #E_IETFInterfaces_InterfaceType & 194

#IETFInterfaces_InterfaceType_pip: #E_IETFInterfaces_InterfaceType & 195

#IETFInterfaces_InterfaceType_plc: #E_IETFInterfaces_InterfaceType & 196

#IETFInterfaces_InterfaceType_pon155: #E_IETFInterfaces_InterfaceType & 197

#IETFInterfaces_InterfaceType_pon622: #E_IETFInterfaces_InterfaceType & 198

#IETFInterfaces_InterfaceType_pos: #E_IETFInterfaces_InterfaceType & 199

#IETFInterfaces_InterfaceType_ppp: #E_IETFInterfaces_InterfaceType & 200

#IETFInterfaces_InterfaceType_pppMultilinkBundle: #E_IETFInterfaces_InterfaceType & 201

#IETFInterfaces_InterfaceType_primaryISDN: #E_IETFInterfaces_InterfaceType & 202

#IETFInterfaces_InterfaceType_propAtm: #E_IETFInterfaces_InterfaceType & 203

#IETFInterfaces_InterfaceType_propBWAp2Mp: #E_IETFInterfaces_InterfaceType & 204

#IETFInterfaces_InterfaceType_propCnls: #E_IETFInterfaces_InterfaceType & 205

#IETFInterfaces_InterfaceType_propDocsWirelessDownstream: #E_IETFInterfaces_InterfaceType & 206

#IETFInterfaces_InterfaceType_propDocsWirelessMaclayer: #E_IETFInterfaces_InterfaceType & 207

#IETFInterfaces_InterfaceType_propDocsWirelessUpstream: #E_IETFInterfaces_InterfaceType & 208

#IETFInterfaces_InterfaceType_propMultiplexor: #E_IETFInterfaces_InterfaceType & 209

#IETFInterfaces_InterfaceType_propPointToPointSerial: #E_IETFInterfaces_InterfaceType & 210

#IETFInterfaces_InterfaceType_propVirtual: #E_IETFInterfaces_InterfaceType & 211

#IETFInterfaces_InterfaceType_propWirelessP2P: #E_IETFInterfaces_InterfaceType & 212

#IETFInterfaces_InterfaceType_proteon10Mbit: #E_IETFInterfaces_InterfaceType & 213

#IETFInterfaces_InterfaceType_proteon80Mbit: #E_IETFInterfaces_InterfaceType & 214

#IETFInterfaces_InterfaceType_ptm: #E_IETFInterfaces_InterfaceType & 215

#IETFInterfaces_InterfaceType_q2931: #E_IETFInterfaces_InterfaceType & 216

#IETFInterfaces_InterfaceType_qam: #E_IETFInterfaces_InterfaceType & 217

#IETFInterfaces_InterfaceType_qllc: #E_IETFInterfaces_InterfaceType & 218

#IETFInterfaces_InterfaceType_radioMAC: #E_IETFInterfaces_InterfaceType & 219

#IETFInterfaces_InterfaceType_radsl: #E_IETFInterfaces_InterfaceType & 220

#IETFInterfaces_InterfaceType_reachDSL: #E_IETFInterfaces_InterfaceType & 221

#IETFInterfaces_InterfaceType_regular1822: #E_IETFInterfaces_InterfaceType & 222

#IETFInterfaces_InterfaceType_rfc1483: #E_IETFInterfaces_InterfaceType & 223

#IETFInterfaces_InterfaceType_rfc877x25: #E_IETFInterfaces_InterfaceType & 224

#IETFInterfaces_InterfaceType_rpr: #E_IETFInterfaces_InterfaceType & 225

#IETFInterfaces_InterfaceType_rs232: #E_IETFInterfaces_InterfaceType & 226

#IETFInterfaces_InterfaceType_rsrb: #E_IETFInterfaces_InterfaceType & 227

#IETFInterfaces_InterfaceType_sdci: #E_IETFInterfaces_InterfaceType & 228

#IETFInterfaces_InterfaceType_sdlc: #E_IETFInterfaces_InterfaceType & 229

#IETFInterfaces_InterfaceType_sdsl: #E_IETFInterfaces_InterfaceType & 230

#IETFInterfaces_InterfaceType_shdsl: #E_IETFInterfaces_InterfaceType & 231

#IETFInterfaces_InterfaceType_sip: #E_IETFInterfaces_InterfaceType & 232

#IETFInterfaces_InterfaceType_sipSig: #E_IETFInterfaces_InterfaceType & 233

#IETFInterfaces_InterfaceType_sipTg: #E_IETFInterfaces_InterfaceType & 234

#IETFInterfaces_InterfaceType_sixToFour: #E_IETFInterfaces_InterfaceType & 235

#IETFInterfaces_InterfaceType_slip: #E_IETFInterfaces_InterfaceType & 236

#IETFInterfaces_InterfaceType_smdsDxi: #E_IETFInterfaces_InterfaceType & 237

#IETFInterfaces_InterfaceType_smdsIcip: #E_IETFInterfaces_InterfaceType & 238

#IETFInterfaces_InterfaceType_softwareLoopback: #E_IETFInterfaces_InterfaceType & 239

#IETFInterfaces_InterfaceType_sonet: #E_IETFInterfaces_InterfaceType & 240

#IETFInterfaces_InterfaceType_sonetOverheadChannel: #E_IETFInterfaces_InterfaceType & 241

#IETFInterfaces_InterfaceType_sonetPath: #E_IETFInterfaces_InterfaceType & 242

#IETFInterfaces_InterfaceType_sonetVT: #E_IETFInterfaces_InterfaceType & 243

#IETFInterfaces_InterfaceType_srp: #E_IETFInterfaces_InterfaceType & 244

#IETFInterfaces_InterfaceType_ss7SigLink: #E_IETFInterfaces_InterfaceType & 245

#IETFInterfaces_InterfaceType_stackToStack: #E_IETFInterfaces_InterfaceType & 246

#IETFInterfaces_InterfaceType_starLan: #E_IETFInterfaces_InterfaceType & 247

#IETFInterfaces_InterfaceType_tdlc: #E_IETFInterfaces_InterfaceType & 248

#IETFInterfaces_InterfaceType_teLink: #E_IETFInterfaces_InterfaceType & 249

#IETFInterfaces_InterfaceType_termPad: #E_IETFInterfaces_InterfaceType & 250

#IETFInterfaces_InterfaceType_tr008: #E_IETFInterfaces_InterfaceType & 251

#IETFInterfaces_InterfaceType_transpHdlc: #E_IETFInterfaces_InterfaceType & 252

#IETFInterfaces_InterfaceType_tunnel: #E_IETFInterfaces_InterfaceType & 253

#IETFInterfaces_InterfaceType_ultra: #E_IETFInterfaces_InterfaceType & 254

#IETFInterfaces_InterfaceType_usb: #E_IETFInterfaces_InterfaceType & 255

#IETFInterfaces_InterfaceType_v11: #E_IETFInterfaces_InterfaceType & 256

#IETFInterfaces_InterfaceType_v35: #E_IETFInterfaces_InterfaceType & 257

#IETFInterfaces_InterfaceType_v36: #E_IETFInterfaces_InterfaceType & 258

#IETFInterfaces_InterfaceType_v37: #E_IETFInterfaces_InterfaceType & 259

#IETFInterfaces_InterfaceType_vdsl: #E_IETFInterfaces_InterfaceType & 260

#IETFInterfaces_InterfaceType_vdsl2: #E_IETFInterfaces_InterfaceType & 261

#IETFInterfaces_InterfaceType_virtualIpAddress: #E_IETFInterfaces_InterfaceType & 262

#IETFInterfaces_InterfaceType_virtualTg: #E_IETFInterfaces_InterfaceType & 263

#IETFInterfaces_InterfaceType_vmwareNicTeam: #E_IETFInterfaces_InterfaceType & 264

#IETFInterfaces_InterfaceType_vmwareVirtualNic: #E_IETFInterfaces_InterfaceType & 265

#IETFInterfaces_InterfaceType_voiceDID: #E_IETFInterfaces_InterfaceType & 266

#IETFInterfaces_InterfaceType_voiceEBS: #E_IETFInterfaces_InterfaceType & 267

#IETFInterfaces_InterfaceType_voiceEM: #E_IETFInterfaces_InterfaceType & 268

#IETFInterfaces_InterfaceType_voiceEMFGD: #E_IETFInterfaces_InterfaceType & 269

#IETFInterfaces_InterfaceType_voiceEncap: #E_IETFInterfaces_InterfaceType & 270

#IETFInterfaces_InterfaceType_voiceFGDEANA: #E_IETFInterfaces_InterfaceType & 271

#IETFInterfaces_InterfaceType_voiceFGDOS: #E_IETFInterfaces_InterfaceType & 272

#IETFInterfaces_InterfaceType_voiceFXO: #E_IETFInterfaces_InterfaceType & 273

#IETFInterfaces_InterfaceType_voiceFXS: #E_IETFInterfaces_InterfaceType & 274

#IETFInterfaces_InterfaceType_voiceOverAtm: #E_IETFInterfaces_InterfaceType & 275

#IETFInterfaces_InterfaceType_voiceOverCable: #E_IETFInterfaces_InterfaceType & 276

#IETFInterfaces_InterfaceType_voiceOverFrameRelay: #E_IETFInterfaces_InterfaceType & 277

#IETFInterfaces_InterfaceType_voiceOverIp: #E_IETFInterfaces_InterfaceType & 278

#IETFInterfaces_InterfaceType_wwanPP: #E_IETFInterfaces_InterfaceType & 279

#IETFInterfaces_InterfaceType_wwanPP2: #E_IETFInterfaces_InterfaceType & 280

#IETFInterfaces_InterfaceType_x213: #E_IETFInterfaces_InterfaceType & 281

#IETFInterfaces_InterfaceType_x25huntGroup: #E_IETFInterfaces_InterfaceType & 282

#IETFInterfaces_InterfaceType_x25mlp: #E_IETFInterfaces_InterfaceType & 283

#IETFInterfaces_InterfaceType_x25ple: #E_IETFInterfaces_InterfaceType & 284

#IETFInterfaces_InterfaceType_x86Laps: #E_IETFInterfaces_InterfaceType & 285

#IETFInterfaces_InterfaceType_xboxWireless: #E_IETFInterfaces_InterfaceType & 286

#enumE_OpenconfigIfAggregate_AggregationType:
	#OpenconfigIfAggregate_AggregationType_UNSET |
	#OpenconfigIfAggregate_AggregationType_LACP |
	#OpenconfigIfAggregate_AggregationType_STATIC

#values_E_OpenconfigIfAggregate_AggregationType: {
	OpenconfigIfAggregate_AggregationType_UNSET:  #OpenconfigIfAggregate_AggregationType_UNSET
	OpenconfigIfAggregate_AggregationType_LACP:   #OpenconfigIfAggregate_AggregationType_LACP
	OpenconfigIfAggregate_AggregationType_STATIC: #OpenconfigIfAggregate_AggregationType_STATIC
}

#OpenconfigIfAggregate_AggregationType_UNSET: #E_OpenconfigIfAggregate_AggregationType & 0

#OpenconfigIfAggregate_AggregationType_LACP: #E_OpenconfigIfAggregate_AggregationType & 1

#OpenconfigIfAggregate_AggregationType_STATIC: #E_OpenconfigIfAggregate_AggregationType & 2

#enumE_OpenconfigIfEthernet_ETHERNET_SPEED:
	#OpenconfigIfEthernet_ETHERNET_SPEED_UNSET |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB_2LANE |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100MB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10MB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_1GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_4LANE |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_8LANE |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_2500MB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_25GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_400GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_40GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB_1LANE |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_5GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_600GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_800GB |
	#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_UNKNOWN

#values_E_OpenconfigIfEthernet_ETHERNET_SPEED: {
	OpenconfigIfEthernet_ETHERNET_SPEED_UNSET:             #OpenconfigIfEthernet_ETHERNET_SPEED_UNSET
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB:       #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB_2LANE: #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB_2LANE
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100MB:       #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100MB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10GB:        #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10MB:        #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10MB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_1GB:         #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_1GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB:       #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_4LANE: #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_4LANE
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_8LANE: #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_8LANE
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_2500MB:      #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_2500MB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_25GB:        #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_25GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_400GB:       #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_400GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_40GB:        #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_40GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB:        #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB_1LANE:  #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB_1LANE
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_5GB:         #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_5GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_600GB:       #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_600GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_800GB:       #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_800GB
	OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_UNKNOWN:     #OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_UNKNOWN
}

#OpenconfigIfEthernet_ETHERNET_SPEED_UNSET: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 0

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 1

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100GB_2LANE: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 2

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_100MB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 3

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 4

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_10MB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 5

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_1GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 6

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 7

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_4LANE: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 8

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_200GB_8LANE: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 9

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_2500MB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 10

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_25GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 11

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_400GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 12

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_40GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 13

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 14

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_50GB_1LANE: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 15

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_5GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 16

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_600GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 17

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_800GB: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 18

#OpenconfigIfEthernet_ETHERNET_SPEED_SPEED_UNKNOWN: #E_OpenconfigIfEthernet_ETHERNET_SPEED & 19

#enumE_OpenconfigIfEthernet_INTERFACE_FEC:
	#OpenconfigIfEthernet_INTERFACE_FEC_UNSET |
	#OpenconfigIfEthernet_INTERFACE_FEC_FEC_DISABLED |
	#OpenconfigIfEthernet_INTERFACE_FEC_FEC_FC |
	#OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS528 |
	#OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544 |
	#OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544_2X_INTERLEAVE

#values_E_OpenconfigIfEthernet_INTERFACE_FEC: {
	OpenconfigIfEthernet_INTERFACE_FEC_UNSET:                   #OpenconfigIfEthernet_INTERFACE_FEC_UNSET
	OpenconfigIfEthernet_INTERFACE_FEC_FEC_DISABLED:            #OpenconfigIfEthernet_INTERFACE_FEC_FEC_DISABLED
	OpenconfigIfEthernet_INTERFACE_FEC_FEC_FC:                  #OpenconfigIfEthernet_INTERFACE_FEC_FEC_FC
	OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS528:               #OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS528
	OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544:               #OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544
	OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544_2X_INTERLEAVE: #OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544_2X_INTERLEAVE
}

#OpenconfigIfEthernet_INTERFACE_FEC_UNSET: #E_OpenconfigIfEthernet_INTERFACE_FEC & 0

#OpenconfigIfEthernet_INTERFACE_FEC_FEC_DISABLED: #E_OpenconfigIfEthernet_INTERFACE_FEC & 1

#OpenconfigIfEthernet_INTERFACE_FEC_FEC_FC: #E_OpenconfigIfEthernet_INTERFACE_FEC & 2

#OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS528: #E_OpenconfigIfEthernet_INTERFACE_FEC & 3

#OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544: #E_OpenconfigIfEthernet_INTERFACE_FEC & 4

#OpenconfigIfEthernet_INTERFACE_FEC_FEC_RS544_2X_INTERLEAVE: #E_OpenconfigIfEthernet_INTERFACE_FEC & 5

#enumE_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode:
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_UNSET |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_FULL |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_HALF

#values_E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode: {
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_UNSET: #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_UNSET
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_FULL:  #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_FULL
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_HALF:  #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_HALF
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_UNSET: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode & 0

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_FULL: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode & 1

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode_HALF: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode & 2

#enumE_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding:
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_UNSET |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_DEFAULT |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25 |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25_BCH |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD20 |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD15 |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_HD7 |
	#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_G709

#values_E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding: {
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_UNSET:             #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_UNSET
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_DEFAULT:  #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_DEFAULT
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25:     #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25_BCH: #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25_BCH
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD20:     #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD20
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD15:     #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD15
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_HD7:      #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_HD7
	OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_G709:     #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_G709
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_UNSET: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 0

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_DEFAULT: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 1

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 2

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD25_BCH: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 3

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD20: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 4

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_SD15: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 5

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_HD7: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 6

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding_COHERENT_G709: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding & 7

#enumE_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode:
	#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_UNSET |
	#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_DISABLE |
	#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_REMOTE_ONLY |
	#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_ALL

#values_E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode: {
	OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_UNSET:       #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_UNSET
	OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_DISABLE:     #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_DISABLE
	OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_REMOTE_ONLY: #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_REMOTE_ONLY
	OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_ALL:         #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_ALL
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_UNSET: #E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode & 0

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_DISABLE: #E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode & 1

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_REMOTE_ONLY: #E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode & 2

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode_ALL: #E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode & 3

#enumE_OpenconfigVlanTypes_TPID_TYPES:
	#OpenconfigVlanTypes_TPID_TYPES_UNSET |
	#OpenconfigVlanTypes_TPID_TYPES_TPID_0X8100 |
	#OpenconfigVlanTypes_TPID_TYPES_TPID_0X88A8 |
	#OpenconfigVlanTypes_TPID_TYPES_TPID_0X9100 |
	#OpenconfigVlanTypes_TPID_TYPES_TPID_0X9200 |
	#OpenconfigVlanTypes_TPID_TYPES_TPID_ANY

#values_E_OpenconfigVlanTypes_TPID_TYPES: {
	OpenconfigVlanTypes_TPID_TYPES_UNSET:       #OpenconfigVlanTypes_TPID_TYPES_UNSET
	OpenconfigVlanTypes_TPID_TYPES_TPID_0X8100: #OpenconfigVlanTypes_TPID_TYPES_TPID_0X8100
	OpenconfigVlanTypes_TPID_TYPES_TPID_0X88A8: #OpenconfigVlanTypes_TPID_TYPES_TPID_0X88A8
	OpenconfigVlanTypes_TPID_TYPES_TPID_0X9100: #OpenconfigVlanTypes_TPID_TYPES_TPID_0X9100
	OpenconfigVlanTypes_TPID_TYPES_TPID_0X9200: #OpenconfigVlanTypes_TPID_TYPES_TPID_0X9200
	OpenconfigVlanTypes_TPID_TYPES_TPID_ANY:    #OpenconfigVlanTypes_TPID_TYPES_TPID_ANY
}

#OpenconfigVlanTypes_TPID_TYPES_UNSET: #E_OpenconfigVlanTypes_TPID_TYPES & 0

#OpenconfigVlanTypes_TPID_TYPES_TPID_0X8100: #E_OpenconfigVlanTypes_TPID_TYPES & 1

#OpenconfigVlanTypes_TPID_TYPES_TPID_0X88A8: #E_OpenconfigVlanTypes_TPID_TYPES & 2

#OpenconfigVlanTypes_TPID_TYPES_TPID_0X9100: #E_OpenconfigVlanTypes_TPID_TYPES & 3

#OpenconfigVlanTypes_TPID_TYPES_TPID_0X9200: #E_OpenconfigVlanTypes_TPID_TYPES & 4

#OpenconfigVlanTypes_TPID_TYPES_TPID_ANY: #E_OpenconfigVlanTypes_TPID_TYPES & 5

#enumE_OpenconfigVlan_VlanModeType:
	#OpenconfigVlan_VlanModeType_UNSET |
	#OpenconfigVlan_VlanModeType_ACCESS |
	#OpenconfigVlan_VlanModeType_TRUNK

#values_E_OpenconfigVlan_VlanModeType: {
	OpenconfigVlan_VlanModeType_UNSET:  #OpenconfigVlan_VlanModeType_UNSET
	OpenconfigVlan_VlanModeType_ACCESS: #OpenconfigVlan_VlanModeType_ACCESS
	OpenconfigVlan_VlanModeType_TRUNK:  #OpenconfigVlan_VlanModeType_TRUNK
}

#OpenconfigVlan_VlanModeType_UNSET: #E_OpenconfigVlan_VlanModeType & 0

#OpenconfigVlan_VlanModeType_ACCESS: #E_OpenconfigVlan_VlanModeType & 1

#OpenconfigVlan_VlanModeType_TRUNK: #E_OpenconfigVlan_VlanModeType & 2

#enumE_OpenconfigVlan_VlanStackAction:
	#OpenconfigVlan_VlanStackAction_UNSET |
	#OpenconfigVlan_VlanStackAction_PUSH |
	#OpenconfigVlan_VlanStackAction_POP |
	#OpenconfigVlan_VlanStackAction_SWAP

#values_E_OpenconfigVlan_VlanStackAction: {
	OpenconfigVlan_VlanStackAction_UNSET: #OpenconfigVlan_VlanStackAction_UNSET
	OpenconfigVlan_VlanStackAction_PUSH:  #OpenconfigVlan_VlanStackAction_PUSH
	OpenconfigVlan_VlanStackAction_POP:   #OpenconfigVlan_VlanStackAction_POP
	OpenconfigVlan_VlanStackAction_SWAP:  #OpenconfigVlan_VlanStackAction_SWAP
}

#OpenconfigVlan_VlanStackAction_UNSET: #E_OpenconfigVlan_VlanStackAction & 0

#OpenconfigVlan_VlanStackAction_PUSH: #E_OpenconfigVlan_VlanStackAction & 1

#OpenconfigVlan_VlanStackAction_POP: #E_OpenconfigVlan_VlanStackAction & 2

#OpenconfigVlan_VlanStackAction_SWAP:                                                         #E_OpenconfigVlan_VlanStackAction & 3
#E_AristaIntfAugments_FallbackEnum:                                                           "none" | "static" | "individual"
#E_AristaIntfAugments_ReflectorMacAction:                                                     "none" | "swap"
#E_OpenconfigIfEthernet_INTERFACE_FEC:                                                        "FEC_DISABLED" | "FEC_FC" | "FEC_RS528" | "FEC_RS544" | "FEC_RS544_2X_INTERLEAVE"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding: "COHERENT_G709" | "COHERENT_DEFAULT" | "COHERENT_SD25" | "COHERENT_SD25_BCH" | "COHERENT_SD20" | "COHERENT_SD15" | "COHERENT_HD7"
#E_OpenconfigVlanTypes_TPID_TYPES:                                                            "TPID_0X8100" | "TPID_0X88A8" | "TPID_0X9100" | "TPID_0X9200" | "TPID_ANY"
#E_OpenconfigVlan_VlanModeType:                                                               "ACCESS" | "TRUNK"
#E_OpenconfigIfEthernet_ETHERNET_SPEED:                                                       "SPEED_100MB" | "SPEED_10GB" | "SPEED_200GB_8LANE" | "SPEED_2500MB" | "SPEED_400GB" | "SPEED_UNKNOWN" | "SPEED_100GB_2LANE" | "SPEED_1GB" | "SPEED_200GB" | "SPEED_40GB" | "SPEED_50GB_1LANE" | "SPEED_5GB" | "SPEED_100GB" | "SPEED_50GB" | "SPEED_600GB" | "SPEED_800GB" | "SPEED_25GB" | "SPEED_200GB_4LANE" | "SPEED_10MB"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode:                      "FULL" | "HALF"
#E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode:            "DISABLE" | "REMOTE_ONLY" | "ALL"
#E_OpenconfigVlan_VlanStackAction:                                                            "PUSH" | "POP" | "SWAP"
#E_AristaIntfAugments_AristaAddrType:                                                         "SECONDARY" | "IPV6" | "PRIMARY"
#E_AristaIntfAugments_ReflectorDirection:                                                     "none" | "in" | "out"
#E_IETFInterfaces_InterfaceType:                                                              "atmIma" | "docsOfdmaUpstream" | "proteon80Mbit" | "isup" | "smdsIcip" | "vmwareVirtualNic" | "aal5" | "docsCableNdf" | "hssi" | "l3ipxvlan" | "actelisMetaLOOP" | "g9981" | "hippiInterface" | "aflane8023" | "mpc" | "regular1822" | "x25huntGroup" | "docsCableNdr" | "docsCableScte55d1RetOob" | "iso88025CRFPInt" | "msdsl" | "srp" | "voiceEMFGD" | "aluGponOnu" | "ipOverCdlc" | "propVirtual" | "mpls" | "sipSig" | "termPad" | "frameRelay" | "hdh1822" | "l2vlan" | "sixToFour" | "fastEtherFX" | "ifVfiType" | "ddnX25" | "dvbAsiIn" | "frDlciEndPt" | "pon622" | "propWirelessP2P" | "g703at2mb" | "other" | "v35" | "x213" | "aluELP" | "atmRadio" | "docsOfdmDownstream" | "myrinet" | "ds1" | "frf16MfrBundle" | "imt" | "mvl" | "sdci" | "sip" | "async" | "iso88025Fiber" | "ds0Bundle" | "sdlc" | "idsl" | "atmVirtual" | "ds1FDL" | "ieee1394" | "iso88025Dtr" | "miox25" | "atmbond" | "ds3" | "pppMultilinkBundle" | "teLink" | "vmwareNicTeam" | "voiceEncap" | "dvbRccDownstream" | "g703at64k" | "iso88026Man" | "lmp" | "propAtm" | "usb" | "atmLogical" | "dtm" | "fast" | "frForward" | "lapf" | "mpegTransport" | "virtualTg" | "docsCableUpstreamRfPort" | "frameRelayInterconnect" | "h323Gatekeeper" | "ilan" | "rs232" | "tdlc" | "aluGponPhysicalUni" | "atmFuni" | "lapb" | "macSecUncontrolledIF" | "sdsl" | "wwanPP2" | "aluEponLogicalLink" | "arcnet" | "adsl2plus" | "docsCableMCmtsDownstream" | "mplsTunnel" | "opticalTransport" | "a12MppSwitch" | "atmSubInterface" | "cblVectaStar" | "tr008" | "x25mlp" | "capwapDot11Profile" | "g9982" | "ipSwitch" | "shdsl" | "basicISDN" | "ces" | "econet" | "lapd" | "otnOtu" | "pdnEtherLoop1" | "atm" | "aviciOpticalEther" | "capwapDot11Bss" | "iso88025TokenRing" | "slip" | "voiceFGDOS" | "dvbRccMacLayer" | "rfc877x25" | "voiceEBS" | "voiceOverFrameRelay" | "bgppolicyaccounting" | "fibreChannel" | "opticalChannelGroup" | "rfc1483" | "virtualIpAddress" | "voiceOverAtm" | "ethernet3Mbit" | "fastEther" | "fcipLink" | "gfast" | "mocaVersion1" | "xboxWireless" | "cctEmul" | "eon" | "radioMAC" | "rpr" | "ss7SigLink" | "x86Laps" | "cableDownstreamRfPort" | "dvbRccUpstream" | "plc" | "v11" | "voiceDID" | "voiceOverIp" | "atmDxi" | "ds0" | "g9983" | "gr303RDT" | "ipForward" | "voiceEM" | "arap" | "ppp" | "propDocsWirelessUpstream" | "propMultiplexor" | "rsrb" | "wwanPP" | "aflane8025" | "bits" | "capwapWtpVirtualRadio" | "gtp" | "nsip" | "pdnEtherLoop2" | "qllc" | "voiceFGDEANA" | "digitalPowerline" | "docsCableScte55d1FwdOob" | "hdlc" | "hdsl2" | "iana-interface-type" | "macSecControlledIF" | "ciscoISLvlan" | "docsCableMaclayer" | "dvbTdm" | "hyperchannel" | "vdsl2" | "dvbRcsMacLayer" | "sonet" | "ultra" | "v37" | "aluEponOnu" | "infiniband" | "isdnu" | "iso88022llc" | "propCnls" | "smdsDxi" | "hostPad" | "localTalk" | "transpHdlc" | "atmVciEndPt" | "docsCableUpstreamChannel" | "ethernetCsmacd" | "ieee80211" | "l3ipvlan" | "pip" | "aluEpon" | "dlsw" | "docsCableUpstream" | "voiceFXS" | "cnr" | "homepna" | "ieee8023adLag" | "pos" | "channel" | "dvbRcsTdma" | "fddi" | "ieee80212" | "arcnetPlus" | "propDocsWirelessMaclayer" | "proteon10Mbit" | "stackToStack" | "aluEponPhysicalUni" | "hippi" | "digitalWrapperOverheadChannel" | "x25ple" | "fastdsl" | "h323Proxy" | "otnOdu" | "propBWAp2Mp" | "e1" | "gpon" | "sonetVT" | "radsl" | "frameRelayMPI" | "frameRelayService" | "ieee802154" | "isdns" | "nfas" | "opticalChannel" | "sipTg" | "vdsl" | "bridge" | "coffee" | "dcn" | "ip" | "linegroup" | "reachDSL" | "adsl2" | "propPointToPointSerial" | "v36" | "adsl" | "mfSigLink" | "sonetPath" | "starLan" | "modem" | "q2931" | "bsc" | "docsCableScte55d2UsOob" | "ifPwType" | "ipOverAtm" | "isdn" | "mediaMailOverIp" | "qam" | "sonetOverheadChannel" | "compositeLink" | "gigabitEthernet" | "iso88024TokenBus" | "para" | "primaryISDN" | "softwareLoopback" | "dvbAsiOut" | "ibm370parChan" | "ieee80216WMAN" | "voiceOverCable" | "escon" | "iso88023Csmacd" | "pon155" | "docsCableDownstream" | "ipOverClaw" | "voiceFXO" | "aal2" | "gfp" | "hiperlan2" | "if-gsn" | "interleave" | "ptm" | "docsCableScte55d2DsOob" | "eplrs" | "propDocsWirelessDownstream" | "gr303IDT" | "tunnel"
#E_OpenconfigIfAggregate_AggregationType:                                                     "LACP" | "STATIC"
_check: {
	for e in interface {(e.config.name): true}
}
if len(_check) != len(interface) {_|_}
_check: {
	for e in address {(e.config.ip): true}
}
if len(_check) != len(address) {_|_}
_check: {
	for e in vrrpgroup {(e.config.virtualrouterid): true}
}
if len(_check) != len(vrrpgroup) {_|_}
_check: {
	for e in virtualaddresses {(e.config.addr): true}
}
if len(_check) != len(virtualaddresses) {_|_}
_check: {
	for e in trackinterface {(e.config.name): true}
}
if len(_check) != len(trackinterface) {_|_}
_check: {
	for e in neighbor {(e.config.ip): true}
}
if len(_check) != len(neighbor) {_|_}
_check: {
	for e in address {(e.config.ip): true}
}
if len(_check) != len(address) {_|_}
_check: {
	for e in vrrpgroup {(e.config.virtualrouterid): true}
}
if len(_check) != len(vrrpgroup) {_|_}
_check: {
	for e in virtualaddresses {(e.config.addr): true}
}
if len(_check) != len(virtualaddresses) {_|_}
_check: {
	for e in trackinterface {(e.config.name): true}
}
if len(_check) != len(trackinterface) {_|_}
_check: {
	for e in neighbor {(e.config.ip): true}
}
if len(_check) != len(neighbor) {_|_}
_check: {
	for e in subinterface {(e.config.index): true}
}
if len(_check) != len(subinterface) {_|_}
_check: {
	for e in address {(e.config.ip): true}
}
if len(_check) != len(address) {_|_}
_check: {
	for e in vrrpgroup {(e.config.virtualrouterid): true}
}
if len(_check) != len(vrrpgroup) {_|_}
_check: {
	for e in virtualaddresses {(e.config.addr): true}
}
if len(_check) != len(virtualaddresses) {_|_}
_check: {
	for e in trackinterface {(e.config.name): true}
}
if len(_check) != len(trackinterface) {_|_}
_check: {
	for e in neighbor {(e.config.ip): true}
}
if len(_check) != len(neighbor) {_|_}
_check: {
	for e in address {(e.config.ip): true}
}
if len(_check) != len(address) {_|_}
_check: {
	for e in vrrpgroup {(e.config.virtualrouterid): true}
}
if len(_check) != len(vrrpgroup) {_|_}
_check: {
	for e in virtualaddresses {(e.config.addr): true}
}
if len(_check) != len(virtualaddresses) {_|_}
_check: {
	for e in trackinterface {(e.config.name): true}
}
if len(_check) != len(trackinterface) {_|_}
_check: {
	for e in neighbor {(e.config.ip): true}
}
if len(_check) != len(neighbor) {_|_}
