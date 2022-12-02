package yang

import "strings"

#Binary: bytes

#YANGEmpty: bool

#Device: {
	acl?:                 null | #OpenconfigAcl_Acl                          @go(Acl,*OpenconfigAcl_Acl)
	bfd?:                 null | #OpenconfigBfd_Bfd                          @go(Bfd,*OpenconfigBfd_Bfd)
	interfaces?:          null | #OpenconfigInterfaces_Interfaces            @go(Interfaces,*OpenconfigInterfaces_Interfaces)
	keychains?:           null | #OpenconfigKeychain_Keychains               @go(Keychains,*OpenconfigKeychain_Keychains)
	"network-instances"?: null | #OpenconfigNetworkInstance_NetworkInstances @go(NetworkInstances,*OpenconfigNetworkInstance_NetworkInstances)
	"routing-policy"?:    null | #OpenconfigRoutingPolicy_RoutingPolicy      @go(RoutingPolicy,*OpenconfigRoutingPolicy_RoutingPolicy)
}

#OpenconfigAcl_Acl: {
	"acl-sets"?: null | #OpenconfigAcl_Acl_AclSets    @go(AclSets,*OpenconfigAcl_Acl_AclSets)
	config?:     null | #OpenconfigAcl_Acl_Config     @go(Config,*OpenconfigAcl_Acl_Config)
	interfaces?: null | #OpenconfigAcl_Acl_Interfaces @go(Interfaces,*OpenconfigAcl_Acl_Interfaces)
}

#OpenconfigAcl_Acl_AclSets: {
	X = "acl-set" : [...null | #OpenconfigAcl_Acl_AclSets_AclSet]
	_check: {
		for e in X {
			for k in strings.Split("name+type", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name+type", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigAcl_Acl_AclSets_AclSet_Key: {
	name: string                    @go(Name)
	type?: #E_OpenconfigAcl_ACL_TYPE @go(Type)
}

#OpenconfigAcl_Acl_AclSets_AclSet: {
	"acl-entries"?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries @go(AclEntries,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries)
	config?:        null | #OpenconfigAcl_Acl_AclSets_AclSet_Config     @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_Config)
	name?:          null | string                                       @go(Name,*string)
	type?:           #E_OpenconfigAcl_ACL_TYPE                           @go(Type)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries: {
	X = "acl-entry" : [...null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry]
	_check: {
		for e in X {
			for k in strings.Split("sequence-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("sequence-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry: {
	actions?:           null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Actions        @go(Actions,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Actions)
	config?:            null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Config         @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Config)
	"input-interface"?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface @go(InputInterface,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface)
	ipv4?:              null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4           @go(Ipv4,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4)
	ipv6?:              null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6           @go(Ipv6,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6)
	l2?:                null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2             @go(L2,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2)
	mpls?:              null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls           @go(Mpls,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls)
	"sequence-id"?:     null | uint32                                                               @go(SequenceId,*uint32)
	transport?:         null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport      @go(Transport,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Actions: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Actions_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Actions_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Actions_Config: {
	"forwarding-action"?: #E_OpenconfigAcl_FORWARDING_ACTION @go(ForwardingAction)
	"log-action"?:        #E_OpenconfigAcl_LOG_ACTION        @go(LogAction)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Config: {
	description?:   null | string @go(Description,*string)
	"sequence-id"?: null | uint32 @go(SequenceId,*uint32)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface: {
	config?:          null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_Config       @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_Config)
	"interface-ref"?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_InterfaceRef @go(InterfaceRef,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_InterfaceRef)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_Config: {
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_InterfaceRef: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_InterfaceRef_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_InterfaceRef_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_InputInterface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config: {
	"destination-address"?: null | string @go(DestinationAddress,*string)
	dscp?:                  null | uint8  @go(Dscp,*uint8)
	"dscp-set": [...uint8] @go(DscpSet,[]uint8)
	"hop-limit"?:      null | uint8                                                                     @go(HopLimit,*uint8)
	protocol:          #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config_Protocol_Union @go(Protocol)
	"source-address"?: null | string                                                                    @go(SourceAddress,*string)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config_Protocol_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config_Protocol_Union_E_OpenconfigPacketMatchTypes_IP_PROTOCOL: E_OpenconfigPacketMatchTypes_IP_PROTOCOL: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv4_Config_Protocol_Union_Uint8: Uint8: uint8

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config: {
	"destination-address"?:    null | string @go(DestinationAddress,*string)
	"destination-flow-label"?: null | uint32 @go(DestinationFlowLabel,*uint32)
	dscp?:                     null | uint8  @go(Dscp,*uint8)
	"dscp-set": [...uint8] @go(DscpSet,[]uint8)
	"hop-limit"?:         null | uint8                                                                     @go(HopLimit,*uint8)
	protocol:             #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config_Protocol_Union @go(Protocol)
	"source-address"?:    null | string                                                                    @go(SourceAddress,*string)
	"source-flow-label"?: null | uint32                                                                    @go(SourceFlowLabel,*uint32)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config_Protocol_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config_Protocol_Union_E_OpenconfigPacketMatchTypes_IP_PROTOCOL: E_OpenconfigPacketMatchTypes_IP_PROTOCOL: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Ipv6_Config_Protocol_Union_Uint8: Uint8: uint8

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config: {
	"destination-mac"?:      null | string                                                                   @go(DestinationMac,*string)
	"destination-mac-mask"?: null | string                                                                   @go(DestinationMacMask,*string)
	ethertype:               #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config_Ethertype_Union @go(Ethertype)
	"source-mac"?:           null | string                                                                   @go(SourceMac,*string)
	"source-mac-mask"?:      null | string                                                                   @go(SourceMacMask,*string)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config_Ethertype_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config_Ethertype_Union_E_OpenconfigPacketMatchTypes_ETHERTYPE: E_OpenconfigPacketMatchTypes_ETHERTYPE: #E_OpenconfigPacketMatchTypes_ETHERTYPE

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_L2_Config_Ethertype_Union_Uint16: Uint16: uint16

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config: {
	"end-label-value":   #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_Union   @go(EndLabelValue)
	"start-label-value": #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_Union @go(StartLabelValue)
	"traffic-class"?:    null | uint8                                                                            @go(TrafficClass,*uint8)
	"ttl-value"?:        null | uint8                                                                            @go(TtlValue,*uint8)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_Union_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue: E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_Union_Uint32: Uint32: uint32

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_Union_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue: E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_Union_Uint32: Uint32: uint32

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport: {
	config?: null | #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config @go(Config,*OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config: {
	"destination-port": #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_Union @go(DestinationPort)
	"source-port":      #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_Union      @go(SourcePort)
	"tcp-flags": [...#E_OpenconfigPacketMatchTypes_TCP_FLAGS] @go(TcpFlags,[]E_OpenconfigPacketMatchTypes_TCP_FLAGS)
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_Union_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort: E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_Union_String: String: string

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_Union_Uint16: Uint16: uint16

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_Union: _

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_Union_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort: E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_Union_String: String: string

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_Union_Uint16: Uint16: uint16

#OpenconfigAcl_Acl_AclSets_AclSet_Config: {
	description?: null | string             @go(Description,*string)
	name?:        null | string             @go(Name,*string)
	type?:         #E_OpenconfigAcl_ACL_TYPE @go(Type)
}

#OpenconfigAcl_Acl_Config: {
}

#OpenconfigAcl_Acl_Interfaces: {
	X = "interface" : [...null | #OpenconfigAcl_Acl_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigAcl_Acl_Interfaces_Interface: {
	config?:             null | #OpenconfigAcl_Acl_Interfaces_Interface_Config         @go(Config,*OpenconfigAcl_Acl_Interfaces_Interface_Config)
	"egress-acl-sets"?:  null | #OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets  @go(EgressAclSets,*OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets)
	id?:                 null | string                                                 @go(Id,*string)
	"ingress-acl-sets"?: null | #OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets @go(IngressAclSets,*OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets)
	"interface-ref"?:    null | #OpenconfigAcl_Acl_Interfaces_Interface_InterfaceRef   @go(InterfaceRef,*OpenconfigAcl_Acl_Interfaces_Interface_InterfaceRef)
}

#OpenconfigAcl_Acl_Interfaces_Interface_Config: {
	id?: null | string @go(Id,*string)
}

#OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets: {
	X = "egress-acl-set" : [...null | #OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets_EgressAclSet]
	_check: {
		for e in X {
			for k in strings.Split("set-name+type", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("set-name+type", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets_EgressAclSet_Key: {
	"set-name": string                    @go(SetName)
	type?:       #E_OpenconfigAcl_ACL_TYPE @go(Type)
}

#OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets_EgressAclSet: {
	config?:     null | #OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets_EgressAclSet_Config @go(Config,*OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets_EgressAclSet_Config)
	"set-name"?: null | string                                                                    @go(SetName,*string)
	type?:        #E_OpenconfigAcl_ACL_TYPE                                                        @go(Type)
}

#OpenconfigAcl_Acl_Interfaces_Interface_EgressAclSets_EgressAclSet_Config: {
	"set-name"?: null | string             @go(SetName,*string)
	type?:        #E_OpenconfigAcl_ACL_TYPE @go(Type)
}

#OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets: {
	X = "ingress-acl-set" : [...null | #OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets_IngressAclSet]
	_check: {
		for e in X {
			for k in strings.Split("set-name+type", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("set-name+type", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets_IngressAclSet_Key: {
	"set-name": string                    @go(SetName)
	type?:       #E_OpenconfigAcl_ACL_TYPE @go(Type)
}

#OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets_IngressAclSet: {
	config?:     null | #OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets_IngressAclSet_Config @go(Config,*OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets_IngressAclSet_Config)
	"set-name"?: null | string                                                                      @go(SetName,*string)
	type?:        #E_OpenconfigAcl_ACL_TYPE                                                          @go(Type)
}

#OpenconfigAcl_Acl_Interfaces_Interface_IngressAclSets_IngressAclSet_Config: {
	"set-name"?: null | string             @go(SetName,*string)
	type?:        #E_OpenconfigAcl_ACL_TYPE @go(Type)
}

#OpenconfigAcl_Acl_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigAcl_Acl_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigAcl_Acl_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigAcl_Acl_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigBfd_Bfd: {
	interfaces?: null | #OpenconfigBfd_Bfd_Interfaces @go(Interfaces,*OpenconfigBfd_Bfd_Interfaces)
}

#OpenconfigBfd_Bfd_Interfaces: {
	X = "interface" : [...null | #OpenconfigBfd_Bfd_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigBfd_Bfd_Interfaces_Interface: {
	config?:               null | #OpenconfigBfd_Bfd_Interfaces_Interface_Config           @go(Config,*OpenconfigBfd_Bfd_Interfaces_Interface_Config)
	id?:                   null | string                                                   @go(Id,*string)
	"interface-ref"?:      null | #OpenconfigBfd_Bfd_Interfaces_Interface_InterfaceRef     @go(InterfaceRef,*OpenconfigBfd_Bfd_Interfaces_Interface_InterfaceRef)
	"micro-bfd-sessions"?: null | #OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions @go(MicroBfdSessions,*OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions)
	peers?:                null | #OpenconfigBfd_Bfd_Interfaces_Interface_Peers            @go(Peers,*OpenconfigBfd_Bfd_Interfaces_Interface_Peers)
}

#OpenconfigBfd_Bfd_Interfaces_Interface_Config: {
	"desired-minimum-tx-interval"?: null | uint32 @go(DesiredMinimumTxInterval,*uint32)
	"detection-multiplier"?:        null | uint8  @go(DetectionMultiplier,*uint8)
	"enable-per-member-link"?:      null | bool   @go(EnablePerMemberLink,*bool)
	enabled?:                       null | bool   @go(Enabled,*bool)
	id?:                            null | string @go(Id,*string)
	"local-address"?:               null | string @go(LocalAddress,*string)
	"required-minimum-receive"?:    null | uint32 @go(RequiredMinimumReceive,*uint32)
}

#OpenconfigBfd_Bfd_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigBfd_Bfd_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigBfd_Bfd_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigBfd_Bfd_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions: {
	X = "micro-bfd-session" : [...null | #OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions_MicroBfdSession]
	_check: {
		for e in X {
			for k in strings.Split("member-interface", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("member-interface", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions_MicroBfdSession: {
	config?:             null | #OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions_MicroBfdSession_Config @go(Config,*OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions_MicroBfdSession_Config)
	"member-interface"?: null | string                                                                          @go(MemberInterface,*string)
}

#OpenconfigBfd_Bfd_Interfaces_Interface_MicroBfdSessions_MicroBfdSession_Config: {
	"local-address"?:    null | string @go(LocalAddress,*string)
	"member-interface"?: null | string @go(MemberInterface,*string)
	"remote-address"?:   null | string @go(RemoteAddress,*string)
}

#OpenconfigBfd_Bfd_Interfaces_Interface_Peers: {
}

#OpenconfigInterfaces_Interfaces: {
	X = "interface" : [...null | #OpenconfigInterfaces_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	fallback?:            #E_AristaIntfAugments_FallbackEnum       @go(Fallback)
	"fallback-timeout"?: null | uint16                            @go(FallbackTimeout,*uint16)
	"lag-type"?:          #E_OpenconfigIfAggregate_AggregationType @go(LagType)
	"min-links"?:        null | uint16                            @go(MinLinks,*uint16)
	mlag?:               null | uint16                            @go(Mlag,*uint16)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Aggregation_SwitchedVlan_Config: {
	"access-vlan"?:   null | uint16                  @go(AccessVlan,*uint16)
	"interface-mode"?: #E_OpenconfigVlan_VlanModeType @go(InterfaceMode)
	"native-vlan"?:   null | uint16                  @go(NativeVlan,*uint16)
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
	tpid?:             #E_OpenconfigVlanTypes_TPID_TYPES @go(Tpid)
	type?:             #E_IETFInterfaces_InterfaceType   @go(Type)
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
	"duplex-mode"?:               #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode       @go(DuplexMode)
	"enable-flow-control"?:      null | bool                                                                   @go(EnableFlowControl,*bool)
	"fec-encoding"?:             null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding @go(FecEncoding,*OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding)
	"fec-mode"?:                  #E_OpenconfigIfEthernet_INTERFACE_FEC                                         @go(FecMode)
	"mac-address"?:              null | string                                                                 @go(MacAddress,*string)
	"port-speed"?:                #E_OpenconfigIfEthernet_ETHERNET_SPEED                                        @go(PortSpeed)
	"sfp-1000base-t"?:           null | bool                                                                   @go(Sfp_1000BaseT,*bool)
	"standalone-link-training"?: null | bool                                                                   @go(StandaloneLinkTraining,*bool)
}

#OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding: {
	"coherent-fec-encoding"?: #E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding @go(CoherentFecEncoding)
	disabled?:               null | bool                                                                                  @go(Disabled,*bool)
	"fire-code"?:            null | bool                                                                                  @go(FireCode,*bool)
	"reed-solomon"?:         null | bool                                                                                  @go(ReedSolomon,*bool)
	"reed-solomon544"?:      null | bool                                                                                  @go(ReedSolomon544,*bool)
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
	"access-vlan"?:   null | uint16                  @go(AccessVlan,*uint16)
	"interface-mode"?: #E_OpenconfigVlan_VlanModeType @go(InterfaceMode)
	"native-vlan"?:   null | uint16                  @go(NativeVlan,*uint16)
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
	X = "address" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Config)
	ip?:     null | string                                                                              @go(Ip,*string)
	vrrp?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp   @go(Vrrp,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Config: {
	"addr-type"?:      #E_AristaIntfAugments_AristaAddrType @go(AddrType)
	ip?:              null | string                        @go(Ip,*string)
	"prefix-length"?: null | uint8                         @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp: {
	X = "vrrp-group" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup]
	_check: {
		for e in X {
			for k in strings.Split("virtual-router-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("virtual-router-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "virtual-addresses" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses]
	"virtual-router-id"?: null | uint8 @go(VirtualRouterId,*uint8)
	_check: {
		for e in X {
			for k in strings.Split("addr", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("addr", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:       null | string                        @go(Addr,*string)
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
	X = "track-interface" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "neighbor" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "address" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Config)
	ip?:     null | string                                                                              @go(Ip,*string)
	vrrp?:   null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp   @go(Vrrp,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Config: {
	ip?:              null | string @go(Ip,*string)
	"prefix-length"?: null | uint8  @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp: {
	X = "vrrp-group" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup]
	_check: {
		for e in X {
			for k in strings.Split("virtual-router-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("virtual-router-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "virtual-addresses" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses]
	"virtual-link-local"?: null | string @go(VirtualLinkLocal,*string)
	"virtual-router-id"?:  null | uint8  @go(VirtualRouterId,*uint8)
	_check: {
		for e in X {
			for k in strings.Split("addr", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("addr", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:       null | string                        @go(Addr,*string)
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
	X = "track-interface" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "neighbor" : [...null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv6_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "subinterface" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface]
	_check: {
		for e in X {
			for k in strings.Split("index", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("index", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "address" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Config)
	ip?:     null | string                                                                                              @go(Ip,*string)
	vrrp?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp   @go(Vrrp,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Config: {
	"addr-type"?:      #E_AristaIntfAugments_AristaAddrType @go(AddrType)
	ip?:              null | string                        @go(Ip,*string)
	"prefix-length"?: null | uint8                         @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp: {
	X = "vrrp-group" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup]
	_check: {
		for e in X {
			for k in strings.Split("virtual-router-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("virtual-router-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "virtual-addresses" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses]
	"virtual-router-id"?: null | uint8 @go(VirtualRouterId,*uint8)
	_check: {
		for e in X {
			for k in strings.Split("addr", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("addr", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:       null | string                        @go(Addr,*string)
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
	X = "track-interface" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "neighbor" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv4_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "address" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Config)
	ip?:     null | string                                                                                              @go(Ip,*string)
	vrrp?:   null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp   @go(Vrrp,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Config: {
	ip?:              null | string @go(Ip,*string)
	"prefix-length"?: null | uint8  @go(PrefixLength,*uint8)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp: {
	X = "vrrp-group" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup]
	_check: {
		for e in X {
			for k in strings.Split("virtual-router-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("virtual-router-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "virtual-addresses" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses]
	"virtual-link-local"?: null | string @go(VirtualLinkLocal,*string)
	"virtual-router-id"?:  null | uint8  @go(VirtualRouterId,*uint8)
	_check: {
		for e in X {
			for k in strings.Split("addr", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("addr", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses: {
	addr?:              null | string                                                                                                                                             @go(Addr,*string)
	"virtual-address"?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress @go(VirtualAddress,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_Config_VirtualAddresses_VirtualAddress: {
	addr?:       null | string                        @go(Addr,*string)
	"addr-type"?: #E_AristaIntfAugments_AristaAddrType @go(AddrType)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_InterfaceTracking_Config: {
	"priority-decrement"?: null | uint8 @go(PriorityDecrement,*uint8)
	"track-interface": [...string] @go(TrackInterface,[]string)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces: {
	X = "track-interface" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Addresses_Address_Vrrp_VrrpGroup_TrackInterfaces_TrackInterface]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	X = "neighbor" : [...null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Ipv6_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("ip", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
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
	"vlan-id"?:          null | uint16                     @go(VlanId,*uint16)
	"vlan-stack-action"?: #E_OpenconfigVlan_VlanStackAction @go(VlanStackAction)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping: {
	config?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping_Config @go(Config,*OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping_Config)
}

#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces_Subinterface_Vlan_IngressMapping_Config: {
	tpid?:                #E_OpenconfigVlanTypes_TPID_TYPES @go(Tpid)
	"vlan-id"?:          null | uint16                     @go(VlanId,*uint16)
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

#OpenconfigKeychain_Keychains: {
	X = "keychain" : [...null | #OpenconfigKeychain_Keychains_Keychain]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigKeychain_Keychains_Keychain: {
	config?: null | #OpenconfigKeychain_Keychains_Keychain_Config @go(Config,*OpenconfigKeychain_Keychains_Keychain_Config)
	keys?:   null | #OpenconfigKeychain_Keychains_Keychain_Keys   @go(Keys,*OpenconfigKeychain_Keychains_Keychain_Keys)
	name?:   null | string                                        @go(Name,*string)
}

#OpenconfigKeychain_Keychains_Keychain_Config: {
	name?:     null | string                                                 @go(Name,*string)
	tolerance: #OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_Union @go(Tolerance)
}

#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_Union: _

#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_Union_E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance: E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance: #E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance

#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_Union_Uint32: Uint32: uint32

#OpenconfigKeychain_Keychains_Keychain_Keys: {
	X = "key" : [...null | #OpenconfigKeychain_Keychains_Keychain_Keys_Key]
	_check: {
		for e in X {
			for k in strings.Split("key-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("key-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigKeychain_Keychains_Keychain_Keys_Key: {
	config?:             null | #OpenconfigKeychain_Keychains_Keychain_Keys_Key_Config          @go(Config,*OpenconfigKeychain_Keychains_Keychain_Keys_Key_Config)
	"key-id"?:           null | uint64                                                          @go(KeyId,*uint64)
	"receive-lifetime"?: null | #OpenconfigKeychain_Keychains_Keychain_Keys_Key_ReceiveLifetime @go(ReceiveLifetime,*OpenconfigKeychain_Keychains_Keychain_Keys_Key_ReceiveLifetime)
	"send-lifetime"?:    null | #OpenconfigKeychain_Keychains_Keychain_Keys_Key_SendLifetime    @go(SendLifetime,*OpenconfigKeychain_Keychains_Keychain_Keys_Key_SendLifetime)
}

#OpenconfigKeychain_Keychains_Keychain_Keys_Key_Config: {
	"crypto-algorithm"?: #E_OpenconfigKeychainTypes_CRYPTO_TYPE @go(CryptoAlgorithm)
	"key-id"?:          null | uint64                          @go(KeyId,*uint64)
	"secret-key"?:      null | string                          @go(SecretKey,*string)
}

#OpenconfigKeychain_Keychains_Keychain_Keys_Key_ReceiveLifetime: {
	config?: null | #OpenconfigKeychain_Keychains_Keychain_Keys_Key_ReceiveLifetime_Config @go(Config,*OpenconfigKeychain_Keychains_Keychain_Keys_Key_ReceiveLifetime_Config)
}

#OpenconfigKeychain_Keychains_Keychain_Keys_Key_ReceiveLifetime_Config: {
	"end-time"?:   null | uint64 @go(EndTime,*uint64)
	"start-time"?: null | uint64 @go(StartTime,*uint64)
}

#OpenconfigKeychain_Keychains_Keychain_Keys_Key_SendLifetime: {
	config?: null | #OpenconfigKeychain_Keychains_Keychain_Keys_Key_SendLifetime_Config @go(Config,*OpenconfigKeychain_Keychains_Keychain_Keys_Key_SendLifetime_Config)
}

#OpenconfigKeychain_Keychains_Keychain_Keys_Key_SendLifetime_Config: {
	"end-time"?:         null | uint64 @go(EndTime,*uint64)
	"send-and-receive"?: null | bool   @go(SendAndReceive,*bool)
	"start-time"?:       null | uint64 @go(StartTime,*uint64)
}

#OpenconfigNetworkInstance_NetworkInstances: {
	X = "network-instance" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance: {
	config?:                    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Config                @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Config)
	"connection-points"?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints      @go(ConnectionPoints,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints)
	encapsulation?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Encapsulation         @go(Encapsulation,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Encapsulation)
	evpn?:                      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn                  @go(Evpn,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn)
	fdb?:                       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb                   @go(Fdb,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb)
	"inter-instance-policies"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies @go(InterInstancePolicies,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies)
	interfaces?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces            @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces)
	mpls?:                      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls                  @go(Mpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls)
	name?:                      null | string                                                                            @go(Name,*string)
	"policy-forwarding"?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding      @go(PolicyForwarding,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding)
	protocols?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols             @go(Protocols,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols)
	"route-limits"?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits           @go(RouteLimits,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits)
	"segment-routing"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting        @go(SegmentRouting,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting)
	"table-connections"?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections      @go(TableConnections,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections)
	tables?:                    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables                @go(Tables,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables)
	vlans?:                     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans                 @go(Vlans,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Config: {
	description?: null | string @go(Description,*string)
	enabled?:     null | bool   @go(Enabled,*bool)
	"enabled-address-families": [...#E_OpenconfigTypes_ADDRESS_FAMILY] @go(EnabledAddressFamilies,[]E_OpenconfigTypes_ADDRESS_FAMILY)
	"fallback-network-instance"?: null | string                                           @go(FallbackNetworkInstance,*string)
	mtu?:                         null | uint16                                           @go(Mtu,*uint16)
	name?:                        null | string                                           @go(Name,*string)
	"route-distinguisher"?:       null | string                                           @go(RouteDistinguisher,*string)
	"router-id"?:                 null | string                                           @go(RouterId,*string)
	type?:                         #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints: {
	X = "connection-point" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint]
	_check: {
		for e in X {
			for k in strings.Split("connection-point-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("connection-point-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint: {
	config?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Config    @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Config)
	"connection-point-id"?: null | string                                                                                                 @go(ConnectionPointId,*string)
	endpoints?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints @go(Endpoints,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Config: {
	"connection-point-id"?: null | string @go(ConnectionPointId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints: {
	X = "endpoint" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint]
	_check: {
		for e in X {
			for k in strings.Split("endpoint-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("endpoint-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint: {
	config?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Config)
	"endpoint-id"?: null | string                                                                                                                 @go(EndpointId,*string)
	local?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Local  @go(Local,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Local)
	remote?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Remote @go(Remote,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Remote)
	vxlan?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Vxlan  @go(Vxlan,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Vxlan)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Config: {
	"endpoint-id"?: null | string                                   @go(EndpointId,*string)
	precedence?:    null | uint16                                   @go(Precedence,*uint16)
	type?:           #E_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Local: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Local_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Local_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Local_Config: {
	interface?:                 null | string @go(Interface,*string)
	"site-id"?:                 null | uint16 @go(SiteId,*uint16)
	"site-label-block-offset"?: null | uint16 @go(SiteLabelBlockOffset,*uint16)
	"site-label-block-size"?:   null | uint16 @go(SiteLabelBlockSize,*uint16)
	subinterface?:              null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Remote: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Remote_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Remote_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Remote_Config: {
	"remote-system"?:              null | string @go(RemoteSystem,*string)
	"site-id"?:                    null | uint16 @go(SiteId,*uint16)
	"virtual-circuit-identifier"?: null | uint32 @go(VirtualCircuitIdentifier,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Vxlan: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Vxlan_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Vxlan_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_ConnectionPoints_ConnectionPoint_Endpoints_Endpoint_Vxlan_Config: {
	description?:        null | string @go(Description,*string)
	enabled?:            null | bool   @go(Enabled,*bool)
	"source-interface"?: null | string @go(SourceInterface,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Encapsulation: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Encapsulation_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Encapsulation_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Encapsulation_Config: {
	"control-word"?:         null | bool                                             @go(ControlWord,*bool)
	"encapsulation-type"?:    #E_OpenconfigNetworkInstanceTypes_ENCAPSULATION         @go(EncapsulationType)
	"label-allocation-mode"?: #E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE @go(LabelAllocationMode)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn: {
	"ethernet-segments"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments @go(EthernetSegments,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments)
	"evpn-instances"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances    @go(EvpnInstances,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments: {
	X = "ethernet-segment" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment: {
	config?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config     @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config)
	"df-election"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection @go(DfElection,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection)
	name?:          null | string                                                                                                       @go(Name,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config: {
	esi:               #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_Union @go(Esi)
	"esi-type"?:        #E_OpenconfigEvpn_EsiType                                                                                          @go(EsiType)
	interface?:        null | string                                                                                                      @go(Interface,*string)
	name?:             null | string                                                                                                      @go(Name,*string)
	"redundancy-mode"?: #E_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE                                                                        @go(RedundancyMode)
	subinterface?:     null | uint32                                                                                                      @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config: {
	"df-election-method"?:  #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod @go(DfElectionMethod)
	"election-wait-time"?: null | uint32                                                                                                                          @go(ElectionWaitTime,*uint32)
	preference?:           null | uint16                                                                                                                          @go(Preference,*uint16)
	revertive?:            null | bool                                                                                                                            @go(Revertive,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances: {
	X = "evpn-instance" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance]
	_check: {
		for e in X {
			for k in strings.Split("evi", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("evi", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance: {
	config?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config             @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config)
	evi?:                    null | string                                                                                                         @go(Evi,*string)
	"import-export-policy"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy @go(ImportExportPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy)
	pbb?:                    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb                @go(Pbb,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb)
	vxlan?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan              @go(Vxlan,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config: {
	"encapsulation-type"?:  #E_OpenconfigNetworkInstanceTypes_ENCAPSULATION                                                                             @go(EncapsulationType)
	evi?:                  null | string                                                                                                               @go(Evi,*string)
	"multicast-group"?:    null | string                                                                                                               @go(MulticastGroup,*string)
	"multicast-mask"?:     null | string                                                                                                               @go(MulticastMask,*string)
	"replication-mode"?:    #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode        @go(ReplicationMode)
	"route-distinguisher": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_Union @go(RouteDistinguisher)
	"service-type"?:        #E_OpenconfigEvpnTypes_EVPN_TYPE                                                                                            @go(ServiceType)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config: {
	"export-route-target": [...#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_Union] @go(ExportRouteTarget,[]OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_Union)
	"import-route-target": [...#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_Union] @go(ImportRouteTarget,[]OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_Union)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb: {
	X = "b-component" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent]
	_check: {
		for e in X {
			for k in strings.Split("b-component-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("b-component-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent: {
	"b-component-name"?: null | string                                                                                                                 @go(BComponentName,*string)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_Config      @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_Config)
	"i-components"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents @go(IComponents,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_Config: {
	"b-component-name"?: null | string @go(BComponentName,*string)
	"backbone-src-mac"?: null | string @go(BackboneSrcMac,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents: {
	X = "i-component" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents_IComponent]
	_check: {
		for e in X {
			for k in strings.Split("i-sid", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("i-sid", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents_IComponent: {
	config?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents_IComponent_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents_IComponent_Config)
	"i-sid"?: null | uint32                                                                                                                                   @go(ISid,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Pbb_BComponent_IComponents_IComponent_Config: {
	"i-sid"?: null | uint32 @go(ISid,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan: {
	"anycast-source-interface"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_AnycastSourceInterface @go(AnycastSourceInterface,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_AnycastSourceInterface)
	config?:                     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_Config                 @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_AnycastSourceInterface: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_AnycastSourceInterface_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_AnycastSourceInterface_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_AnycastSourceInterface_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Vxlan_Config: {
	"host-reachability-bgp"?:             null | bool   @go(HostReachabilityBgp,*bool)
	"multicast-group"?:                   null | string @go(MulticastGroup,*string)
	"multicast-mask"?:                    null | string @go(MulticastMask,*string)
	"overlay-endpoint"?:                  null | string @go(OverlayEndpoint,*string)
	"overlay-endpoint-network-instance"?: null | string @go(OverlayEndpointNetworkInstance,*string)
	vni?:                                 null | uint32 @go(Vni,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb: {
	"arp-proxy"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_ArpProxy    @go(ArpProxy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_ArpProxy)
	config?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_Config      @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_Config)
	"mac-mobility"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacMobility @go(MacMobility,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacMobility)
	"mac-table"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable    @go(MacTable,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable)
	"nd-proxy"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_NdProxy     @go(NdProxy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_NdProxy)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_ArpProxy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_ArpProxy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_ArpProxy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_ArpProxy_Config: {
	"arp-suppression"?:                 null | bool   @go(ArpSuppression,*bool)
	"duplicate-ip-detection-interval"?: null | uint16 @go(DuplicateIpDetectionInterval,*uint16)
	enable?:                            null | bool   @go(Enable,*bool)
	"ip-mobility-threshold"?:           null | uint16 @go(IpMobilityThreshold,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_Config: {
	"anycast-gateway-mac"?:              null | string @go(AnycastGatewayMac,*string)
	"flood-unknown-unicast-supression"?: null | bool   @go(FloodUnknownUnicastSupression,*bool)
	"mac-aging-time"?:                   null | uint16 @go(MacAgingTime,*uint16)
	"mac-learning"?:                     null | bool   @go(MacLearning,*bool)
	"maximum-entries"?:                  null | uint16 @go(MaximumEntries,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacMobility: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacMobility_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacMobility_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacMobility_Config: {
	"duplicate-ip-detection-interval"?: null | uint16 @go(DuplicateIpDetectionInterval,*uint16)
	"ip-mobility-threshold"?:           null | uint16 @go(IpMobilityThreshold,*uint16)
	"mac-mobility"?:                    null | bool   @go(MacMobility,*bool)
	"mac-mobility-threshold"?:          null | uint8  @go(MacMobilityThreshold,*uint8)
	"mac-mobility-window"?:             null | uint16 @go(MacMobilityWindow,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable: {
	entries?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries @go(Entries,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries: {
	X = "entry" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry]
	_check: {
		for e in X {
			for k in strings.Split("mac-address+vlan", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("mac-address+vlan", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Key: {
	"mac-address": string @go(MacAddress)
	vlan:          uint16 @go(Vlan)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry: {
	config?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Config    @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Config)
	interface?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface @go(Interface,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface)
	"mac-address"?: null | string                                                                                           @go(MacAddress,*string)
	vlan?:          null | uint16                                                                                           @go(Vlan,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Config: {
	"mac-address"?: null | string @go(MacAddress,*string)
	vlan?:          null | uint16 @go(Vlan,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface: {
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_MacTable_Entries_Entry_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_NdProxy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_NdProxy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_NdProxy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Fdb_NdProxy_Config: {
	"duplicate-ip-detection-interval"?: null | uint16 @go(DuplicateIpDetectionInterval,*uint16)
	enable?:                            null | bool   @go(Enable,*bool)
	"ip-mobility-threshold"?:           null | uint16 @go(IpMobilityThreshold,*uint16)
	"nd-suppression"?:                  null | bool   @go(NdSuppression,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies: {
	"apply-policy"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ApplyPolicy        @go(ApplyPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ApplyPolicy)
	"import-export-policy"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy @go(ImportExportPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ApplyPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ApplyPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ApplyPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ApplyPolicy_Config: {
	"default-export-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultExportPolicy)
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"export-policy": [...string] @go(ExportPolicy,[]string)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config: {
	"export-route-target": [...#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ExportRouteTarget_Union] @go(ExportRouteTarget,[]OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ExportRouteTarget_Union)
	"import-route-target": [...#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ImportRouteTarget_Union] @go(ImportRouteTarget,[]OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ImportRouteTarget_Union)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ExportRouteTarget_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ExportRouteTarget_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ExportRouteTarget_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ImportRouteTarget_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ImportRouteTarget_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_InterInstancePolicies_ImportExportPolicy_Config_ImportRouteTarget_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config)
	id?:     null | string                                                                                  @go(Id,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config: {
	"associated-address-families": [...#E_OpenconfigTypes_ADDRESS_FAMILY] @go(AssociatedAddressFamilies,[]E_OpenconfigTypes_ADDRESS_FAMILY)
	id?:                   null | string                                                                                               @go(Id,*string)
	interface?:            null | string                                                                                               @go(Interface,*string)
	"irb-anycast-gateway"?: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway @go(IrbAnycastGateway)
	"mac-pinning"?:        null | bool                                                                                                 @go(MacPinning,*bool)
	subinterface?:         null | uint32                                                                                               @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls: {
	global?:                    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global                @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global)
	lsps?:                      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps                  @go(Lsps,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps)
	"signaling-protocols"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols    @go(SignalingProtocols,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols)
	"te-global-attributes"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes    @go(TeGlobalAttributes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes)
	"te-interface-attributes"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes @go(TeInterfaceAttributes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_Config)
	"interface-attributes"?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes @go(InterfaceAttributes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes)
	"reserved-label-blocks"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks @go(ReservedLabelBlocks,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_Config: {
	"null-label"?:       #E_OpenconfigMplsTypes_NULL_LABEL_TYPE          @go(NullLabel)
	"pw-encapsulation"?: #E_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION @go(PwEncapsulation)
	"ttl-propagation"?: null | bool                                     @go(TtlPropagation,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_Config       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_Config)
	"interface-id"?:  null | string                                                                                                             @go(InterfaceId,*string)
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_Config: {
	"interface-id"?: null | string @go(InterfaceId,*string)
	"mpls-enabled"?: null | bool   @go(MplsEnabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_InterfaceAttributes_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks: {
	X = "reserved-label-block" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock]
	_check: {
		for e in X {
			for k in strings.Split("local-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("local-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock: {
	config?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config)
	"local-id"?: null | string                                                                                                                @go(LocalId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config: {
	"local-id"?:   null | string                                                                                                                          @go(LocalId,*string)
	"lower-bound": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_Union @go(LowerBound)
	"upper-bound": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_Union @go(UpperBound)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps: {
	"constrained-path"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath   @go(ConstrainedPath,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath)
	"static-lsps"?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps        @go(StaticLsps,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps)
	"unconstrained-path"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath @go(UnconstrainedPath,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath: {
	"named-explicit-paths"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths @go(NamedExplicitPaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths)
	tunnels?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels            @go(Tunnels,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths: {
	X = "named-explicit-path" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath: {
	config?:                   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config               @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config)
	"explicit-route-objects"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects @go(ExplicitRouteObjects,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects)
	name?:                     null | string                                                                                                                                          @go(Name,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config: {
	name?:                      null | string                                                                                                                                        @go(Name,*string)
	"sid-protection-required"?: null | bool                                                                                                                                          @go(SidProtectionRequired,*bool)
	"sid-selection-mode"?:       #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode @go(SidSelectionMode)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects: {
	X = "explicit-route-object" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects_ExplicitRouteObject]
	_check: {
		for e in X {
			for k in strings.Split("index", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("index", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects_ExplicitRouteObject: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects_ExplicitRouteObject_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects_ExplicitRouteObject_Config)
	index?:  null | uint8                                                                                                                                                                      @go(Index,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_ExplicitRouteObjects_ExplicitRouteObject_Config: {
	address?:   null | string                 @go(Address,*string)
	"hop-type"?: #E_OpenconfigMpls_MplsHopType @go(HopType)
	index?:     null | uint8                  @go(Index,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels: {
	X = "tunnel" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel: {
	bandwidth?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth           @go(Bandwidth,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth)
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Config)
	name?:                    null | string                                                                                                                   @go(Name,*string)
	"p2p-tunnel-attributes"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes @go(P2PTunnelAttributes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth: {
	"auto-bandwidth"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth @go(AutoBandwidth,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth)
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_Config        @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth: {
	config?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Config    @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Config)
	overflow?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Overflow  @go(Overflow,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Overflow)
	underflow?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Underflow @go(Underflow,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Underflow)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Config: {
	"adjust-interval"?:  null | uint32 @go(AdjustInterval,*uint32)
	"adjust-threshold"?: null | uint8  @go(AdjustThreshold,*uint8)
	enabled?:            null | bool   @go(Enabled,*bool)
	"max-bw"?:           null | uint64 @go(MaxBw,*uint64)
	"min-bw"?:           null | uint64 @go(MinBw,*uint64)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Overflow: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Overflow_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Overflow_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Overflow_Config: {
	enabled?:               null | bool   @go(Enabled,*bool)
	"overflow-threshold"?:  null | uint8  @go(OverflowThreshold,*uint8)
	"trigger-event-count"?: null | uint16 @go(TriggerEventCount,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Underflow: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Underflow_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Underflow_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_AutoBandwidth_Underflow_Config: {
	enabled?:               null | bool   @go(Enabled,*bool)
	"trigger-event-count"?: null | uint16 @go(TriggerEventCount,*uint16)
	"underflow-threshold"?: null | uint8  @go(UnderflowThreshold,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Bandwidth_Config: {
	"set-bandwidth"?:     null | uint64                     @go(SetBandwidth,*uint64)
	"specification-type"?: #E_OpenconfigMpls_TeBandwidthType @go(SpecificationType)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_Config: {
	"admin-status"?:               #E_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS @go(AdminStatus)
	description?:                 null | string                              @go(Description,*string)
	"hold-priority"?:             null | uint8                               @go(HoldPriority,*uint8)
	metric?:                      null | int32                               @go(Metric,*int32)
	"metric-type"?:                #E_OpenconfigMplsTypes_LSP_METRIC_TYPE     @go(MetricType)
	name?:                        null | string                              @go(Name,*string)
	preference?:                  null | uint8                               @go(Preference,*uint8)
	"protection-style-requested"?: #E_OpenconfigMplsTypes_PROTECTION_TYPE     @go(ProtectionStyleRequested)
	"reoptimize-timer"?:          null | uint16                              @go(ReoptimizeTimer,*uint16)
	"setup-priority"?:            null | uint8                               @go(SetupPriority,*uint8)
	"shortcut-eligible"?:         null | bool                                @go(ShortcutEligible,*bool)
	"signaling-protocol"?:         #E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL @go(SignalingProtocol)
	"soft-preemption"?:           null | bool                                @go(SoftPreemption,*bool)
	source?:                      null | string                              @go(Source,*string)
	type?:                         #E_OpenconfigMplsTypes_TUNNEL_TYPE         @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes: {
	config?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_Config            @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_Config)
	"p2p-primary-path"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath    @go(P2PPrimaryPath,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath)
	"p2p-secondary-paths"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths @go(P2PSecondaryPaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_Config: {
	destination?: null | string @go(Destination,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath: {
	"p2p-primary-path": [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath] @go(P2PPrimaryPath,[]*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath: {
	"admin-groups"?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_AdminGroups                @go(AdminGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_AdminGroups)
	"candidate-secondary-paths"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths    @go(CandidateSecondaryPaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths)
	config?:                          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_Config                     @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_Config)
	name?:                            null | string                                                                                                                                                                            @go(Name,*string)
	"path-metric-bound-constraints"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints @go(PathMetricBoundConstraints,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_AdminGroups: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_AdminGroups_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_AdminGroups_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_AdminGroups_Config: {
	"exclude-group": [...string] @go(ExcludeGroup,[]string)
	"include-all-group": [...string] @go(IncludeAllGroup,[]string)
	"include-any-group": [...string] @go(IncludeAnyGroup,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths: {
	X = "candidate-secondary-path" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths_CandidateSecondaryPath]
	_check: {
		for e in X {
			for k in strings.Split("secondary-path", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("secondary-path", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths_CandidateSecondaryPath: {
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths_CandidateSecondaryPath_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths_CandidateSecondaryPath_Config)
	"secondary-path"?: null | string                                                                                                                                                                                                       @go(SecondaryPath,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_CandidateSecondaryPaths_CandidateSecondaryPath_Config: {
	priority?:         null | uint16 @go(Priority,*uint16)
	"secondary-path"?: null | string @go(SecondaryPath,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_Config: {
	"cspf-tiebreaker"?:          #E_OpenconfigMpls_CspfTieBreaking              @go(CspfTiebreaker)
	"explicit-path-name"?:      null | string                                  @go(ExplicitPathName,*string)
	"hold-priority"?:           null | uint8                                   @go(HoldPriority,*uint8)
	name?:                      null | string                                  @go(Name,*string)
	"path-computation-method"?:  #E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD @go(PathComputationMethod)
	"path-computation-server"?: null | string                                  @go(PathComputationServer,*string)
	"path-control"?:             #E_OpenconfigMpls_LspControlType               @go(PathControl)
	preference?:                null | uint8                                   @go(Preference,*uint8)
	"retry-timer"?:             null | uint16                                  @go(RetryTimer,*uint16)
	"setup-priority"?:          null | uint8                                   @go(SetupPriority,*uint8)
	"use-cspf"?:                null | bool                                    @go(UseCspf,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints: {
	X = "path-metric-bound-constraint" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint]
	_check: {
		for e in X {
			for k in strings.Split("type", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("type", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint_Config)
	type?:    #E_OpenconfigMplsTypes_PATH_METRIC_TYPE                                                                                                                                                                                   @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PPrimaryPath_P2PPrimaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint_Config: {
	"metric-upper-bound"?: null | uint64                           @go(MetricUpperBound,*uint64)
	type?:                  #E_OpenconfigMplsTypes_PATH_METRIC_TYPE @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths: {
	"p2p-secondary-path": [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath] @go(P2PSecondaryPath,[]*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath: {
	"admin-groups"?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_AdminGroups                @go(AdminGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_AdminGroups)
	config?:                          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_Config                     @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_Config)
	name?:                            null | string                                                                                                                                                                                 @go(Name,*string)
	"path-metric-bound-constraints"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints @go(PathMetricBoundConstraints,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_AdminGroups: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_AdminGroups_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_AdminGroups_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_AdminGroups_Config: {
	"exclude-group": [...string] @go(ExcludeGroup,[]string)
	"include-all-group": [...string] @go(IncludeAllGroup,[]string)
	"include-any-group": [...string] @go(IncludeAnyGroup,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_Config: {
	"cspf-tiebreaker"?:          #E_OpenconfigMpls_CspfTieBreaking              @go(CspfTiebreaker)
	"explicit-path-name"?:      null | string                                  @go(ExplicitPathName,*string)
	"hold-priority"?:           null | uint8                                   @go(HoldPriority,*uint8)
	name?:                      null | string                                  @go(Name,*string)
	"path-computation-method"?:  #E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD @go(PathComputationMethod)
	"path-computation-server"?: null | string                                  @go(PathComputationServer,*string)
	"path-control"?:             #E_OpenconfigMpls_LspControlType               @go(PathControl)
	preference?:                null | uint8                                   @go(Preference,*uint8)
	"retry-timer"?:             null | uint16                                  @go(RetryTimer,*uint16)
	"setup-priority"?:          null | uint8                                   @go(SetupPriority,*uint8)
	"use-cspf"?:                null | bool                                    @go(UseCspf,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints: {
	X = "path-metric-bound-constraint" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint]
	_check: {
		for e in X {
			for k in strings.Split("type", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("type", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint_Config)
	type?:    #E_OpenconfigMplsTypes_PATH_METRIC_TYPE                                                                                                                                                                                        @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_Tunnels_Tunnel_P2PTunnelAttributes_P2PSecondaryPaths_P2PSecondaryPath_PathMetricBoundConstraints_PathMetricBoundConstraint_Config: {
	"metric-upper-bound"?: null | uint64                           @go(MetricUpperBound,*uint64)
	type?:                  #E_OpenconfigMplsTypes_PATH_METRIC_TYPE @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps: {
	X = "static-lsp" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp: {
	config?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Config  @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Config)
	egress?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress  @go(Egress,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress)
	ingress?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress @go(Ingress,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress)
	name?:    null | string                                                                                             @go(Name,*string)
	transit?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit @go(Transit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Config: {
	name?: null | string @go(Name,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config: {
	"incoming-label": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_Union @go(IncomingLabel)
	"next-hop"?:      null | string                                                                                                                @go(NextHop,*string)
	"push-label":     #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_Union     @go(PushLabel)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config: {
	"incoming-label": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_IncomingLabel_Union @go(IncomingLabel)
	"next-hop"?:      null | string                                                                                                                 @go(NextHop,*string)
	"push-label":     #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_PushLabel_Union     @go(PushLabel)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_IncomingLabel_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_IncomingLabel_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_IncomingLabel_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_PushLabel_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_PushLabel_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Ingress_Config_PushLabel_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config: {
	"incoming-label": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_IncomingLabel_Union @go(IncomingLabel)
	"next-hop"?:      null | string                                                                                                                 @go(NextHop,*string)
	"push-label":     #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_PushLabel_Union     @go(PushLabel)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_IncomingLabel_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_IncomingLabel_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_IncomingLabel_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_PushLabel_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_PushLabel_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Transit_Config_PushLabel_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath: {
	"path-setup-protocol"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath_PathSetupProtocol @go(PathSetupProtocol,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath_PathSetupProtocol)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath_PathSetupProtocol: {
	ldp?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath_PathSetupProtocol_Ldp @go(Ldp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath_PathSetupProtocol_Ldp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_UnconstrainedPath_PathSetupProtocol_Ldp: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols: {
	ldp?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp            @go(Ldp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp)
	"rsvp-te"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe         @go(RsvpTe,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe)
	"segment-routing"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting @go(SegmentRouting,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp: {
	global?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global              @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global)
	"interface-attributes"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes @go(InterfaceAttributes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes)
	neighbors?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors           @go(Neighbors,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors)
	targeted?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted            @go(Targeted,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global: {
	authentication?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Authentication  @go(Authentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Authentication)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Config          @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Config)
	"graceful-restart"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_GracefulRestart @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_GracefulRestart)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Authentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Authentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Authentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Authentication_Config: {
	"authentication-key"?: null | string @go(AuthenticationKey,*string)
	enable?:               null | bool   @go(Enable,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_Config: {
	"lsr-id"?: null | string @go(LsrId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Global_GracefulRestart_Config: {
	enabled?:               null | bool   @go(Enabled,*bool)
	"forwarding-holdtime"?: null | uint16 @go(ForwardingHoldtime,*uint16)
	"helper-enable"?:       null | bool   @go(HelperEnable,*bool)
	"reconnect-time"?:      null | uint16 @go(ReconnectTime,*uint16)
	"recovery-time"?:       null | uint16 @go(RecoveryTime,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes: {
	config?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Config     @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Config)
	interfaces?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Config: {
	"hello-holdtime"?: null | uint16 @go(HelloHoldtime,*uint16)
	"hello-interval"?: null | uint16 @go(HelloInterval,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface: {
	"address-families"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies @go(AddressFamilies,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_Config          @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_Config)
	"interface-id"?:     null | string                                                                                                                                           @go(InterfaceId,*string)
	"interface-ref"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_InterfaceRef    @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies: {
	X = "address-family" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies_AddressFamily]
	_check: {
		for e in X {
			for k in strings.Split("afi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies_AddressFamily: {
	"afi-name"?: #E_OpenconfigMplsLdp_MplsLdpAfi                                                                                                                                              @go(AfiName)
	config?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies_AddressFamily_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies_AddressFamily_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_AddressFamilies_AddressFamily_Config: {
	"afi-name"?: #E_OpenconfigMplsLdp_MplsLdpAfi @go(AfiName)
	enabled?:   null | bool                     @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_Config: {
	"hello-holdtime"?: null | uint16 @go(HelloHoldtime,*uint16)
	"hello-interval"?: null | uint16 @go(HelloInterval,*uint16)
	"interface-id"?:   null | string @go(InterfaceId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_InterfaceAttributes_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors: {
	X = "neighbor" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("lsr-id+label-space-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("lsr-id+label-space-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Key: {
	"lsr-id":         string @go(LsrId)
	"label-space-id": uint16 @go(LabelSpaceId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor: {
	authentication?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Authentication @go(Authentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Authentication)
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Config         @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Config)
	"label-space-id"?: null | uint16                                                                                                                    @go(LabelSpaceId,*uint16)
	"lsr-id"?:         null | string                                                                                                                    @go(LsrId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Authentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Authentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Authentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Authentication_Config: {
	"authentication-key"?: null | string @go(AuthenticationKey,*string)
	enable?:               null | bool   @go(Enable,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Neighbors_Neighbor_Config: {
	"label-space-id"?: null | uint16 @go(LabelSpaceId,*uint16)
	"lsr-id"?:         null | string @go(LsrId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted: {
	"address-families"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies @go(AddressFamilies,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_Config          @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies: {
	X = "address-family" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily]
	_check: {
		for e in X {
			for k in strings.Split("afi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily: {
	"afi-name"?: #E_OpenconfigMplsLdp_MplsLdpAfi                                                                                                               @go(AfiName)
	config?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Config  @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Config)
	targets?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets @go(Targets,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Config: {
	"afi-name"?: #E_OpenconfigMplsLdp_MplsLdpAfi @go(AfiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets: {
	X = "target" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets_Target]
	_check: {
		for e in X {
			for k in strings.Split("remote-address", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("remote-address", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets_Target: {
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets_Target_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets_Target_Config)
	"remote-address"?: null | string                                                                                                                                               @go(RemoteAddress,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_AddressFamilies_AddressFamily_Targets_Target_Config: {
	enabled?:          null | bool   @go(Enabled,*bool)
	"hello-holdtime"?: null | uint16 @go(HelloHoldtime,*uint16)
	"hello-interval"?: null | uint16 @go(HelloInterval,*uint16)
	"local-address"?:  null | string @go(LocalAddress,*string)
	"remote-address"?: null | string @go(RemoteAddress,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_Ldp_Targeted_Config: {
	"hello-accept"?:   null | bool   @go(HelloAccept,*bool)
	"hello-holdtime"?: null | uint16 @go(HelloHoldtime,*uint16)
	"hello-interval"?: null | uint16 @go(HelloInterval,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe: {
	global?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global              @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global)
	"interface-attributes"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes @go(InterfaceAttributes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes)
	neighbors?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Neighbors           @go(Neighbors,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Neighbors)
	sessions?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Sessions            @go(Sessions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Sessions)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global: {
	"graceful-restart"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_GracefulRestart @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_GracefulRestart)
	hellos?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_Hellos          @go(Hellos,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_Hellos)
	"soft-preemption"?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_SoftPreemption  @go(SoftPreemption,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_SoftPreemption)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_GracefulRestart_Config: {
	enable?:          null | bool   @go(Enable,*bool)
	"recovery-time"?: null | uint32 @go(RecoveryTime,*uint32)
	"restart-time"?:  null | uint32 @go(RestartTime,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_Hellos: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_Hellos_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_Hellos_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_Hellos_Config: {
	"hello-interval"?:    null | uint16 @go(HelloInterval,*uint16)
	"refresh-reduction"?: null | bool   @go(RefreshReduction,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_SoftPreemption: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_SoftPreemption_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_SoftPreemption_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Global_SoftPreemption_Config: {
	enable?:                    null | bool   @go(Enable,*bool)
	"soft-preemption-timeout"?: null | uint16 @go(SoftPreemptionTimeout,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface: {
	authentication?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Authentication        @go(Authentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Authentication)
	"bandwidth-reservations"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_BandwidthReservations @go(BandwidthReservations,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_BandwidthReservations)
	config?:                   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Config                @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Config)
	hellos?:                   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Hellos                @go(Hellos,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Hellos)
	"interface-id"?:           null | string                                                                                                                                         @go(InterfaceId,*string)
	"interface-ref"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_InterfaceRef          @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_InterfaceRef)
	protection?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Protection            @go(Protection,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Protection)
	subscription?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Subscription          @go(Subscription,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Subscription)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Authentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Authentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Authentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Authentication_Config: {
	"authentication-key"?: null | string                         @go(AuthenticationKey,*string)
	"authentication-type"?: #E_OpenconfigMplsTypes_RSVP_AUTH_TYPE @go(AuthenticationType)
	enable?:               null | bool                           @go(Enable,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_BandwidthReservations: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Config: {
	"interface-id"?: null | string @go(InterfaceId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Hellos: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Hellos_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Hellos_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Hellos_Config: {
	"hello-interval"?:    null | uint16 @go(HelloInterval,*uint16)
	"refresh-reduction"?: null | bool   @go(RefreshReduction,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Protection: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Protection_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Protection_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Protection_Config: {
	"bypass-optimize-interval"?:       null | uint16                          @go(BypassOptimizeInterval,*uint16)
	"link-protection-style-requested"?: #E_OpenconfigMplsTypes_PROTECTION_TYPE @go(LinkProtectionStyleRequested)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Subscription: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Subscription_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Subscription_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_InterfaceAttributes_Interface_Subscription_Config: {
	subscription?: null | uint8 @go(Subscription,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Neighbors: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_RsvpTe_Sessions: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting: {
	"aggregate-sid-counters"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_AggregateSidCounters @go(AggregateSidCounters,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_AggregateSidCounters)
	interfaces?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces           @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_AggregateSidCounters: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_Config       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_Config)
	"interface-id"?:  null | string                                                                                                                               @go(InterfaceId,*string)
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_InterfaceRef)
	"sid-counters"?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_SidCounters  @go(SidCounters,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_SidCounters)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_Config: {
	"interface-id"?: null | string @go(InterfaceId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_SignalingProtocols_SegmentRouting_Interfaces_Interface_SidCounters: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes: {
	"mpls-admin-groups"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups @go(MplsAdminGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups)
	srlgs?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs           @go(Srlgs,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs)
	"te-lsp-timers"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_TeLspTimers     @go(TeLspTimers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_TeLspTimers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups: {
	X = "admin-group" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups_AdminGroup]
	_check: {
		for e in X {
			for k in strings.Split("admin-group-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("admin-group-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups_AdminGroup: {
	"admin-group-name"?: null | string                                                                                                                @go(AdminGroupName,*string)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups_AdminGroup_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups_AdminGroup_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_MplsAdminGroups_AdminGroup_Config: {
	"admin-group-name"?: null | string @go(AdminGroupName,*string)
	"bit-position"?:     null | uint32 @go(BitPosition,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs: {
	X = "srlg" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg: {
	config?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_Config            @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_Config)
	name?:                  null | string                                                                                                           @go(Name,*string)
	"static-srlg-members"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers @go(StaticSrlgMembers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_Config: {
	cost?:           null | uint32                          @go(Cost,*uint32)
	"flooding-type"?: #E_OpenconfigMpls_MplsSrlgFloodingType @go(FloodingType)
	name?:           null | string                          @go(Name,*string)
	value?:          null | uint32                          @go(Value,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers: {
	X = "members-list" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers_MembersList]
	_check: {
		for e in X {
			for k in strings.Split("from-address", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("from-address", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers_MembersList: {
	config?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers_MembersList_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers_MembersList_Config)
	"from-address"?: null | string                                                                                                                              @go(FromAddress,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_Srlgs_Srlg_StaticSrlgMembers_MembersList_Config: {
	"from-address"?: null | string @go(FromAddress,*string)
	"to-address"?:   null | string @go(ToAddress,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_TeLspTimers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_TeLspTimers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_TeLspTimers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeGlobalAttributes_TeLspTimers_Config: {
	"cleanup-delay"?:    null | uint16 @go(CleanupDelay,*uint16)
	"install-delay"?:    null | uint16 @go(InstallDelay,*uint16)
	"reoptimize-timer"?: null | uint16 @go(ReoptimizeTimer,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface: {
	config?:                   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_Config               @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_Config)
	"igp-flooding-bandwidth"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth @go(IgpFloodingBandwidth,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth)
	"interface-id"?:           null | string                                                                                                                @go(InterfaceId,*string)
	"interface-ref"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_InterfaceRef         @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_Config: {
	"admin-group": [...string] @go(AdminGroup,[]string)
	"interface-id"?: null | string @go(InterfaceId,*string)
	"srlg-membership": [...string] @go(SrlgMembership,[]string)
	"te-metric"?: null | uint32 @go(TeMetric,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config: {
	"delta-percentage"?: null | uint8 @go(DeltaPercentage,*uint8)
	"down-thresholds": [...uint8] @go(DownThresholds,[]uint8)
	"threshold-specification"?: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification @go(ThresholdSpecification)
	"threshold-type"?:          #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType          @go(ThresholdType)
	"up-down-thresholds": [...uint8] @go(UpDownThresholds,[]uint8)
	"up-thresholds": [...uint8] @go(UpThresholds,[]uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding: {
	interfaces?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces          @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces)
	"path-selection-groups"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups @go(PathSelectionGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups)
	policies?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies            @go(Policies,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_Config       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_Config)
	"interface-id"?:  null | string                                                                                                         @go(InterfaceId,*string)
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_Config: {
	"apply-forwarding-policy"?:    null | string @go(ApplyForwardingPolicy,*string)
	"apply-vrf-selection-policy"?: null | string @go(ApplyVrfSelectionPolicy,*string)
	"interface-id"?:               null | string @go(InterfaceId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups: {
	X = "path-selection-group" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups_PathSelectionGroup]
	_check: {
		for e in X {
			for k in strings.Split("group-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("group-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups_PathSelectionGroup: {
	config?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups_PathSelectionGroup_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups_PathSelectionGroup_Config)
	"group-id"?: null | string                                                                                                                     @go(GroupId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_PathSelectionGroups_PathSelectionGroup_Config: {
	"group-id"?: null | string @go(GroupId,*string)
	"mpls-lsp": [...string] @go(MplsLsp,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies: {
	X = "policy" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy]
	_check: {
		for e in X {
			for k in strings.Split("policy-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("policy-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy: {
	config?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config)
	"policy-id"?: null | string                                                                                              @go(PolicyId,*string)
	rules?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules  @go(Rules,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config: {
	"policy-id"?: null | string                                                                                              @go(PolicyId,*string)
	type?:         #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type @go(Type)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules: {
	X = "rule" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule]
	_check: {
		for e in X {
			for k in strings.Split("sequence-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("sequence-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule: {
	action?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action    @go(Action,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action)
	config?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Config    @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Config)
	ipv4?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4      @go(Ipv4,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4)
	ipv6?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6      @go(Ipv6,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6)
	l2?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2        @go(L2,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2)
	"sequence-id"?: null | uint32                                                                                                            @go(SequenceId,*uint32)
	transport?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport @go(Transport,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action: {
	config?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_Config         @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_Config)
	"encapsulate-gre"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre @go(EncapsulateGre,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_Config: {
	"decapsulate-gre"?:         null | bool   @go(DecapsulateGre,*bool)
	"decapsulate-gue"?:         null | bool   @go(DecapsulateGue,*bool)
	"decapsulate-mpls-in-udp"?: null | bool   @go(DecapsulateMplsInUdp,*bool)
	discard?:                   null | bool   @go(Discard,*bool)
	"network-instance"?:        null | string @go(NetworkInstance,*string)
	"next-hop"?:                null | string @go(NextHop,*string)
	"path-selection-group"?:    null | string @go(PathSelectionGroup,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre: {
	config?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Config  @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Config)
	targets?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets @go(Targets,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Config: {
	"identifying-prefix"?: null | string @go(IdentifyingPrefix,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets: {
	X = "target" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets_Target]
	_check: {
		for e in X {
			for k in strings.Split("id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets_Target: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets_Target_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets_Target_Config)
	id?:     null | string                                                                                                                                              @go(Id,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Action_EncapsulateGre_Targets_Target_Config: {
	destination?: null | string @go(Destination,*string)
	id?:          null | string @go(Id,*string)
	"ip-ttl"?:    null | uint8  @go(IpTtl,*uint8)
	source?:      null | string @go(Source,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Config: {
	"sequence-id"?: null | uint32 @go(SequenceId,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config: {
	"destination-address"?: null | string @go(DestinationAddress,*string)
	dscp?:                  null | uint8  @go(Dscp,*uint8)
	"dscp-set": [...uint8] @go(DscpSet,[]uint8)
	"hop-limit"?:      null | uint8                                                                                                                       @go(HopLimit,*uint8)
	protocol:          #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config_Protocol_Union @go(Protocol)
	"source-address"?: null | string                                                                                                                      @go(SourceAddress,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config_Protocol_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config_Protocol_Union_E_OpenconfigPacketMatchTypes_IP_PROTOCOL: E_OpenconfigPacketMatchTypes_IP_PROTOCOL: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv4_Config_Protocol_Union_Uint8: Uint8: uint8

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config: {
	"destination-address"?:    null | string @go(DestinationAddress,*string)
	"destination-flow-label"?: null | uint32 @go(DestinationFlowLabel,*uint32)
	dscp?:                     null | uint8  @go(Dscp,*uint8)
	"dscp-set": [...uint8] @go(DscpSet,[]uint8)
	"hop-limit"?:         null | uint8                                                                                                                       @go(HopLimit,*uint8)
	protocol:             #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config_Protocol_Union @go(Protocol)
	"source-address"?:    null | string                                                                                                                      @go(SourceAddress,*string)
	"source-flow-label"?: null | uint32                                                                                                                      @go(SourceFlowLabel,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config_Protocol_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config_Protocol_Union_E_OpenconfigPacketMatchTypes_IP_PROTOCOL: E_OpenconfigPacketMatchTypes_IP_PROTOCOL: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Ipv6_Config_Protocol_Union_Uint8: Uint8: uint8

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config: {
	"destination-mac"?:      null | string                                                                                                                     @go(DestinationMac,*string)
	"destination-mac-mask"?: null | string                                                                                                                     @go(DestinationMacMask,*string)
	ethertype:               #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config_Ethertype_Union @go(Ethertype)
	"source-mac"?:           null | string                                                                                                                     @go(SourceMac,*string)
	"source-mac-mask"?:      null | string                                                                                                                     @go(SourceMacMask,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config_Ethertype_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config_Ethertype_Union_E_OpenconfigPacketMatchTypes_ETHERTYPE: E_OpenconfigPacketMatchTypes_ETHERTYPE: #E_OpenconfigPacketMatchTypes_ETHERTYPE

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_L2_Config_Ethertype_Union_Uint16: Uint16: uint16

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config: {
	"destination-port": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_DestinationPort_Union @go(DestinationPort)
	"source-port":      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_SourcePort_Union      @go(SourcePort)
	"tcp-flags": [...#E_OpenconfigPacketMatchTypes_TCP_FLAGS] @go(TcpFlags,[]E_OpenconfigPacketMatchTypes_TCP_FLAGS)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_DestinationPort_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_DestinationPort_Union_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort: E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_DestinationPort_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_DestinationPort_Union_Uint16: Uint16: uint16

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_SourcePort_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_SourcePort_Union_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort: E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_SourcePort_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Rules_Rule_Transport_Config_SourcePort_Union_Uint16: Uint16: uint16

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols: {
	X = "protocol" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol]
	_check: {
		for e in X {
			for k in strings.Split("identifier+name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("identifier+name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Key: {
	identifier?: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(Identifier)
	name:       string                                         @go(Name)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol: {
	bgp?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp             @go(Bgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Config          @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Config)
	identifier?:          #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE                                                        @go(Identifier)
	igmp?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp            @go(Igmp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp)
	isis?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis            @go(Isis,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis)
	"local-aggregates"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates @go(LocalAggregates,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates)
	name?:               null | string                                                                                         @go(Name,*string)
	ospfv2?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2          @go(Ospfv2,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2)
	pcep?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep            @go(Pcep,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep)
	pim?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim             @go(Pim,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim)
	"static-routes"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes    @go(StaticRoutes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp: {
	global?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global     @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global)
	neighbors?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors  @go(Neighbors,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors)
	"peer-groups"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups @go(PeerGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global: {
	"afi-safis"?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis                @go(AfiSafis,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis)
	confederation?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Confederation           @go(Confederation,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Confederation)
	config?:                      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Config                  @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Config)
	"default-route-distance"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DefaultRouteDistance    @go(DefaultRouteDistance,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DefaultRouteDistance)
	"dynamic-neighbor-prefixes"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes @go(DynamicNeighborPrefixes,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes)
	"graceful-restart"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_GracefulRestart         @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_GracefulRestart)
	"route-selection-options"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_RouteSelectionOptions   @go(RouteSelectionOptions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_RouteSelectionOptions)
	"use-multiple-paths"?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths        @go(UseMultiplePaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis: {
	X = "afi-safi" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi]
	_check: {
		for e in X {
			for k in strings.Split("afi-safi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-safi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi: {
	"add-paths"?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_AddPaths              @go(AddPaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_AddPaths)
	"afi-safi-name"?:            #E_OpenconfigBgpTypes_AFI_SAFI_TYPE                                                                                                     @go(AfiSafiName)
	config?:                    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Config                @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Config)
	"graceful-restart"?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_GracefulRestart       @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_GracefulRestart)
	"ipv4-labeled-unicast"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast    @go(Ipv4LabeledUnicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast)
	"ipv4-unicast"?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast           @go(Ipv4Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast)
	"ipv6-labeled-unicast"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast    @go(Ipv6LabeledUnicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast)
	"ipv6-unicast"?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast           @go(Ipv6Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast)
	"l2vpn-evpn"?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn             @go(L2VpnEvpn,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn)
	"l2vpn-vpls"?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls             @go(L2VpnVpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls)
	"l3vpn-ipv4-multicast"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast    @go(L3VpnIpv4Multicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast)
	"l3vpn-ipv4-unicast"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast      @go(L3VpnIpv4Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast)
	"l3vpn-ipv6-multicast"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast    @go(L3VpnIpv6Multicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast)
	"l3vpn-ipv6-unicast"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast      @go(L3VpnIpv6Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast)
	"route-selection-options"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_RouteSelectionOptions @go(RouteSelectionOptions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_RouteSelectionOptions)
	"srte-policy-ipv4"?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4        @go(SrtePolicyIpv4,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4)
	"srte-policy-ipv6"?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6        @go(SrtePolicyIpv6,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6)
	"use-multiple-paths"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths      @go(UseMultiplePaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_AddPaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_AddPaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_AddPaths_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_AddPaths_Config: {
	"eligible-prefix-policy"?: null | string @go(EligiblePrefixPolicy,*string)
	receive?:                  null | bool   @go(Receive,*bool)
	send?:                     null | bool   @go(Send,*bool)
	"send-max"?:               null | uint8  @go(SendMax,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Config: {
	"afi-safi-name"?: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE @go(AfiSafiName)
	enabled?:        null | bool                         @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_GracefulRestart_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_Config)
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_Config: {
	"extended-next-hop-encoding"?: null | bool @go(ExtendedNextHopEncoding,*bool)
	"send-default-route"?:         null | bool @go(SendDefaultRoute,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_Config)
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_Config: {
	"send-default-route"?: null | bool @go(SendDefaultRoute,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_RouteSelectionOptions: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_RouteSelectionOptions_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_RouteSelectionOptions_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_RouteSelectionOptions_Config: {
	"advertise-inactive-routes"?:  null | bool @go(AdvertiseInactiveRoutes,*bool)
	"always-compare-med"?:         null | bool @go(AlwaysCompareMed,*bool)
	"enable-aigp"?:                null | bool @go(EnableAigp,*bool)
	"external-compare-router-id"?: null | bool @go(ExternalCompareRouterId,*bool)
	"ignore-as-path-length"?:      null | bool @go(IgnoreAsPathLength,*bool)
	"ignore-next-hop-igp-metric"?: null | bool @go(IgnoreNextHopIgpMetric,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Config)
	ebgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp   @go(Ebgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp)
	ibgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp   @go(Ibgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config: {
	"allow-multiple-as"?: null | bool   @go(AllowMultipleAs,*bool)
	"maximum-paths"?:     null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp_Config: {
	"maximum-paths"?: null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Confederation: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Confederation_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Confederation_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Confederation_Config: {
	identifier?: null | uint32 @go(Identifier,*uint32)
	"member-as": [...uint32] @go(MemberAs,[]uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_Config: {
	as?:          null | uint32 @go(As,*uint32)
	"router-id"?: null | string @go(RouterId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DefaultRouteDistance: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DefaultRouteDistance_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DefaultRouteDistance_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DefaultRouteDistance_Config: {
	"external-route-distance"?: null | uint8 @go(ExternalRouteDistance,*uint8)
	"internal-route-distance"?: null | uint8 @go(InternalRouteDistance,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes: {
	X = "dynamic-neighbor-prefix" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes_DynamicNeighborPrefix]
	_check: {
		for e in X {
			for k in strings.Split("prefix", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("prefix", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes_DynamicNeighborPrefix: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes_DynamicNeighborPrefix_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes_DynamicNeighborPrefix_Config)
	prefix?: null | string                                                                                                                                         @go(Prefix,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_DynamicNeighborPrefixes_DynamicNeighborPrefix_Config: {
	"peer-group"?: null | string @go(PeerGroup,*string)
	prefix?:       null | string @go(Prefix,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_GracefulRestart_Config: {
	enabled?:             null | bool   @go(Enabled,*bool)
	"helper-only"?:       null | bool   @go(HelperOnly,*bool)
	"restart-time"?:      null | uint16 @go(RestartTime,*uint16)
	"stale-routes-time"?: null | uint16 @go(StaleRoutesTime,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_RouteSelectionOptions: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_RouteSelectionOptions_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_RouteSelectionOptions_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_RouteSelectionOptions_Config: {
	"advertise-inactive-routes"?:  null | bool @go(AdvertiseInactiveRoutes,*bool)
	"always-compare-med"?:         null | bool @go(AlwaysCompareMed,*bool)
	"enable-aigp"?:                null | bool @go(EnableAigp,*bool)
	"external-compare-router-id"?: null | bool @go(ExternalCompareRouterId,*bool)
	"ignore-as-path-length"?:      null | bool @go(IgnoreAsPathLength,*bool)
	"ignore-next-hop-igp-metric"?: null | bool @go(IgnoreNextHopIgpMetric,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Config)
	ebgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ebgp   @go(Ebgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ebgp)
	ibgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ibgp   @go(Ibgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ibgp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ebgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ebgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ebgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ebgp_Config: {
	"allow-multiple-as"?: null | bool   @go(AllowMultipleAs,*bool)
	"maximum-paths"?:     null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ibgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ibgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ibgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Global_UseMultiplePaths_Ibgp_Config: {
	"maximum-paths"?: null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors: {
	X = "neighbor" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("neighbor-address", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("neighbor-address", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor: {
	"afi-safis"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis         @go(AfiSafis,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis)
	"apply-policy"?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ApplyPolicy      @go(ApplyPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ApplyPolicy)
	"as-path-options"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AsPathOptions    @go(AsPathOptions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AsPathOptions)
	config?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Config           @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Config)
	"ebgp-multihop"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EbgpMultihop     @go(EbgpMultihop,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EbgpMultihop)
	"enable-bfd"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EnableBfd        @go(EnableBfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EnableBfd)
	"error-handling"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ErrorHandling    @go(ErrorHandling,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ErrorHandling)
	"graceful-restart"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_GracefulRestart  @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_GracefulRestart)
	"logging-options"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_LoggingOptions   @go(LoggingOptions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_LoggingOptions)
	"neighbor-address"?:   null | string                                                                                                                 @go(NeighborAddress,*string)
	"route-reflector"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector   @go(RouteReflector,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector)
	timers?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Timers           @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Timers)
	transport?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Transport        @go(Transport,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Transport)
	"use-multiple-paths"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths @go(UseMultiplePaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis: {
	X = "afi-safi" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi]
	_check: {
		for e in X {
			for k in strings.Split("afi-safi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-safi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi: {
	"add-paths"?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_AddPaths           @go(AddPaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_AddPaths)
	"afi-safi-name"?:         #E_OpenconfigBgpTypes_AFI_SAFI_TYPE                                                                                                              @go(AfiSafiName)
	"apply-policy"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_ApplyPolicy        @go(ApplyPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_ApplyPolicy)
	config?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Config             @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Config)
	"graceful-restart"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_GracefulRestart    @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_GracefulRestart)
	"ipv4-labeled-unicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast @go(Ipv4LabeledUnicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast)
	"ipv4-unicast"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast        @go(Ipv4Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast)
	"ipv6-labeled-unicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast @go(Ipv6LabeledUnicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast)
	"ipv6-unicast"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast        @go(Ipv6Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast)
	"l2vpn-evpn"?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn          @go(L2VpnEvpn,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn)
	"l2vpn-vpls"?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls          @go(L2VpnVpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls)
	"l3vpn-ipv4-multicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast @go(L3VpnIpv4Multicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast)
	"l3vpn-ipv4-unicast"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast   @go(L3VpnIpv4Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast)
	"l3vpn-ipv6-multicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast @go(L3VpnIpv6Multicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast)
	"l3vpn-ipv6-unicast"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast   @go(L3VpnIpv6Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast)
	"srte-policy-ipv4"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4     @go(SrtePolicyIpv4,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4)
	"srte-policy-ipv6"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6     @go(SrtePolicyIpv6,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6)
	"use-multiple-paths"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths   @go(UseMultiplePaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_AddPaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_AddPaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_AddPaths_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_AddPaths_Config: {
	"eligible-prefix-policy"?: null | string @go(EligiblePrefixPolicy,*string)
	receive?:                  null | bool   @go(Receive,*bool)
	send?:                     null | bool   @go(Send,*bool)
	"send-max"?:               null | uint8  @go(SendMax,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_ApplyPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_ApplyPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_ApplyPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_ApplyPolicy_Config: {
	"default-export-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultExportPolicy)
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"export-policy": [...string] @go(ExportPolicy,[]string)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Config: {
	"afi-safi-name"?: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE @go(AfiSafiName)
	enabled?:        null | bool                         @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_GracefulRestart_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_Config)
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_Config: {
	"extended-next-hop-encoding"?: null | bool @go(ExtendedNextHopEncoding,*bool)
	"send-default-route"?:         null | bool @go(SendDefaultRoute,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_Config)
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_Config: {
	"send-default-route"?: null | bool @go(SendDefaultRoute,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Config)
	ebgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp   @go(Ebgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config: {
	"allow-multiple-as"?: null | bool @go(AllowMultipleAs,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ApplyPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ApplyPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ApplyPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ApplyPolicy_Config: {
	"default-export-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultExportPolicy)
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"export-policy": [...string] @go(ExportPolicy,[]string)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AsPathOptions: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AsPathOptions_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AsPathOptions_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_AsPathOptions_Config: {
	"allow-own-as"?:           null | uint8 @go(AllowOwnAs,*uint8)
	"disable-peer-as-filter"?: null | bool  @go(DisablePeerAsFilter,*bool)
	"replace-peer-as"?:        null | bool  @go(ReplacePeerAs,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Config: {
	"auth-password"?:      null | string                          @go(AuthPassword,*string)
	description?:          null | string                          @go(Description,*string)
	enabled?:              null | bool                            @go(Enabled,*bool)
	"local-as"?:           null | uint32                          @go(LocalAs,*uint32)
	"neighbor-address"?:   null | string                          @go(NeighborAddress,*string)
	"neighbor-port"?:      null | uint16                          @go(NeighborPort,*uint16)
	"peer-as"?:            null | uint32                          @go(PeerAs,*uint32)
	"peer-group"?:         null | string                          @go(PeerGroup,*string)
	"peer-type"?:           #E_OpenconfigBgp_PeerType              @go(PeerType)
	"remove-private-as"?:   #E_OpenconfigBgp_RemovePrivateAsOption @go(RemovePrivateAs)
	"route-flap-damping"?: null | bool                            @go(RouteFlapDamping,*bool)
	"send-community"?:      #E_OpenconfigBgp_CommunityType         @go(SendCommunity)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EbgpMultihop: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EbgpMultihop_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EbgpMultihop_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EbgpMultihop_Config: {
	enabled?:        null | bool  @go(Enabled,*bool)
	"multihop-ttl"?: null | uint8 @go(MultihopTtl,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EnableBfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EnableBfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EnableBfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_EnableBfd_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ErrorHandling: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ErrorHandling_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ErrorHandling_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_ErrorHandling_Config: {
	"treat-as-withdraw"?: null | bool @go(TreatAsWithdraw,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_GracefulRestart_Config: {
	enabled?:             null | bool   @go(Enabled,*bool)
	"helper-only"?:       null | bool   @go(HelperOnly,*bool)
	"restart-time"?:      null | uint16 @go(RestartTime,*uint16)
	"stale-routes-time"?: null | uint16 @go(StaleRoutesTime,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_LoggingOptions: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_LoggingOptions_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_LoggingOptions_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_LoggingOptions_Config: {
	"log-neighbor-state-changes"?: null | bool @go(LogNeighborStateChanges,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config: {
	"route-reflector-client"?:    null | bool                                                                                                                                               @go(RouteReflectorClient,*bool)
	"route-reflector-cluster-id": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config_RouteReflectorClusterId_Union @go(RouteReflectorClusterId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config_RouteReflectorClusterId_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config_RouteReflectorClusterId_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_RouteReflector_Config_RouteReflectorClusterId_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Timers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Timers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Timers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Timers_Config: {
	"connect-retry"?:                  null | uint16 @go(ConnectRetry,*uint16)
	"hold-time"?:                      null | uint16 @go(HoldTime,*uint16)
	"keepalive-interval"?:             null | uint16 @go(KeepaliveInterval,*uint16)
	"minimum-advertisement-interval"?: null | uint16 @go(MinimumAdvertisementInterval,*uint16)
	"restart-time"?:                   null | uint16 @go(RestartTime,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Transport: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Transport_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Transport_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_Transport_Config: {
	"local-address"?: null | string @go(LocalAddress,*string)
	"mtu-discovery"?: null | bool   @go(MtuDiscovery,*bool)
	"passive-mode"?:  null | bool   @go(PassiveMode,*bool)
	"tcp-mss"?:       null | uint16 @go(TcpMss,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Config)
	ebgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Ebgp   @go(Ebgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Ebgp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Ebgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Ebgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Ebgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_Neighbors_Neighbor_UseMultiplePaths_Ebgp_Config: {
	"allow-multiple-as"?: null | bool @go(AllowMultipleAs,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups: {
	X = "peer-group" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup]
	_check: {
		for e in X {
			for k in strings.Split("peer-group-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("peer-group-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup: {
	"afi-safis"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis         @go(AfiSafis,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis)
	"apply-policy"?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ApplyPolicy      @go(ApplyPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ApplyPolicy)
	"as-path-options"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AsPathOptions    @go(AsPathOptions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AsPathOptions)
	config?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Config           @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Config)
	"ebgp-multihop"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EbgpMultihop     @go(EbgpMultihop,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EbgpMultihop)
	"enable-bfd"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EnableBfd        @go(EnableBfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EnableBfd)
	"error-handling"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ErrorHandling    @go(ErrorHandling,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ErrorHandling)
	"graceful-restart"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_GracefulRestart  @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_GracefulRestart)
	"logging-options"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_LoggingOptions   @go(LoggingOptions,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_LoggingOptions)
	"peer-group-name"?:    null | string                                                                                                                   @go(PeerGroupName,*string)
	"route-reflector"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector   @go(RouteReflector,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector)
	timers?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Timers           @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Timers)
	transport?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Transport        @go(Transport,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Transport)
	"use-multiple-paths"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths @go(UseMultiplePaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis: {
	X = "afi-safi" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi]
	_check: {
		for e in X {
			for k in strings.Split("afi-safi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-safi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi: {
	"add-paths"?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_AddPaths           @go(AddPaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_AddPaths)
	"afi-safi-name"?:         #E_OpenconfigBgpTypes_AFI_SAFI_TYPE                                                                                                                @go(AfiSafiName)
	"apply-policy"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_ApplyPolicy        @go(ApplyPolicy,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_ApplyPolicy)
	config?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Config             @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Config)
	"graceful-restart"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_GracefulRestart    @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_GracefulRestart)
	"ipv4-labeled-unicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast @go(Ipv4LabeledUnicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast)
	"ipv4-unicast"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast        @go(Ipv4Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast)
	"ipv6-labeled-unicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast @go(Ipv6LabeledUnicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast)
	"ipv6-unicast"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast        @go(Ipv6Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast)
	"l2vpn-evpn"?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn          @go(L2VpnEvpn,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn)
	"l2vpn-vpls"?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls          @go(L2VpnVpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls)
	"l3vpn-ipv4-multicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast @go(L3VpnIpv4Multicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast)
	"l3vpn-ipv4-unicast"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast   @go(L3VpnIpv4Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast)
	"l3vpn-ipv6-multicast"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast @go(L3VpnIpv6Multicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast)
	"l3vpn-ipv6-unicast"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast   @go(L3VpnIpv6Unicast,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast)
	"srte-policy-ipv4"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4     @go(SrtePolicyIpv4,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4)
	"srte-policy-ipv6"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6     @go(SrtePolicyIpv6,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6)
	"use-multiple-paths"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths   @go(UseMultiplePaths,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_AddPaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_AddPaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_AddPaths_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_AddPaths_Config: {
	"eligible-prefix-policy"?: null | string @go(EligiblePrefixPolicy,*string)
	receive?:                  null | bool   @go(Receive,*bool)
	send?:                     null | bool   @go(Send,*bool)
	"send-max"?:               null | uint8  @go(SendMax,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_ApplyPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_ApplyPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_ApplyPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_ApplyPolicy_Config: {
	"default-export-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultExportPolicy)
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"export-policy": [...string] @go(ExportPolicy,[]string)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Config: {
	"afi-safi-name"?: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE @go(AfiSafiName)
	enabled?:        null | bool                         @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_GracefulRestart_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4LabeledUnicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_Config)
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_Config: {
	"extended-next-hop-encoding"?: null | bool @go(ExtendedNextHopEncoding,*bool)
	"send-default-route"?:         null | bool @go(SendDefaultRoute,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv4Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6LabeledUnicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast: {
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_Config)
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_Config: {
	"send-default-route"?: null | bool @go(SendDefaultRoute,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_Ipv6Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnEvpn_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L2VpnVpls_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Multicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv4Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Multicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_L3VpnIpv6Unicast_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv4_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6: {
	"prefix-limit"?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit         @go(PrefixLimit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit)
	"prefix-limit-received"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived @go(PrefixLimitReceived,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimitReceived_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_SrtePolicyIpv6_PrefixLimit_Config: {
	"max-prefixes"?:          null | uint32 @go(MaxPrefixes,*uint32)
	"prevent-teardown"?:      null | bool   @go(PreventTeardown,*bool)
	"warning-threshold-pct"?: null | uint8  @go(WarningThresholdPct,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Config)
	ebgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp   @go(Ebgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp)
	ibgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp   @go(Ibgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ebgp_Config: {
	"allow-multiple-as"?: null | bool   @go(AllowMultipleAs,*bool)
	"maximum-paths"?:     null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AfiSafis_AfiSafi_UseMultiplePaths_Ibgp_Config: {
	"maximum-paths"?: null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ApplyPolicy: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ApplyPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ApplyPolicy_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ApplyPolicy_Config: {
	"default-export-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultExportPolicy)
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"export-policy": [...string] @go(ExportPolicy,[]string)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AsPathOptions: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AsPathOptions_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AsPathOptions_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_AsPathOptions_Config: {
	"allow-own-as"?:           null | uint8 @go(AllowOwnAs,*uint8)
	"disable-peer-as-filter"?: null | bool  @go(DisablePeerAsFilter,*bool)
	"replace-peer-as"?:        null | bool  @go(ReplacePeerAs,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Config: {
	"auth-password"?:      null | string                          @go(AuthPassword,*string)
	description?:          null | string                          @go(Description,*string)
	"local-as"?:           null | uint32                          @go(LocalAs,*uint32)
	"peer-as"?:            null | uint32                          @go(PeerAs,*uint32)
	"peer-group-name"?:    null | string                          @go(PeerGroupName,*string)
	"peer-type"?:           #E_OpenconfigBgp_PeerType              @go(PeerType)
	"remove-private-as"?:   #E_OpenconfigBgp_RemovePrivateAsOption @go(RemovePrivateAs)
	"route-flap-damping"?: null | bool                            @go(RouteFlapDamping,*bool)
	"send-community"?:      #E_OpenconfigBgp_CommunityType         @go(SendCommunity)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EbgpMultihop: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EbgpMultihop_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EbgpMultihop_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EbgpMultihop_Config: {
	enabled?:        null | bool  @go(Enabled,*bool)
	"multihop-ttl"?: null | uint8 @go(MultihopTtl,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EnableBfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EnableBfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EnableBfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_EnableBfd_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ErrorHandling: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ErrorHandling_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ErrorHandling_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_ErrorHandling_Config: {
	"treat-as-withdraw"?: null | bool @go(TreatAsWithdraw,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_GracefulRestart_Config: {
	enabled?:             null | bool   @go(Enabled,*bool)
	"helper-only"?:       null | bool   @go(HelperOnly,*bool)
	"restart-time"?:      null | uint16 @go(RestartTime,*uint16)
	"stale-routes-time"?: null | uint16 @go(StaleRoutesTime,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_LoggingOptions: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_LoggingOptions_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_LoggingOptions_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_LoggingOptions_Config: {
	"log-neighbor-state-changes"?: null | bool @go(LogNeighborStateChanges,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config: {
	"route-reflector-client"?:    null | bool                                                                                                                                                 @go(RouteReflectorClient,*bool)
	"route-reflector-cluster-id": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config_RouteReflectorClusterId_Union @go(RouteReflectorClusterId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config_RouteReflectorClusterId_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config_RouteReflectorClusterId_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_RouteReflector_Config_RouteReflectorClusterId_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Timers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Timers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Timers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Timers_Config: {
	"connect-retry"?:                  null | uint16 @go(ConnectRetry,*uint16)
	"hold-time"?:                      null | uint16 @go(HoldTime,*uint16)
	"keepalive-interval"?:             null | uint16 @go(KeepaliveInterval,*uint16)
	"minimum-advertisement-interval"?: null | uint16 @go(MinimumAdvertisementInterval,*uint16)
	"restart-time"?:                   null | uint16 @go(RestartTime,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Transport: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Transport_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Transport_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_Transport_Config: {
	"local-address"?: null | string @go(LocalAddress,*string)
	"mtu-discovery"?: null | bool   @go(MtuDiscovery,*bool)
	"passive-mode"?:  null | bool   @go(PassiveMode,*bool)
	"tcp-mss"?:       null | uint16 @go(TcpMss,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Config)
	ebgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ebgp   @go(Ebgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ebgp)
	ibgp?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ibgp   @go(Ibgp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ibgp)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ebgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ebgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ebgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ebgp_Config: {
	"allow-multiple-as"?: null | bool   @go(AllowMultipleAs,*bool)
	"maximum-paths"?:     null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ibgp: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ibgp_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ibgp_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Bgp_PeerGroups_PeerGroup_UseMultiplePaths_Ibgp_Config: {
	"maximum-paths"?: null | uint32 @go(MaximumPaths,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Config: {
	"default-metric"?: null | uint32                                  @go(DefaultMetric,*uint32)
	enabled?:          null | bool                                    @go(Enabled,*bool)
	identifier?:        #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(Identifier)
	name?:             null | string                                  @go(Name,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp: {
	global?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global     @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global)
	interfaces?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global: {
	ssm?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm @go(Ssm,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm: {
	mappings?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings @go(Mappings,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings: {
	X = "mapping" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings_Mapping]
	_check: {
		for e in X {
			for k in strings.Split("source", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("source", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings_Mapping: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings_Mapping_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings_Mapping_Config)
	source?: null | string                                                                                                                 @go(Source,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Global_Ssm_Mappings_Mapping_Config: {
	source?:       null | string @go(Source,*string)
	"ssm-ranges"?: null | string @go(SsmRanges,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface: {
	config?:                     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Config                 @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Config)
	counters?:                   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters               @go(Counters,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters)
	"interface-id"?:             null | string                                                                                                                          @go(InterfaceId,*string)
	"interface-ref"?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_InterfaceRef           @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_InterfaceRef)
	"membership-groups"?:        null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_MembershipGroups       @go(MembershipGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_MembershipGroups)
	"static-membership-groups"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups @go(StaticMembershipGroups,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Config: {
	enabled?:           null | bool   @go(Enabled,*bool)
	"filter-prefixes"?: null | string @go(FilterPrefixes,*string)
	"interface-id"?:    null | string @go(InterfaceId,*string)
	"query-interval"?:  null | uint16 @go(QueryInterval,*uint16)
	version?:           null | uint8  @go(Version,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters: {
	queries?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries @go(Queries,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries)
	reports?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Reports @go(Reports,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Reports)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries: {
	received?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries_Received @go(Received,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries_Received)
	sent?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries_Sent     @go(Sent,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries_Sent)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries_Received: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Queries_Sent: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_Counters_Reports: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_MembershipGroups: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups: {
	X = "static-groups" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups_StaticGroups]
	_check: {
		for e in X {
			for k in strings.Split("static-group", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("static-group", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups_StaticGroups: {
	config?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups_StaticGroups_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups_StaticGroups_Config)
	"static-group"?: null | string                                                                                                                                              @go(StaticGroup,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Igmp_Interfaces_Interface_StaticMembershipGroups_StaticGroups_Config: {
	source?:         null | string @go(Source,*string)
	"static-group"?: null | string @go(StaticGroup,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis: {
	global?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global     @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global)
	interfaces?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces)
	levels?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels     @go(Levels,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global: {
	"afi-safi"?:                         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi                       @go(AfiSafi,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi)
	config?:                             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Config                        @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Config)
	"graceful-restart"?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_GracefulRestart               @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_GracefulRestart)
	"igp-shortcuts"?:                    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts                  @go(IgpShortcuts,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts)
	"inter-level-propagation-policies"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies @go(InterLevelPropagationPolicies,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies)
	"lsp-bit"?:                          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit                        @go(LspBit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit)
	mpls?:                               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls                          @go(Mpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls)
	nsr?:                                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Nsr                           @go(Nsr,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Nsr)
	"reference-bandwidth"?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_ReferenceBandwidth            @go(ReferenceBandwidth,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_ReferenceBandwidth)
	"segment-routing"?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_SegmentRouting                @go(SegmentRouting,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_SegmentRouting)
	timers?:                             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers                        @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers)
	transport?:                          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Transport                     @go(Transport,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Transport)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi: {
	X = "af" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af]
	_check: {
		for e in X {
			for k in strings.Split("afi-name+safi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-name+safi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_Key: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af: {
	"afi-name"?:        #E_OpenconfigIsisTypes_AFI_TYPE                                                                                            @go(AfiName)
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_Config        @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_Config)
	"multi-topology"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_MultiTopology @go(MultiTopology,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_MultiTopology)
	"safi-name"?:       #E_OpenconfigIsisTypes_SAFI_TYPE                                                                                           @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_Config: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	enabled?:    null | bool                      @go(Enabled,*bool)
	metric?:     null | uint32                    @go(Metric,*uint32)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_MultiTopology: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_MultiTopology_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_MultiTopology_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_AfiSafi_Af_MultiTopology_Config: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Config: {
	"authentication-check"?:     null | bool                        @go(AuthenticationCheck,*bool)
	"csnp-enable-on-p2p-links"?: null | bool                        @go(CsnpEnableOnP2PLinks,*bool)
	"fast-flooding"?:            null | bool                        @go(FastFlooding,*bool)
	"hello-padding"?:             #E_OpenconfigIsis_HelloPaddingType @go(HelloPadding)
	"iid-tlv"?:                  null | bool                        @go(IidTlv,*bool)
	instance?:                   null | string                      @go(Instance,*string)
	"level-capability"?:          #E_OpenconfigIsis_LevelType        @go(LevelCapability)
	"max-ecmp-paths"?:           null | uint8                       @go(MaxEcmpPaths,*uint8)
	"maximum-area-addresses"?:   null | uint8                       @go(MaximumAreaAddresses,*uint8)
	net: [...string] @go(Net,[]string)
	"poi-tlv"?: null | bool @go(PoiTlv,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_GracefulRestart_Config: {
	enabled?:       null | bool @go(Enabled,*bool)
	"helper-only"?: null | bool @go(HelperOnly,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts: {
	X = "afi" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts_Afi]
	_check: {
		for e in X {
			for k in strings.Split("afi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts_Afi: {
	"afi-name"?: #E_OpenconfigIsisTypes_AFI_TYPE                                                                                           @go(AfiName)
	config?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts_Afi_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts_Afi_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_IgpShortcuts_Afi_Config: {
	"afi-name"?: #E_OpenconfigIsisTypes_AFI_TYPE @go(AfiName)
	"nh-type": [...#E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL] @go(NhType,[]E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies: {
	"level1-to-level2"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level1ToLevel2 @go(Level1ToLevel2,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level1ToLevel2)
	"level2-to-level1"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level2ToLevel1 @go(Level2ToLevel1,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level2ToLevel1)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level1ToLevel2: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level1ToLevel2_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level1ToLevel2_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level1ToLevel2_Config: {
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level2ToLevel1: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level2ToLevel1_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level2ToLevel1_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_InterLevelPropagationPolicies_Level2ToLevel1_Config: {
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType @go(DefaultImportPolicy)
	"import-policy": [...string] @go(ImportPolicy,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit: {
	"attached-bit"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_AttachedBit @go(AttachedBit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_AttachedBit)
	"overload-bit"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit @go(OverloadBit,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_AttachedBit: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_AttachedBit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_AttachedBit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_AttachedBit_Config: {
	"ignore-bit"?:   null | bool @go(IgnoreBit,*bool)
	"suppress-bit"?: null | bool @go(SuppressBit,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit: {
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_Config        @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_Config)
	"reset-triggers"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers @go(ResetTriggers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_Config: {
	"advertise-high-metric"?: null | bool @go(AdvertiseHighMetric,*bool)
	"set-bit"?:               null | bool @go(SetBit,*bool)
	"set-bit-on-boot"?:       null | bool @go(SetBitOnBoot,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers: {
	X = "reset-trigger" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers_ResetTrigger]
	_check: {
		for e in X {
			for k in strings.Split("reset-trigger", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("reset-trigger", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers_ResetTrigger: {
	config?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers_ResetTrigger_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers_ResetTrigger_Config)
	"reset-trigger"?: #E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE                                                                                                     @go(ResetTrigger)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_LspBit_OverloadBit_ResetTriggers_ResetTrigger_Config: {
	delay?:          null | uint16                                      @go(Delay,*uint16)
	"reset-trigger"?: #E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE @go(ResetTrigger)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls: {
	"igp-ldp-sync"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls_IgpLdpSync @go(IgpLdpSync,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls_IgpLdpSync)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls_IgpLdpSync: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls_IgpLdpSync_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls_IgpLdpSync_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Mpls_IgpLdpSync_Config: {
	enabled?:                 null | bool   @go(Enabled,*bool)
	"post-session-up-delay"?: null | uint16 @go(PostSessionUpDelay,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Nsr: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Nsr_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Nsr_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Nsr_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_ReferenceBandwidth: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_ReferenceBandwidth_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_ReferenceBandwidth_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_ReferenceBandwidth_Config: {
	"reference-bandwidth"?: null | uint32 @go(ReferenceBandwidth,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_SegmentRouting: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_SegmentRouting_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_SegmentRouting_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_SegmentRouting_Config: {
	enabled?: null | bool   @go(Enabled,*bool)
	srgb?:    null | string @go(Srgb,*string)
	srlb?:    null | string @go(Srlb,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers: {
	config?:           null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Config        @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Config)
	"lsp-generation"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_LspGeneration @go(LspGeneration,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_LspGeneration)
	spf?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Spf           @go(Spf,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Spf)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Config: {
	"lsp-lifetime-interval"?: null | uint16 @go(LspLifetimeInterval,*uint16)
	"lsp-refresh-interval"?:  null | uint16 @go(LspRefreshInterval,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_LspGeneration: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_LspGeneration_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_LspGeneration_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_LspGeneration_Config: {
	"lsp-first-wait-interval"?:  null | uint64 @go(LspFirstWaitInterval,*uint64)
	"lsp-max-wait-interval"?:    null | uint64 @go(LspMaxWaitInterval,*uint64)
	"lsp-second-wait-interval"?: null | uint64 @go(LspSecondWaitInterval,*uint64)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Spf: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Spf_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Spf_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Timers_Spf_Config: {
	"spf-first-interval"?:  null | uint64 @go(SpfFirstInterval,*uint64)
	"spf-hold-interval"?:   null | uint64 @go(SpfHoldInterval,*uint64)
	"spf-second-interval"?: null | uint64 @go(SpfSecondInterval,*uint64)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Transport: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Transport_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Transport_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Global_Transport_Config: {
	"lsp-mtu-size"?: null | uint16 @go(LspMtuSize,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface: {
	"afi-safi"?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi         @go(AfiSafi,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi)
	authentication?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Authentication  @go(Authentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Authentication)
	bfd?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Bfd             @go(Bfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Bfd)
	"circuit-counters"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_CircuitCounters @go(CircuitCounters,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_CircuitCounters)
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Config          @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Config)
	"enable-bfd"?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_EnableBfd       @go(EnableBfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_EnableBfd)
	"interface-id"?:     null | string                                                                                                                   @go(InterfaceId,*string)
	"interface-ref"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_InterfaceRef    @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_InterfaceRef)
	levels?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels          @go(Levels,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels)
	mpls?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls            @go(Mpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls)
	timers?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Timers          @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Timers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi: {
	X = "af" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi_Af]
	_check: {
		for e in X {
			for k in strings.Split("afi-name+safi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-name+safi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi_Af_Key: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi_Af: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE                                                                                                   @go(AfiName)
	config?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi_Af_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi_Af_Config)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE                                                                                                  @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_AfiSafi_Af_Config: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	enabled?:    null | bool                      @go(Enabled,*bool)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Authentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Authentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Authentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Authentication_Config: {
	"auth-mode"?:      #E_OpenconfigIsisTypes_AUTH_MODE     @go(AuthMode)
	"auth-password"?: null | string                        @go(AuthPassword,*string)
	"auth-type"?:      #E_OpenconfigKeychainTypes_AUTH_TYPE @go(AuthType)
	enabled?:         null | bool                          @go(Enabled,*bool)
	keychain?:        null | string                        @go(Keychain,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Bfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Bfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Bfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Bfd_Config: {
	"bfd-tlv"?: null | bool @go(BfdTlv,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_CircuitCounters: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Config: {
	"circuit-type"?:  #E_OpenconfigIsis_CircuitType      @go(CircuitType)
	enabled?:        null | bool                        @go(Enabled,*bool)
	"hello-padding"?: #E_OpenconfigIsis_HelloPaddingType @go(HelloPadding)
	"interface-id"?: null | string                      @go(InterfaceId,*string)
	passive?:        null | bool                        @go(Passive,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_EnableBfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_EnableBfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_EnableBfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_EnableBfd_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels: {
	X = "level" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level]
	_check: {
		for e in X {
			for k in strings.Split("level-number", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("level-number", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level: {
	"afi-safi"?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi             @go(AfiSafi,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi)
	config?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Config)
	"hello-authentication"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_HelloAuthentication @go(HelloAuthentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_HelloAuthentication)
	"level-number"?:         null | uint8                                                                                                                                     @go(LevelNumber,*uint8)
	"packet-counters"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters      @go(PacketCounters,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters)
	timers?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Timers              @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Timers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi: {
	X = "af" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af]
	_check: {
		for e in X {
			for k in strings.Split("afi-name+safi-name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi-name+safi-name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_Key: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af: {
	"afi-name"?:         #E_OpenconfigIsisTypes_AFI_TYPE                                                                                                                        @go(AfiName)
	config?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_Config         @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_Config)
	"safi-name"?:        #E_OpenconfigIsisTypes_SAFI_TYPE                                                                                                                       @go(SafiName)
	"segment-routing"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting @go(SegmentRouting,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_Config: {
	"afi-name"?:  #E_OpenconfigIsisTypes_AFI_TYPE  @go(AfiName)
	enabled?:    null | bool                      @go(Enabled,*bool)
	metric?:     null | uint32                    @go(Metric,*uint32)
	"safi-name"?: #E_OpenconfigIsisTypes_SAFI_TYPE @go(SafiName)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting: {
	"adjacency-sids"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids @go(AdjacencySids,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids)
	"prefix-sids"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids    @go(PrefixSids,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids: {
	X = "adjacency-sid" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid]
	_check: {
		for e in X {
			for k in strings.Split("neighbor+sid-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("neighbor+sid-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Key: {
	neighbor: string                                                                                                                                                                                        @go(Neighbor)
	"sid-id": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union @go(SidId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid: {
	config?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config      @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config)
	neighbor?: null | string                                                                                                                                                                                 @go(Neighbor,*string)
	"sid-id":  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union @go(SidId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config: {
	group?:                 null | bool                                                                                                                                                                                   @go(Group,*bool)
	neighbor?:              null | string                                                                                                                                                                                 @go(Neighbor,*string)
	"protection-eligible"?: null | bool                                                                                                                                                                                   @go(ProtectionEligible,*bool)
	"sid-id":               #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_Union @go(SidId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids: {
	X = "prefix-sid" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid]
	_check: {
		for e in X {
			for k in strings.Split("prefix", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("prefix", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config)
	prefix?: null | string                                                                                                                                                                      @go(Prefix,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config: {
	"label-options"?: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions @go(LabelOptions)
	prefix?:         null | string                                                                                                                                                                              @go(Prefix,*string)
	"sid-id":        #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_Union    @go(SidId)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_Union_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId: E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Config: {
	enabled?:        null | bool  @go(Enabled,*bool)
	"level-number"?: null | uint8 @go(LevelNumber,*uint8)
	passive?:        null | bool  @go(Passive,*bool)
	priority?:       null | uint8 @go(Priority,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_HelloAuthentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_HelloAuthentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_HelloAuthentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_HelloAuthentication_Config: {
	"auth-mode"?:      #E_OpenconfigIsisTypes_AUTH_MODE     @go(AuthMode)
	"auth-password"?: null | string                        @go(AuthPassword,*string)
	"auth-type"?:      #E_OpenconfigKeychainTypes_AUTH_TYPE @go(AuthType)
	enabled?:         null | bool                          @go(Enabled,*bool)
	keychain?:        null | string                        @go(Keychain,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters: {
	csnp?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Csnp    @go(Csnp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Csnp)
	esh?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Esh     @go(Esh,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Esh)
	iih?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Iih     @go(Iih,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Iih)
	ish?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Ish     @go(Ish,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Ish)
	lsp?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Lsp     @go(Lsp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Lsp)
	psnp?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Psnp    @go(Psnp,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Psnp)
	unknown?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Unknown @go(Unknown,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Unknown)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Csnp: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Esh: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Iih: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Ish: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Lsp: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Psnp: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_PacketCounters_Unknown: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Timers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Timers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Timers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_Timers_Config: {
	"hello-interval"?:   null | uint32 @go(HelloInterval,*uint32)
	"hello-multiplier"?: null | uint8  @go(HelloMultiplier,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls: {
	"igp-ldp-sync"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls_IgpLdpSync @go(IgpLdpSync,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls_IgpLdpSync)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls_IgpLdpSync: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls_IgpLdpSync_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls_IgpLdpSync_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Mpls_IgpLdpSync_Config: {
	enabled?:                 null | bool   @go(Enabled,*bool)
	"post-session-up-delay"?: null | uint16 @go(PostSessionUpDelay,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Timers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Timers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Timers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Timers_Config: {
	"csnp-interval"?:       null | uint16 @go(CsnpInterval,*uint16)
	"lsp-pacing-interval"?: null | uint64 @go(LspPacingInterval,*uint64)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels: {
	X = "level" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level]
	_check: {
		for e in X {
			for k in strings.Split("level-number", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("level-number", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level: {
	authentication?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Authentication      @go(Authentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Authentication)
	config?:                  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Config              @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Config)
	"level-number"?:          null | uint8                                                                                                                @go(LevelNumber,*uint8)
	"route-preference"?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_RoutePreference     @go(RoutePreference,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_RoutePreference)
	"system-level-counters"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_SystemLevelCounters @go(SystemLevelCounters,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_SystemLevelCounters)
	"traffic-engineering"?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_TrafficEngineering  @go(TrafficEngineering,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_TrafficEngineering)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Authentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Authentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Authentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Authentication_Config: {
	"auth-mode"?:      #E_OpenconfigIsisTypes_AUTH_MODE     @go(AuthMode)
	"auth-password"?: null | string                        @go(AuthPassword,*string)
	"auth-type"?:      #E_OpenconfigKeychainTypes_AUTH_TYPE @go(AuthType)
	"disable-csnp"?:  null | bool                          @go(DisableCsnp,*bool)
	"disable-lsp"?:   null | bool                          @go(DisableLsp,*bool)
	"disable-psnp"?:  null | bool                          @go(DisablePsnp,*bool)
	enabled?:         null | bool                          @go(Enabled,*bool)
	keychain?:        null | string                        @go(Keychain,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_Config: {
	"authentication-check"?: null | bool                   @go(AuthenticationCheck,*bool)
	enabled?:                null | bool                   @go(Enabled,*bool)
	"level-number"?:         null | uint8                  @go(LevelNumber,*uint8)
	"metric-style"?:          #E_OpenconfigIsis_MetricStyle @go(MetricStyle)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_RoutePreference: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_RoutePreference_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_RoutePreference_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_RoutePreference_Config: {
	"external-route-preference"?: null | uint32 @go(ExternalRoutePreference,*uint32)
	"internal-route-preference"?: null | uint32 @go(InternalRoutePreference,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_SystemLevelCounters: {
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_TrafficEngineering: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_TrafficEngineering_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_TrafficEngineering_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Levels_Level_TrafficEngineering_Config: {
	enabled?:          null | bool   @go(Enabled,*bool)
	"ipv4-router-id"?: null | string @go(Ipv4RouterId,*string)
	"ipv6-router-id"?: null | string @go(Ipv6RouterId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates: {
	X = "aggregate" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate]
	_check: {
		for e in X {
			for k in strings.Split("prefix", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("prefix", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config)
	prefix?: null | string                                                                                                          @go(Prefix,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config: {
	description?: null | string                                                                                                                @go(Description,*string)
	discard?:     null | bool                                                                                                                  @go(Discard,*bool)
	metric?:      null | uint32                                                                                                                @go(Metric,*uint32)
	preference?:  null | uint32                                                                                                                @go(Preference,*uint32)
	prefix?:      null | string                                                                                                                @go(Prefix,*string)
	"set-tag":    #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config_SetTag_Union @go(SetTag)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config_SetTag_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config_SetTag_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_LocalAggregates_Aggregate_Config_SetTag_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2: {
	areas?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas  @go(Areas,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas)
	global?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas: {
	X = "area" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area]
	_check: {
		for e in X {
			for k in strings.Split("identifier", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("identifier", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config           @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config)
	identifier:       #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union @go(Identifier)
	interfaces?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces       @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces)
	mpls?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Mpls             @go(Mpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Mpls)
	"virtual-links"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks     @go(VirtualLinks,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config: {
	identifier: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union @go(Identifier)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Config       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Config)
	"enable-bfd"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_EnableBfd    @go(EnableBfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_EnableBfd)
	id?:              null | string                                                                                                                             @go(Id,*string)
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_InterfaceRef)
	"lsa-filter"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_LsaFilter    @go(LsaFilter,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_LsaFilter)
	mpls?:            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls         @go(Mpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls)
	neighbors?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors    @go(Neighbors,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors)
	timers?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Timers       @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Timers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Config: {
	"authentication-type"?:          null | string                            @go(AuthenticationType,*string)
	"hide-network"?:                 null | bool                              @go(HideNetwork,*bool)
	id?:                             null | string                            @go(Id,*string)
	metric?:                         null | uint16                            @go(Metric,*uint16)
	"multi-area-adjacency-primary"?: null | bool                              @go(MultiAreaAdjacencyPrimary,*bool)
	"network-type"?:                  #E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE @go(NetworkType)
	passive?:                        null | bool                              @go(Passive,*bool)
	priority?:                       null | uint8                             @go(Priority,*uint8)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_EnableBfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_EnableBfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_EnableBfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_EnableBfd_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_LsaFilter: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_LsaFilter_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_LsaFilter_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_LsaFilter_Config: {
	all?: null | bool @go(All,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls: {
	config?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_Config     @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_Config)
	"igp-ldp-sync"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_IgpLdpSync @go(IgpLdpSync,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_IgpLdpSync)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_Config: {
	"traffic-engineering-metric"?: null | uint32 @go(TrafficEngineeringMetric,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_IgpLdpSync: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_IgpLdpSync_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_IgpLdpSync_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Mpls_IgpLdpSync_Config: {
	enabled?:                 null | bool   @go(Enabled,*bool)
	"post-session-up-delay"?: null | uint32 @go(PostSessionUpDelay,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors: {
	X = "neighbor" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors_Neighbor]
	_check: {
		for e in X {
			for k in strings.Split("router-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("router-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors_Neighbor: {
	config?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors_Neighbor_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors_Neighbor_Config)
	"router-id"?: null | string                                                                                                                                          @go(RouterId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Neighbors_Neighbor_Config: {
	metric?:      null | uint16 @go(Metric,*uint16)
	"router-id"?: null | string @go(RouterId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Timers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Timers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Timers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Interfaces_Interface_Timers_Config: {
	"dead-interval"?:           null | uint32 @go(DeadInterval,*uint32)
	"hello-interval"?:          null | uint32 @go(HelloInterval,*uint32)
	"retransmission-interval"?: null | uint32 @go(RetransmissionInterval,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Mpls: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Mpls_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Mpls_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Mpls_Config: {
	"traffic-engineering-enabled"?: null | bool @go(TrafficEngineeringEnabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks: {
	X = "virtual-link" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks_VirtualLink]
	_check: {
		for e in X {
			for k in strings.Split("remote-router-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("remote-router-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks_VirtualLink: {
	config?:             null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks_VirtualLink_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks_VirtualLink_Config)
	"remote-router-id"?: null | string                                                                                                                           @go(RemoteRouterId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_VirtualLinks_VirtualLink_Config: {
	"remote-router-id"?: null | string @go(RemoteRouterId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global: {
	config?:                            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config                       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config)
	"graceful-restart"?:                null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_GracefulRestart              @go(GracefulRestart,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_GracefulRestart)
	"inter-area-propagation-policies"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies @go(InterAreaPropagationPolicies,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies)
	mpls?:                              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls                         @go(Mpls,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls)
	timers?:                            null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers                       @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config: {
	"hide-transit-only-networks"?: null | bool                                                                                                                @go(HideTransitOnlyNetworks,*bool)
	"igp-shortcuts"?:              null | bool                                                                                                                @go(IgpShortcuts,*bool)
	"log-adjacency-changes"?:      null | bool                                                                                                                @go(LogAdjacencyChanges,*bool)
	"router-id"?:                  null | string                                                                                                              @go(RouterId,*string)
	"summary-route-cost-mode"?:     #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode @go(SummaryRouteCostMode)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_GracefulRestart: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_GracefulRestart_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_GracefulRestart_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_GracefulRestart_Config: {
	enabled?:       null | bool @go(Enabled,*bool)
	"helper-only"?: null | bool @go(HelperOnly,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies: {
	X = "inter-area-propagation-policy" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies_InterAreaPropagationPolicy]
	_check: {
		for e in X {
			for k in strings.Split("src-area+dst-area", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("src-area+dst-area", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies_InterAreaPropagationPolicy_Key: {
	"src-area": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union @go(SrcArea)
	"dst-area": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union @go(DstArea)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies_InterAreaPropagationPolicy: {
	config?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies_InterAreaPropagationPolicy_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies_InterAreaPropagationPolicy_Config)
	"dst-area": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union                                           @go(DstArea)
	"src-area": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union                                           @go(SrcArea)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_InterAreaPropagationPolicies_InterAreaPropagationPolicy_Config: {
	"default-import-policy"?: #E_OpenconfigRoutingPolicy_DefaultPolicyType                                                                             @go(DefaultImportPolicy)
	"dst-area":              #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union @go(DstArea)
	"import-policy": [...string] @go(ImportPolicy,[]string)
	"src-area": #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Areas_Area_Config_Identifier_Union @go(SrcArea)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls: {
	config?:         null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_Config     @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_Config)
	"igp-ldp-sync"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_IgpLdpSync @go(IgpLdpSync,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_IgpLdpSync)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_Config: {
	"traffic-engineering-extensions"?: null | bool @go(TrafficEngineeringExtensions,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_IgpLdpSync: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_IgpLdpSync_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_IgpLdpSync_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Mpls_IgpLdpSync_Config: {
	enabled?:                 null | bool   @go(Enabled,*bool)
	"post-session-up-delay"?: null | uint32 @go(PostSessionUpDelay,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers: {
	"lsa-generation"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_LsaGeneration @go(LsaGeneration,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_LsaGeneration)
	"max-metric"?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_MaxMetric     @go(MaxMetric,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_MaxMetric)
	spf?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_Spf           @go(Spf,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_Spf)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_LsaGeneration: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_LsaGeneration_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_LsaGeneration_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_LsaGeneration_Config: {
	"initial-delay"?: null | uint32 @go(InitialDelay,*uint32)
	"maximum-delay"?: null | uint32 @go(MaximumDelay,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_MaxMetric: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_MaxMetric_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_MaxMetric_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_MaxMetric_Config: {
	include: [...#E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE] @go(Include,[]E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE)
	set?:     null | bool   @go(Set,*bool)
	timeout?: null | uint64 @go(Timeout,*uint64)
	trigger: [...#E_OpenconfigOspfTypes_MAX_METRIC_TRIGGER] @go(Trigger,[]E_OpenconfigOspfTypes_MAX_METRIC_TRIGGER)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_Spf: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_Spf_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_Spf_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Timers_Spf_Config: {
	"initial-delay"?: null | uint32 @go(InitialDelay,*uint32)
	"maximum-delay"?: null | uint32 @go(MaximumDelay,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep: {
	"path-computation-servers"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers @go(PathComputationServers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers: {
	X = "path-computation-server" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer]
	_check: {
		for e in X {
			for k in strings.Split("pce-server-address", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("pce-server-address", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer: {
	authentication?:       null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Authentication @go(Authentication,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Authentication)
	config?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Config         @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Config)
	"pce-server-address"?: null | string                                                                                                                                          @go(PceServerAddress,*string)
	timers?:               null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Timers         @go(Timers,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Timers)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Authentication: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Authentication_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Authentication_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Authentication_Config: {
	"authentication-key"?: null | string @go(AuthenticationKey,*string)
	enable?:               null | bool   @go(Enable,*bool)
	keychain?:             null | string @go(Keychain,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Config: {
	id?:                         null | string                 @go(Id,*string)
	"pce-initiated-capability"?: null | bool                   @go(PceInitiatedCapability,*bool)
	"pce-server-address"?:       null | string                 @go(PceServerAddress,*string)
	"pce-type"?:                  #E_OpenconfigPcep_PceModeType @go(PceType)
	port?:                       null | uint16                 @go(Port,*uint16)
	preference?:                 null | uint8                  @go(Preference,*uint8)
	"report-local-lsp"?:         null | bool                   @go(ReportLocalLsp,*bool)
	"source-address"?:           null | string                 @go(SourceAddress,*string)
	"sr-support"?:               null | bool                   @go(SrSupport,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Timers: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Timers_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Timers_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pcep_PathComputationServers_PathComputationServer_Timers_Config: {
	"dead-timer"?:                    null | uint8  @go(DeadTimer,*uint8)
	keepalive?:                       null | uint8  @go(Keepalive,*uint8)
	"redelegation-timeout-interval"?: null | uint16 @go(RedelegationTimeoutInterval,*uint16)
	"state-timeout-interval"?:        null | uint16 @go(StateTimeoutInterval,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim: {
	global?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global     @go(Global,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global)
	interfaces?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces @go(Interfaces,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global: {
	config?:              null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Config           @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Config)
	"rendezvous-points"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints @go(RendezvousPoints,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints)
	ssm?:                 null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Ssm              @go(Ssm,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Ssm)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Config: {
	"maximum-groups"?: null | uint32 @go(MaximumGroups,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints: {
	X = "rendezvous-point" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints_RendezvousPoint]
	_check: {
		for e in X {
			for k in strings.Split("address", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("address", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints_RendezvousPoint: {
	address?: null | string                                                                                                                            @go(Address,*string)
	config?:  null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints_RendezvousPoint_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints_RendezvousPoint_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_RendezvousPoints_RendezvousPoint_Config: {
	address?:            null | string @go(Address,*string)
	"multicast-groups"?: null | string @go(MulticastGroups,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Ssm: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Ssm_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Ssm_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Global_Ssm_Config: {
	"ssm-ranges"?: null | string @go(SsmRanges,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces: {
	X = "interface" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface]
	_check: {
		for e in X {
			for k in strings.Split("interface-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("interface-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_Config       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_Config)
	"enable-bfd"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_EnableBfd    @go(EnableBfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_EnableBfd)
	"interface-id"?:  null | string                                                                                                               @go(InterfaceId,*string)
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_Config: {
	"border-router"?:       null | bool                    @go(BorderRouter,*bool)
	"bsr-border"?:          null | bool                    @go(BsrBorder,*bool)
	"dead-timer"?:          null | uint16                  @go(DeadTimer,*uint16)
	"dr-priority"?:         null | uint32                  @go(DrPriority,*uint32)
	enabled?:               null | bool                    @go(Enabled,*bool)
	"hello-interval"?:      null | uint8                   @go(HelloInterval,*uint8)
	"interface-id"?:        null | string                  @go(InterfaceId,*string)
	"join-prune-interval"?: null | uint8                   @go(JoinPruneInterval,*uint8)
	"maximum-groups"?:      null | uint32                  @go(MaximumGroups,*uint32)
	mode?:                   #E_OpenconfigPimTypes_PIM_MODE @go(Mode)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_EnableBfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_EnableBfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_EnableBfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_EnableBfd_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Pim_Interfaces_Interface_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes: {
	X = "static" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static]
	_check: {
		for e in X {
			for k in strings.Split("prefix", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("prefix", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static: {
	config?:      null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config   @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config)
	"next-hops"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops @go(NextHops,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops)
	prefix?:      null | string                                                                                                      @go(Prefix,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config: {
	description?: null | string                                                                                                          @go(Description,*string)
	prefix?:      null | string                                                                                                          @go(Prefix,*string)
	"set-tag":    #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config_SetTag_Union @go(SetTag)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config_SetTag_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config_SetTag_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_Config_SetTag_Union_Uint32: Uint32: uint32

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops: {
	X = "next-hop" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop]
	_check: {
		for e in X {
			for k in strings.Split("index", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("index", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop: {
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config       @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config)
	"enable-bfd"?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_EnableBfd    @go(EnableBfd,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_EnableBfd)
	index?:           null | string                                                                                                                           @go(Index,*string)
	"interface-ref"?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_InterfaceRef @go(InterfaceRef,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_InterfaceRef)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config: {
	index?:      null | string                                                                                                                            @go(Index,*string)
	metric?:     null | uint32                                                                                                                            @go(Metric,*uint32)
	"next-hop":  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config_NextHop_Union @go(NextHop)
	preference?: null | uint32                                                                                                                            @go(Preference,*uint32)
	recurse?:    null | bool                                                                                                                              @go(Recurse,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config_NextHop_Union: _

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config_NextHop_Union_E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP: E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP: #E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_Config_NextHop_Union_String: String: string

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_EnableBfd: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_EnableBfd_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_EnableBfd_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_EnableBfd_Config: {
	enabled?: null | bool @go(Enabled,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_InterfaceRef: {
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_InterfaceRef_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_InterfaceRef_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_StaticRoutes_Static_NextHops_NextHop_InterfaceRef_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits: {
	X = "route-limit" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits_RouteLimit]
	_check: {
		for e in X {
			for k in strings.Split("afi", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("afi", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits_RouteLimit: {
	afi?:     #E_OpenconfigTypes_ADDRESS_FAMILY                                                                @go(Afi)
	config?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits_RouteLimit_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits_RouteLimit_Config)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_RouteLimits_RouteLimit_Config: {
	afi?:                #E_OpenconfigTypes_ADDRESS_FAMILY @go(Afi)
	"alarm-threshold"?: null | uint32                     @go(AlarmThreshold,*uint32)
	maximum?:           null | uint32                     @go(Maximum,*uint32)
	"warning-only"?:    null | bool                       @go(WarningOnly,*bool)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting: {
	srgbs?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs @go(Srgbs,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs)
	srlbs?: null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs @go(Srlbs,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs: {
	X = "srgb" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs_Srgb]
	_check: {
		for e in X {
			for k in strings.Split("local-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("local-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs_Srgb: {
	config?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs_Srgb_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs_Srgb_Config)
	"local-id"?: null | string                                                                                       @go(LocalId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srgbs_Srgb_Config: {
	"dataplane-type"?: #E_OpenconfigSegmentRouting_SrDataplaneType @go(DataplaneType)
	"ipv6-prefixes": [...string] @go(Ipv6Prefixes,[]string)
	"local-id"?: null | string @go(LocalId,*string)
	"mpls-label-blocks": [...string] @go(MplsLabelBlocks,[]string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs: {
	X = "srlb" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs_Srlb]
	_check: {
		for e in X {
			for k in strings.Split("local-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("local-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs_Srlb: {
	config?:     null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs_Srlb_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs_Srlb_Config)
	"local-id"?: null | string                                                                                       @go(LocalId,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_SegmentRouting_Srlbs_Srlb_Config: {
	"dataplane-type"?:    #E_OpenconfigSegmentRouting_SrDataplaneType @go(DataplaneType)
	"ipv6-prefix"?:      null | string                               @go(Ipv6Prefix,*string)
	"local-id"?:         null | string                               @go(LocalId,*string)
	"mpls-label-block"?: null | string                               @go(MplsLabelBlock,*string)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections: {
	X = "table-connection" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections_TableConnection]
	_check: {
		for e in X {
			for k in strings.Split("src-protocol+dst-protocol+address-family", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("src-protocol+dst-protocol+address-family", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections_TableConnection_Key: {
	"src-protocol"?:   #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(SrcProtocol)
	"dst-protocol"?:   #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(DstProtocol)
	"address-family"?: #E_OpenconfigTypes_ADDRESS_FAMILY              @go(AddressFamily)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections_TableConnection: {
	"address-family"?: #E_OpenconfigTypes_ADDRESS_FAMILY                                                                          @go(AddressFamily)
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections_TableConnection_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections_TableConnection_Config)
	"dst-protocol"?:   #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE                                                             @go(DstProtocol)
	"src-protocol"?:   #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE                                                             @go(SrcProtocol)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_TableConnections_TableConnection_Config: {
	"address-family"?:              #E_OpenconfigTypes_ADDRESS_FAMILY              @go(AddressFamily)
	"default-import-policy"?:       #E_OpenconfigRoutingPolicy_DefaultPolicyType   @go(DefaultImportPolicy)
	"disable-metric-propagation"?: null | bool                                    @go(DisableMetricPropagation,*bool)
	"dst-protocol"?:                #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(DstProtocol)
	"import-policy": [...string] @go(ImportPolicy,[]string)
	"src-protocol"?: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(SrcProtocol)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables: {
	X = "table" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables_Table]
	_check: {
		for e in X {
			for k in strings.Split("protocol+address-family", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("protocol+address-family", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables_Table_Key: {
	protocol?:         #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(Protocol)
	"address-family"?: #E_OpenconfigTypes_ADDRESS_FAMILY              @go(AddressFamily)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables_Table: {
	"address-family"?: #E_OpenconfigTypes_ADDRESS_FAMILY                                                      @go(AddressFamily)
	config?:          null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables_Table_Config @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables_Table_Config)
	protocol?:         #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE                                         @go(Protocol)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Tables_Table_Config: {
	"address-family"?: #E_OpenconfigTypes_ADDRESS_FAMILY              @go(AddressFamily)
	protocol?:         #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(Protocol)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans: {
	X = "vlan" : [...null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan]
	_check: {
		for e in X {
			for k in strings.Split("vlan-id", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("vlan-id", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan: {
	config?:    null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config  @go(Config,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config)
	members?:   null | #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Members @go(Members,*OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Members)
	"vlan-id"?: null | uint16                                                                         @go(VlanId,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config: {
	name?:      null | string                                                                          @go(Name,*string)
	status?:     #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status @go(Status)
	"vlan-id"?: null | uint16                                                                          @go(VlanId,*uint16)
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Members: {
}

#OpenconfigRoutingPolicy_RoutingPolicy: {
	"defined-sets"?:       null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets       @go(DefinedSets,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets)
	"policy-definitions"?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions @go(PolicyDefinitions,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets: {
	"neighbor-sets"?: null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets @go(NeighborSets,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets)
	"prefix-sets"?:   null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets   @go(PrefixSets,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets)
	"tag-sets"?:      null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets      @go(TagSets,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets: {
	X = "neighbor-set" : [...null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets_NeighborSet]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets_NeighborSet: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets_NeighborSet_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets_NeighborSet_Config)
	name?:   null | string                                                                             @go(Name,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_NeighborSets_NeighborSet_Config: {
	address: [...string] @go(Address,[]string)
	name?: null | string @go(Name,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets: {
	X = "prefix-set" : [...null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet: {
	config?:   null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config   @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config)
	name?:     null | string                                                                           @go(Name,*string)
	prefixes?: null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes @go(Prefixes,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config: {
	mode?:  #E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode @go(Mode)
	name?: null | string                                                                         @go(Name,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes: {
	X = "prefix" : [...null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes_Prefix]
	_check: {
		for e in X {
			for k in strings.Split("ip-prefix+masklength-range", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("ip-prefix+masklength-range", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes_Prefix_Key: {
	"ip-prefix":        string @go(IpPrefix)
	"masklength-range": string @go(MasklengthRange)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes_Prefix: {
	config?:             null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes_Prefix_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes_Prefix_Config)
	"ip-prefix"?:        null | string                                                                                         @go(IpPrefix,*string)
	"masklength-range"?: null | string                                                                                         @go(MasklengthRange,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Prefixes_Prefix_Config: {
	"ip-prefix"?:        null | string @go(IpPrefix,*string)
	"masklength-range"?: null | string @go(MasklengthRange,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets: {
	X = "tag-set" : [...null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config)
	name?:   null | string                                                                   @go(Name,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config: {
	name?: null | string @go(Name,*string)
	"tag-value": [...#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config_TagValue_Union] @go(TagValue,[]OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config_TagValue_Union)
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config_TagValue_Union: _

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config_TagValue_Union_String: String: string

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_TagSets_TagSet_Config_TagValue_Union_Uint32: Uint32: uint32

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions: {
	X = "policy-definition" : [...null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition: {
	config?:     null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Config     @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Config)
	name?:       null | string                                                                               @go(Name,*string)
	statements?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements @go(Statements,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Config: {
	name?: null | string @go(Name,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements: {
	X = "statement" : [...null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement]
	_check: {
		for e in X {
			for k in strings.Split("name", "+") {
				let kValue = e.config[k]
				if kValue != e[k] {_|_}
			}
			let kValues = [ for k in strings.Split("name", "+") {"\(e.config[k])"}]
			let compK = strings.Join(kValues, "+")
			"\(compK)": true
		}
	}
	if len(_check) != len(X) {_|_}
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement: {
	actions?:    null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions    @go(Actions,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions)
	conditions?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions @go(Conditions,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions)
	config?:     null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Config     @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Config)
	name?:       null | string                                                                                                    @go(Name,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions: {
	config?:    null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_Config)
	"set-tag"?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag @go(SetTag,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_Config: {
	"policy-result"?: #E_OpenconfigRoutingPolicy_PolicyResultType @go(PolicyResult)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag: {
	config?:    null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config    @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config)
	inline?:    null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline    @go(Inline,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline)
	reference?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Reference @go(Reference,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Reference)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config: {
	mode?: #E_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode @go(Mode)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config: {
	tag: [...#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config_Tag_Union] @go(Tag,[]OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config_Tag_Union)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config_Tag_Union: _

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config_Tag_Union_String: String: string

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Inline_Config_Tag_Union_Uint32: Uint32: uint32

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Reference: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Reference_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Reference_Config)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Reference_Config: {
	"tag-set"?: null | string @go(TagSet,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions: {
	config?:               null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_Config           @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_Config)
	"match-interface"?:    null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchInterface   @go(MatchInterface,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchInterface)
	"match-neighbor-set"?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchNeighborSet @go(MatchNeighborSet,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchNeighborSet)
	"match-prefix-set"?:   null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchPrefixSet   @go(MatchPrefixSet,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchPrefixSet)
	"match-tag-set"?:      null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchTagSet      @go(MatchTagSet,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchTagSet)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_Config: {
	"call-policy"?:        null | string                                  @go(CallPolicy,*string)
	"install-protocol-eq"?: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE @go(InstallProtocolEq)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchInterface: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchInterface_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchInterface_Config)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchInterface_Config: {
	interface?:    null | string @go(Interface,*string)
	subinterface?: null | uint32 @go(Subinterface,*uint32)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchNeighborSet: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchNeighborSet_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchNeighborSet_Config)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchNeighborSet_Config: {
	"match-set-options"?: #E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType @go(MatchSetOptions)
	"neighbor-set"?:     null | string                                            @go(NeighborSet,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchPrefixSet: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchPrefixSet_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchPrefixSet_Config)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchPrefixSet_Config: {
	"match-set-options"?: #E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType @go(MatchSetOptions)
	"prefix-set"?:       null | string                                            @go(PrefixSet,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchTagSet: {
	config?: null | #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchTagSet_Config @go(Config,*OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchTagSet_Config)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Conditions_MatchTagSet_Config: {
	"match-set-options"?: #E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType @go(MatchSetOptions)
	"tag-set"?:          null | string                                            @go(TagSet,*string)
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Config: {
	name?: null | string @go(Name,*string)
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

#enumE_OpenconfigAcl_ACL_TYPE:
	#OpenconfigAcl_ACL_TYPE_UNSET |
	#OpenconfigAcl_ACL_TYPE_ACL_IPV4 |
	#OpenconfigAcl_ACL_TYPE_ACL_IPV6 |
	#OpenconfigAcl_ACL_TYPE_ACL_L2 |
	#OpenconfigAcl_ACL_TYPE_ACL_MIXED |
	#OpenconfigAcl_ACL_TYPE_ACL_MPLS

#values_E_OpenconfigAcl_ACL_TYPE: {
	OpenconfigAcl_ACL_TYPE_UNSET:     #OpenconfigAcl_ACL_TYPE_UNSET
	OpenconfigAcl_ACL_TYPE_ACL_IPV4:  #OpenconfigAcl_ACL_TYPE_ACL_IPV4
	OpenconfigAcl_ACL_TYPE_ACL_IPV6:  #OpenconfigAcl_ACL_TYPE_ACL_IPV6
	OpenconfigAcl_ACL_TYPE_ACL_L2:    #OpenconfigAcl_ACL_TYPE_ACL_L2
	OpenconfigAcl_ACL_TYPE_ACL_MIXED: #OpenconfigAcl_ACL_TYPE_ACL_MIXED
	OpenconfigAcl_ACL_TYPE_ACL_MPLS:  #OpenconfigAcl_ACL_TYPE_ACL_MPLS
}

#OpenconfigAcl_ACL_TYPE_UNSET: #E_OpenconfigAcl_ACL_TYPE & 0

#OpenconfigAcl_ACL_TYPE_ACL_IPV4: #E_OpenconfigAcl_ACL_TYPE & 1

#OpenconfigAcl_ACL_TYPE_ACL_IPV6: #E_OpenconfigAcl_ACL_TYPE & 2

#OpenconfigAcl_ACL_TYPE_ACL_L2: #E_OpenconfigAcl_ACL_TYPE & 3

#OpenconfigAcl_ACL_TYPE_ACL_MIXED: #E_OpenconfigAcl_ACL_TYPE & 4

#OpenconfigAcl_ACL_TYPE_ACL_MPLS: #E_OpenconfigAcl_ACL_TYPE & 5

#enumE_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue:
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_UNSET |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV4_EXPLICIT_NULL |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ROUTER_ALERT |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV6_EXPLICIT_NULL |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IMPLICIT_NULL |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ENTROPY_LABEL_INDICATOR |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_NO_LABEL

#values_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue: {
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_UNSET:                   #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_UNSET
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV4_EXPLICIT_NULL:      #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV4_EXPLICIT_NULL
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ROUTER_ALERT:            #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ROUTER_ALERT
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV6_EXPLICIT_NULL:      #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV6_EXPLICIT_NULL
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IMPLICIT_NULL:           #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IMPLICIT_NULL
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ENTROPY_LABEL_INDICATOR: #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ENTROPY_LABEL_INDICATOR
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_NO_LABEL:                #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_NO_LABEL
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_UNSET: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 0

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV4_EXPLICIT_NULL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 1

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ROUTER_ALERT: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 2

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IPV6_EXPLICIT_NULL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 3

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_IMPLICIT_NULL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 4

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_ENTROPY_LABEL_INDICATOR: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 5

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue_NO_LABEL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue & 6

#enumE_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue:
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_UNSET |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV4_EXPLICIT_NULL |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ROUTER_ALERT |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV6_EXPLICIT_NULL |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IMPLICIT_NULL |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ENTROPY_LABEL_INDICATOR |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_NO_LABEL

#values_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue: {
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_UNSET:                   #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_UNSET
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV4_EXPLICIT_NULL:      #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV4_EXPLICIT_NULL
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ROUTER_ALERT:            #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ROUTER_ALERT
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV6_EXPLICIT_NULL:      #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV6_EXPLICIT_NULL
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IMPLICIT_NULL:           #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IMPLICIT_NULL
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ENTROPY_LABEL_INDICATOR: #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ENTROPY_LABEL_INDICATOR
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_NO_LABEL:                #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_NO_LABEL
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_UNSET: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 0

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV4_EXPLICIT_NULL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 1

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ROUTER_ALERT: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 2

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IPV6_EXPLICIT_NULL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 3

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_IMPLICIT_NULL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 4

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_ENTROPY_LABEL_INDICATOR: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 5

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue_NO_LABEL: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue & 6

#enumE_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort:
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_UNSET |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_ANY

#values_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort: {
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_UNSET: #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_UNSET
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_ANY:   #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_ANY
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_UNSET: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort & 0

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort_ANY: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort & 1

#enumE_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort:
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_UNSET |
	#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_ANY

#values_E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort: {
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_UNSET: #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_UNSET
	OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_ANY:   #OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_ANY
}

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_UNSET: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort & 0

#OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort_ANY: #E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort & 1

#enumE_OpenconfigAcl_FORWARDING_ACTION:
	#OpenconfigAcl_FORWARDING_ACTION_UNSET |
	#OpenconfigAcl_FORWARDING_ACTION_ACCEPT |
	#OpenconfigAcl_FORWARDING_ACTION_DROP |
	#OpenconfigAcl_FORWARDING_ACTION_REJECT

#values_E_OpenconfigAcl_FORWARDING_ACTION: {
	OpenconfigAcl_FORWARDING_ACTION_UNSET:  #OpenconfigAcl_FORWARDING_ACTION_UNSET
	OpenconfigAcl_FORWARDING_ACTION_ACCEPT: #OpenconfigAcl_FORWARDING_ACTION_ACCEPT
	OpenconfigAcl_FORWARDING_ACTION_DROP:   #OpenconfigAcl_FORWARDING_ACTION_DROP
	OpenconfigAcl_FORWARDING_ACTION_REJECT: #OpenconfigAcl_FORWARDING_ACTION_REJECT
}

#OpenconfigAcl_FORWARDING_ACTION_UNSET: #E_OpenconfigAcl_FORWARDING_ACTION & 0

#OpenconfigAcl_FORWARDING_ACTION_ACCEPT: #E_OpenconfigAcl_FORWARDING_ACTION & 1

#OpenconfigAcl_FORWARDING_ACTION_DROP: #E_OpenconfigAcl_FORWARDING_ACTION & 2

#OpenconfigAcl_FORWARDING_ACTION_REJECT: #E_OpenconfigAcl_FORWARDING_ACTION & 3

#enumE_OpenconfigAcl_LOG_ACTION:
	#OpenconfigAcl_LOG_ACTION_UNSET |
	#OpenconfigAcl_LOG_ACTION_LOG_NONE |
	#OpenconfigAcl_LOG_ACTION_LOG_SYSLOG

#values_E_OpenconfigAcl_LOG_ACTION: {
	OpenconfigAcl_LOG_ACTION_UNSET:      #OpenconfigAcl_LOG_ACTION_UNSET
	OpenconfigAcl_LOG_ACTION_LOG_NONE:   #OpenconfigAcl_LOG_ACTION_LOG_NONE
	OpenconfigAcl_LOG_ACTION_LOG_SYSLOG: #OpenconfigAcl_LOG_ACTION_LOG_SYSLOG
}

#OpenconfigAcl_LOG_ACTION_UNSET: #E_OpenconfigAcl_LOG_ACTION & 0

#OpenconfigAcl_LOG_ACTION_LOG_NONE: #E_OpenconfigAcl_LOG_ACTION & 1

#OpenconfigAcl_LOG_ACTION_LOG_SYSLOG: #E_OpenconfigAcl_LOG_ACTION & 2

#enumE_OpenconfigBgpTypes_AFI_SAFI_TYPE:
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_UNSET |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_FLOWSPEC |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_LABELED_UNICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_UNICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_LABELED_UNICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_UNICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_EVPN |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_VPLS |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_MULTICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_UNICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_MULTICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_UNICAST |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_SPF |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_VPN |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV4 |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV6 |
	#OpenconfigBgpTypes_AFI_SAFI_TYPE_VPNV4_FLOWSPEC

#values_E_OpenconfigBgpTypes_AFI_SAFI_TYPE: {
	OpenconfigBgpTypes_AFI_SAFI_TYPE_UNSET:                #OpenconfigBgpTypes_AFI_SAFI_TYPE_UNSET
	OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_FLOWSPEC:        #OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_FLOWSPEC
	OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_LABELED_UNICAST: #OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_LABELED_UNICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_UNICAST:         #OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_UNICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_LABELED_UNICAST: #OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_LABELED_UNICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_UNICAST:         #OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_UNICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_EVPN:           #OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_EVPN
	OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_VPLS:           #OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_VPLS
	OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_MULTICAST: #OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_MULTICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_UNICAST:   #OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_UNICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_MULTICAST: #OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_MULTICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_UNICAST:   #OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_UNICAST
	OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE:            #OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE
	OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_SPF:        #OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_SPF
	OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_VPN:        #OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_VPN
	OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV4:     #OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV4
	OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV6:     #OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV6
	OpenconfigBgpTypes_AFI_SAFI_TYPE_VPNV4_FLOWSPEC:       #OpenconfigBgpTypes_AFI_SAFI_TYPE_VPNV4_FLOWSPEC
}

#OpenconfigBgpTypes_AFI_SAFI_TYPE_UNSET: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 0

#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_FLOWSPEC: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 1

#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_LABELED_UNICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 2

#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV4_UNICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 3

#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_LABELED_UNICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 4

#OpenconfigBgpTypes_AFI_SAFI_TYPE_IPV6_UNICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 5

#OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_EVPN: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 6

#OpenconfigBgpTypes_AFI_SAFI_TYPE_L2VPN_VPLS: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 7

#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_MULTICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 8

#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV4_UNICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 9

#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_MULTICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 10

#OpenconfigBgpTypes_AFI_SAFI_TYPE_L3VPN_IPV6_UNICAST: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 11

#OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 12

#OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_SPF: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 13

#OpenconfigBgpTypes_AFI_SAFI_TYPE_LINKSTATE_VPN: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 14

#OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV4: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 15

#OpenconfigBgpTypes_AFI_SAFI_TYPE_SRTE_POLICY_IPV6: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 16

#OpenconfigBgpTypes_AFI_SAFI_TYPE_VPNV4_FLOWSPEC: #E_OpenconfigBgpTypes_AFI_SAFI_TYPE & 17

#enumE_OpenconfigBgp_CommunityType:
	#OpenconfigBgp_CommunityType_UNSET |
	#OpenconfigBgp_CommunityType_STANDARD |
	#OpenconfigBgp_CommunityType_EXTENDED |
	#OpenconfigBgp_CommunityType_BOTH |
	#OpenconfigBgp_CommunityType_NONE

#values_E_OpenconfigBgp_CommunityType: {
	OpenconfigBgp_CommunityType_UNSET:    #OpenconfigBgp_CommunityType_UNSET
	OpenconfigBgp_CommunityType_STANDARD: #OpenconfigBgp_CommunityType_STANDARD
	OpenconfigBgp_CommunityType_EXTENDED: #OpenconfigBgp_CommunityType_EXTENDED
	OpenconfigBgp_CommunityType_BOTH:     #OpenconfigBgp_CommunityType_BOTH
	OpenconfigBgp_CommunityType_NONE:     #OpenconfigBgp_CommunityType_NONE
}

#OpenconfigBgp_CommunityType_UNSET: #E_OpenconfigBgp_CommunityType & 0

#OpenconfigBgp_CommunityType_STANDARD: #E_OpenconfigBgp_CommunityType & 1

#OpenconfigBgp_CommunityType_EXTENDED: #E_OpenconfigBgp_CommunityType & 2

#OpenconfigBgp_CommunityType_BOTH: #E_OpenconfigBgp_CommunityType & 3

#OpenconfigBgp_CommunityType_NONE: #E_OpenconfigBgp_CommunityType & 4

#enumE_OpenconfigBgp_PeerType:
	#OpenconfigBgp_PeerType_UNSET |
	#OpenconfigBgp_PeerType_INTERNAL |
	#OpenconfigBgp_PeerType_EXTERNAL

#values_E_OpenconfigBgp_PeerType: {
	OpenconfigBgp_PeerType_UNSET:    #OpenconfigBgp_PeerType_UNSET
	OpenconfigBgp_PeerType_INTERNAL: #OpenconfigBgp_PeerType_INTERNAL
	OpenconfigBgp_PeerType_EXTERNAL: #OpenconfigBgp_PeerType_EXTERNAL
}

#OpenconfigBgp_PeerType_UNSET: #E_OpenconfigBgp_PeerType & 0

#OpenconfigBgp_PeerType_INTERNAL: #E_OpenconfigBgp_PeerType & 1

#OpenconfigBgp_PeerType_EXTERNAL: #E_OpenconfigBgp_PeerType & 2

#enumE_OpenconfigBgp_RemovePrivateAsOption:
	#OpenconfigBgp_RemovePrivateAsOption_UNSET |
	#OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REMOVE_ALL |
	#OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REPLACE_ALL

#values_E_OpenconfigBgp_RemovePrivateAsOption: {
	OpenconfigBgp_RemovePrivateAsOption_UNSET:                  #OpenconfigBgp_RemovePrivateAsOption_UNSET
	OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REMOVE_ALL:  #OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REMOVE_ALL
	OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REPLACE_ALL: #OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REPLACE_ALL
}

#OpenconfigBgp_RemovePrivateAsOption_UNSET: #E_OpenconfigBgp_RemovePrivateAsOption & 0

#OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REMOVE_ALL: #E_OpenconfigBgp_RemovePrivateAsOption & 1

#OpenconfigBgp_RemovePrivateAsOption_PRIVATE_AS_REPLACE_ALL: #E_OpenconfigBgp_RemovePrivateAsOption & 2

#enumE_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE:
	#OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_UNSET |
	#OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_ALL_ACTIVE |
	#OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_SINGLE_ACTIVE

#values_E_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE: {
	OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_UNSET:         #OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_UNSET
	OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_ALL_ACTIVE:    #OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_ALL_ACTIVE
	OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_SINGLE_ACTIVE: #OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_SINGLE_ACTIVE
}

#OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_UNSET: #E_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE & 0

#OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_ALL_ACTIVE: #E_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE & 1

#OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE_SINGLE_ACTIVE: #E_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE & 2

#enumE_OpenconfigEvpnTypes_EVPN_TYPE:
	#OpenconfigEvpnTypes_EVPN_TYPE_UNSET |
	#OpenconfigEvpnTypes_EVPN_TYPE_VLAN_AWARE |
	#OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BASED |
	#OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BUNDLE

#values_E_OpenconfigEvpnTypes_EVPN_TYPE: {
	OpenconfigEvpnTypes_EVPN_TYPE_UNSET:       #OpenconfigEvpnTypes_EVPN_TYPE_UNSET
	OpenconfigEvpnTypes_EVPN_TYPE_VLAN_AWARE:  #OpenconfigEvpnTypes_EVPN_TYPE_VLAN_AWARE
	OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BASED:  #OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BASED
	OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BUNDLE: #OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BUNDLE
}

#OpenconfigEvpnTypes_EVPN_TYPE_UNSET: #E_OpenconfigEvpnTypes_EVPN_TYPE & 0

#OpenconfigEvpnTypes_EVPN_TYPE_VLAN_AWARE: #E_OpenconfigEvpnTypes_EVPN_TYPE & 1

#OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BASED: #E_OpenconfigEvpnTypes_EVPN_TYPE & 2

#OpenconfigEvpnTypes_EVPN_TYPE_VLAN_BUNDLE: #E_OpenconfigEvpnTypes_EVPN_TYPE & 3

#enumE_OpenconfigEvpn_EsiType:
	#OpenconfigEvpn_EsiType_UNSET |
	#OpenconfigEvpn_EsiType_TYPE_0_OPERATOR_CONFIGURED |
	#OpenconfigEvpn_EsiType_TYPE_1_LACP_BASED |
	#OpenconfigEvpn_EsiType_TYPE_2_BRIDGE_PROTOCOL_BASED |
	#OpenconfigEvpn_EsiType_TYPE_3_MAC_BASED |
	#OpenconfigEvpn_EsiType_TYPE_4_ROUTER_ID_BASED |
	#OpenconfigEvpn_EsiType_TYPE_5_AS_BASED

#values_E_OpenconfigEvpn_EsiType: {
	OpenconfigEvpn_EsiType_UNSET:                        #OpenconfigEvpn_EsiType_UNSET
	OpenconfigEvpn_EsiType_TYPE_0_OPERATOR_CONFIGURED:   #OpenconfigEvpn_EsiType_TYPE_0_OPERATOR_CONFIGURED
	OpenconfigEvpn_EsiType_TYPE_1_LACP_BASED:            #OpenconfigEvpn_EsiType_TYPE_1_LACP_BASED
	OpenconfigEvpn_EsiType_TYPE_2_BRIDGE_PROTOCOL_BASED: #OpenconfigEvpn_EsiType_TYPE_2_BRIDGE_PROTOCOL_BASED
	OpenconfigEvpn_EsiType_TYPE_3_MAC_BASED:             #OpenconfigEvpn_EsiType_TYPE_3_MAC_BASED
	OpenconfigEvpn_EsiType_TYPE_4_ROUTER_ID_BASED:       #OpenconfigEvpn_EsiType_TYPE_4_ROUTER_ID_BASED
	OpenconfigEvpn_EsiType_TYPE_5_AS_BASED:              #OpenconfigEvpn_EsiType_TYPE_5_AS_BASED
}

#OpenconfigEvpn_EsiType_UNSET: #E_OpenconfigEvpn_EsiType & 0

#OpenconfigEvpn_EsiType_TYPE_0_OPERATOR_CONFIGURED: #E_OpenconfigEvpn_EsiType & 1

#OpenconfigEvpn_EsiType_TYPE_1_LACP_BASED: #E_OpenconfigEvpn_EsiType & 2

#OpenconfigEvpn_EsiType_TYPE_2_BRIDGE_PROTOCOL_BASED: #E_OpenconfigEvpn_EsiType & 3

#OpenconfigEvpn_EsiType_TYPE_3_MAC_BASED: #E_OpenconfigEvpn_EsiType & 4

#OpenconfigEvpn_EsiType_TYPE_4_ROUTER_ID_BASED: #E_OpenconfigEvpn_EsiType & 5

#OpenconfigEvpn_EsiType_TYPE_5_AS_BASED: #E_OpenconfigEvpn_EsiType & 6

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

#enumE_OpenconfigIsisTypes_AFI_TYPE:
	#OpenconfigIsisTypes_AFI_TYPE_UNSET |
	#OpenconfigIsisTypes_AFI_TYPE_IPV4 |
	#OpenconfigIsisTypes_AFI_TYPE_IPV6

#values_E_OpenconfigIsisTypes_AFI_TYPE: {
	OpenconfigIsisTypes_AFI_TYPE_UNSET: #OpenconfigIsisTypes_AFI_TYPE_UNSET
	OpenconfigIsisTypes_AFI_TYPE_IPV4:  #OpenconfigIsisTypes_AFI_TYPE_IPV4
	OpenconfigIsisTypes_AFI_TYPE_IPV6:  #OpenconfigIsisTypes_AFI_TYPE_IPV6
}

#OpenconfigIsisTypes_AFI_TYPE_UNSET: #E_OpenconfigIsisTypes_AFI_TYPE & 0

#OpenconfigIsisTypes_AFI_TYPE_IPV4: #E_OpenconfigIsisTypes_AFI_TYPE & 1

#OpenconfigIsisTypes_AFI_TYPE_IPV6: #E_OpenconfigIsisTypes_AFI_TYPE & 2

#enumE_OpenconfigIsisTypes_AUTH_MODE:
	#OpenconfigIsisTypes_AUTH_MODE_UNSET |
	#OpenconfigIsisTypes_AUTH_MODE_MD5 |
	#OpenconfigIsisTypes_AUTH_MODE_TEXT

#values_E_OpenconfigIsisTypes_AUTH_MODE: {
	OpenconfigIsisTypes_AUTH_MODE_UNSET: #OpenconfigIsisTypes_AUTH_MODE_UNSET
	OpenconfigIsisTypes_AUTH_MODE_MD5:   #OpenconfigIsisTypes_AUTH_MODE_MD5
	OpenconfigIsisTypes_AUTH_MODE_TEXT:  #OpenconfigIsisTypes_AUTH_MODE_TEXT
}

#OpenconfigIsisTypes_AUTH_MODE_UNSET: #E_OpenconfigIsisTypes_AUTH_MODE & 0

#OpenconfigIsisTypes_AUTH_MODE_MD5: #E_OpenconfigIsisTypes_AUTH_MODE & 1

#OpenconfigIsisTypes_AUTH_MODE_TEXT: #E_OpenconfigIsisTypes_AUTH_MODE & 2

#enumE_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE:
	#OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_UNSET |
	#OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_BGP |
	#OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_SYSTEM

#values_E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE: {
	OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_UNSET:           #OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_UNSET
	OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_BGP:    #OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_BGP
	OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_SYSTEM: #OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_SYSTEM
}

#OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_UNSET: #E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE & 0

#OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_BGP: #E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE & 1

#OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE_WAIT_FOR_SYSTEM: #E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE & 2

#enumE_OpenconfigIsisTypes_SAFI_TYPE:
	#OpenconfigIsisTypes_SAFI_TYPE_UNSET |
	#OpenconfigIsisTypes_SAFI_TYPE_MULTICAST |
	#OpenconfigIsisTypes_SAFI_TYPE_UNICAST

#values_E_OpenconfigIsisTypes_SAFI_TYPE: {
	OpenconfigIsisTypes_SAFI_TYPE_UNSET:     #OpenconfigIsisTypes_SAFI_TYPE_UNSET
	OpenconfigIsisTypes_SAFI_TYPE_MULTICAST: #OpenconfigIsisTypes_SAFI_TYPE_MULTICAST
	OpenconfigIsisTypes_SAFI_TYPE_UNICAST:   #OpenconfigIsisTypes_SAFI_TYPE_UNICAST
}

#OpenconfigIsisTypes_SAFI_TYPE_UNSET: #E_OpenconfigIsisTypes_SAFI_TYPE & 0

#OpenconfigIsisTypes_SAFI_TYPE_MULTICAST: #E_OpenconfigIsisTypes_SAFI_TYPE & 1

#OpenconfigIsisTypes_SAFI_TYPE_UNICAST: #E_OpenconfigIsisTypes_SAFI_TYPE & 2

#enumE_OpenconfigIsis_CircuitType:
	#OpenconfigIsis_CircuitType_UNSET |
	#OpenconfigIsis_CircuitType_POINT_TO_POINT |
	#OpenconfigIsis_CircuitType_BROADCAST

#values_E_OpenconfigIsis_CircuitType: {
	OpenconfigIsis_CircuitType_UNSET:          #OpenconfigIsis_CircuitType_UNSET
	OpenconfigIsis_CircuitType_POINT_TO_POINT: #OpenconfigIsis_CircuitType_POINT_TO_POINT
	OpenconfigIsis_CircuitType_BROADCAST:      #OpenconfigIsis_CircuitType_BROADCAST
}

#OpenconfigIsis_CircuitType_UNSET: #E_OpenconfigIsis_CircuitType & 0

#OpenconfigIsis_CircuitType_POINT_TO_POINT: #E_OpenconfigIsis_CircuitType & 1

#OpenconfigIsis_CircuitType_BROADCAST: #E_OpenconfigIsis_CircuitType & 2

#enumE_OpenconfigIsis_HelloPaddingType:
	#OpenconfigIsis_HelloPaddingType_UNSET |
	#OpenconfigIsis_HelloPaddingType_STRICT |
	#OpenconfigIsis_HelloPaddingType_LOOSE |
	#OpenconfigIsis_HelloPaddingType_ADAPTIVE |
	#OpenconfigIsis_HelloPaddingType_DISABLE

#values_E_OpenconfigIsis_HelloPaddingType: {
	OpenconfigIsis_HelloPaddingType_UNSET:    #OpenconfigIsis_HelloPaddingType_UNSET
	OpenconfigIsis_HelloPaddingType_STRICT:   #OpenconfigIsis_HelloPaddingType_STRICT
	OpenconfigIsis_HelloPaddingType_LOOSE:    #OpenconfigIsis_HelloPaddingType_LOOSE
	OpenconfigIsis_HelloPaddingType_ADAPTIVE: #OpenconfigIsis_HelloPaddingType_ADAPTIVE
	OpenconfigIsis_HelloPaddingType_DISABLE:  #OpenconfigIsis_HelloPaddingType_DISABLE
}

#OpenconfigIsis_HelloPaddingType_UNSET: #E_OpenconfigIsis_HelloPaddingType & 0

#OpenconfigIsis_HelloPaddingType_STRICT: #E_OpenconfigIsis_HelloPaddingType & 1

#OpenconfigIsis_HelloPaddingType_LOOSE: #E_OpenconfigIsis_HelloPaddingType & 2

#OpenconfigIsis_HelloPaddingType_ADAPTIVE: #E_OpenconfigIsis_HelloPaddingType & 3

#OpenconfigIsis_HelloPaddingType_DISABLE: #E_OpenconfigIsis_HelloPaddingType & 4

#enumE_OpenconfigIsis_LevelType:
	#OpenconfigIsis_LevelType_UNSET |
	#OpenconfigIsis_LevelType_LEVEL_1 |
	#OpenconfigIsis_LevelType_LEVEL_2 |
	#OpenconfigIsis_LevelType_LEVEL_1_2

#values_E_OpenconfigIsis_LevelType: {
	OpenconfigIsis_LevelType_UNSET:     #OpenconfigIsis_LevelType_UNSET
	OpenconfigIsis_LevelType_LEVEL_1:   #OpenconfigIsis_LevelType_LEVEL_1
	OpenconfigIsis_LevelType_LEVEL_2:   #OpenconfigIsis_LevelType_LEVEL_2
	OpenconfigIsis_LevelType_LEVEL_1_2: #OpenconfigIsis_LevelType_LEVEL_1_2
}

#OpenconfigIsis_LevelType_UNSET: #E_OpenconfigIsis_LevelType & 0

#OpenconfigIsis_LevelType_LEVEL_1: #E_OpenconfigIsis_LevelType & 1

#OpenconfigIsis_LevelType_LEVEL_2: #E_OpenconfigIsis_LevelType & 2

#OpenconfigIsis_LevelType_LEVEL_1_2: #E_OpenconfigIsis_LevelType & 3

#enumE_OpenconfigIsis_MetricStyle:
	#OpenconfigIsis_MetricStyle_UNSET |
	#OpenconfigIsis_MetricStyle_NARROW_METRIC |
	#OpenconfigIsis_MetricStyle_WIDE_METRIC

#values_E_OpenconfigIsis_MetricStyle: {
	OpenconfigIsis_MetricStyle_UNSET:         #OpenconfigIsis_MetricStyle_UNSET
	OpenconfigIsis_MetricStyle_NARROW_METRIC: #OpenconfigIsis_MetricStyle_NARROW_METRIC
	OpenconfigIsis_MetricStyle_WIDE_METRIC:   #OpenconfigIsis_MetricStyle_WIDE_METRIC
}

#OpenconfigIsis_MetricStyle_UNSET: #E_OpenconfigIsis_MetricStyle & 0

#OpenconfigIsis_MetricStyle_NARROW_METRIC: #E_OpenconfigIsis_MetricStyle & 1

#OpenconfigIsis_MetricStyle_WIDE_METRIC: #E_OpenconfigIsis_MetricStyle & 2

#enumE_OpenconfigKeychainTypes_AUTH_TYPE:
	#OpenconfigKeychainTypes_AUTH_TYPE_UNSET |
	#OpenconfigKeychainTypes_AUTH_TYPE_KEYCHAIN |
	#OpenconfigKeychainTypes_AUTH_TYPE_SIMPLE_KEY

#values_E_OpenconfigKeychainTypes_AUTH_TYPE: {
	OpenconfigKeychainTypes_AUTH_TYPE_UNSET:      #OpenconfigKeychainTypes_AUTH_TYPE_UNSET
	OpenconfigKeychainTypes_AUTH_TYPE_KEYCHAIN:   #OpenconfigKeychainTypes_AUTH_TYPE_KEYCHAIN
	OpenconfigKeychainTypes_AUTH_TYPE_SIMPLE_KEY: #OpenconfigKeychainTypes_AUTH_TYPE_SIMPLE_KEY
}

#OpenconfigKeychainTypes_AUTH_TYPE_UNSET: #E_OpenconfigKeychainTypes_AUTH_TYPE & 0

#OpenconfigKeychainTypes_AUTH_TYPE_KEYCHAIN: #E_OpenconfigKeychainTypes_AUTH_TYPE & 1

#OpenconfigKeychainTypes_AUTH_TYPE_SIMPLE_KEY: #E_OpenconfigKeychainTypes_AUTH_TYPE & 2

#enumE_OpenconfigKeychainTypes_CRYPTO_TYPE:
	#OpenconfigKeychainTypes_CRYPTO_TYPE_UNSET |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_AES_28_CMAC_96 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_CRYPTO_NONE |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_MD5 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_12 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_20 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_96 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_256 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_MD5 |
	#OpenconfigKeychainTypes_CRYPTO_TYPE_SHA_1

#values_E_OpenconfigKeychainTypes_CRYPTO_TYPE: {
	OpenconfigKeychainTypes_CRYPTO_TYPE_UNSET:          #OpenconfigKeychainTypes_CRYPTO_TYPE_UNSET
	OpenconfigKeychainTypes_CRYPTO_TYPE_AES_28_CMAC_96: #OpenconfigKeychainTypes_CRYPTO_TYPE_AES_28_CMAC_96
	OpenconfigKeychainTypes_CRYPTO_TYPE_CRYPTO_NONE:    #OpenconfigKeychainTypes_CRYPTO_TYPE_CRYPTO_NONE
	OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_MD5:       #OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_MD5
	OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1:     #OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1
	OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_12:  #OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_12
	OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_20:  #OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_20
	OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_96:  #OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_96
	OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_256:   #OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_256
	OpenconfigKeychainTypes_CRYPTO_TYPE_MD5:            #OpenconfigKeychainTypes_CRYPTO_TYPE_MD5
	OpenconfigKeychainTypes_CRYPTO_TYPE_SHA_1:          #OpenconfigKeychainTypes_CRYPTO_TYPE_SHA_1
}

#OpenconfigKeychainTypes_CRYPTO_TYPE_UNSET: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 0

#OpenconfigKeychainTypes_CRYPTO_TYPE_AES_28_CMAC_96: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 1

#OpenconfigKeychainTypes_CRYPTO_TYPE_CRYPTO_NONE: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 2

#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_MD5: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 3

#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 4

#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_12: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 5

#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_20: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 6

#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_1_96: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 7

#OpenconfigKeychainTypes_CRYPTO_TYPE_HMAC_SHA_256: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 8

#OpenconfigKeychainTypes_CRYPTO_TYPE_MD5: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 9

#OpenconfigKeychainTypes_CRYPTO_TYPE_SHA_1: #E_OpenconfigKeychainTypes_CRYPTO_TYPE & 10

#enumE_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance:
	#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_UNSET |
	#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_FOREVER

#values_E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance: {
	OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_UNSET:   #OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_UNSET
	OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_FOREVER: #OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_FOREVER
}

#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_UNSET: #E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance & 0

#OpenconfigKeychain_Keychains_Keychain_Config_Tolerance_FOREVER: #E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance & 1

#enumE_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP:
	#OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_UNSET |
	#OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_DROP |
	#OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_LOCAL_LINK

#values_E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP: {
	OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_UNSET:      #OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_UNSET
	OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_DROP:       #OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_DROP
	OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_LOCAL_LINK: #OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_LOCAL_LINK
}

#OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_UNSET: #E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP & 0

#OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_DROP: #E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP & 1

#OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP_LOCAL_LINK: #E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP & 2

#enumE_OpenconfigMplsLdp_MplsLdpAfi:
	#OpenconfigMplsLdp_MplsLdpAfi_UNSET |
	#OpenconfigMplsLdp_MplsLdpAfi_IPV4 |
	#OpenconfigMplsLdp_MplsLdpAfi_IPV6

#values_E_OpenconfigMplsLdp_MplsLdpAfi: {
	OpenconfigMplsLdp_MplsLdpAfi_UNSET: #OpenconfigMplsLdp_MplsLdpAfi_UNSET
	OpenconfigMplsLdp_MplsLdpAfi_IPV4:  #OpenconfigMplsLdp_MplsLdpAfi_IPV4
	OpenconfigMplsLdp_MplsLdpAfi_IPV6:  #OpenconfigMplsLdp_MplsLdpAfi_IPV6
}

#OpenconfigMplsLdp_MplsLdpAfi_UNSET: #E_OpenconfigMplsLdp_MplsLdpAfi & 0

#OpenconfigMplsLdp_MplsLdpAfi_IPV4: #E_OpenconfigMplsLdp_MplsLdpAfi & 1

#OpenconfigMplsLdp_MplsLdpAfi_IPV6: #E_OpenconfigMplsLdp_MplsLdpAfi & 2

#enumE_OpenconfigMplsTypes_LSP_METRIC_TYPE:
	#OpenconfigMplsTypes_LSP_METRIC_TYPE_UNSET |
	#OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_ABSOLUTE |
	#OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_INHERITED |
	#OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_RELATIVE

#values_E_OpenconfigMplsTypes_LSP_METRIC_TYPE: {
	OpenconfigMplsTypes_LSP_METRIC_TYPE_UNSET:                #OpenconfigMplsTypes_LSP_METRIC_TYPE_UNSET
	OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_ABSOLUTE:  #OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_ABSOLUTE
	OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_INHERITED: #OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_INHERITED
	OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_RELATIVE:  #OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_RELATIVE
}

#OpenconfigMplsTypes_LSP_METRIC_TYPE_UNSET: #E_OpenconfigMplsTypes_LSP_METRIC_TYPE & 0

#OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_ABSOLUTE: #E_OpenconfigMplsTypes_LSP_METRIC_TYPE & 1

#OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_INHERITED: #E_OpenconfigMplsTypes_LSP_METRIC_TYPE & 2

#OpenconfigMplsTypes_LSP_METRIC_TYPE_LSP_METRIC_RELATIVE: #E_OpenconfigMplsTypes_LSP_METRIC_TYPE & 3

#enumE_OpenconfigMplsTypes_NULL_LABEL_TYPE:
	#OpenconfigMplsTypes_NULL_LABEL_TYPE_UNSET |
	#OpenconfigMplsTypes_NULL_LABEL_TYPE_EXPLICIT |
	#OpenconfigMplsTypes_NULL_LABEL_TYPE_IMPLICIT

#values_E_OpenconfigMplsTypes_NULL_LABEL_TYPE: {
	OpenconfigMplsTypes_NULL_LABEL_TYPE_UNSET:    #OpenconfigMplsTypes_NULL_LABEL_TYPE_UNSET
	OpenconfigMplsTypes_NULL_LABEL_TYPE_EXPLICIT: #OpenconfigMplsTypes_NULL_LABEL_TYPE_EXPLICIT
	OpenconfigMplsTypes_NULL_LABEL_TYPE_IMPLICIT: #OpenconfigMplsTypes_NULL_LABEL_TYPE_IMPLICIT
}

#OpenconfigMplsTypes_NULL_LABEL_TYPE_UNSET: #E_OpenconfigMplsTypes_NULL_LABEL_TYPE & 0

#OpenconfigMplsTypes_NULL_LABEL_TYPE_EXPLICIT: #E_OpenconfigMplsTypes_NULL_LABEL_TYPE & 1

#OpenconfigMplsTypes_NULL_LABEL_TYPE_IMPLICIT: #E_OpenconfigMplsTypes_NULL_LABEL_TYPE & 2

#enumE_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD:
	#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_UNSET |
	#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXPLICITLY_DEFINED |
	#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXTERNALLY_QUERIED |
	#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_LOCALLY_COMPUTED

#values_E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD: {
	OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_UNSET:              #OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_UNSET
	OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXPLICITLY_DEFINED: #OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXPLICITLY_DEFINED
	OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXTERNALLY_QUERIED: #OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXTERNALLY_QUERIED
	OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_LOCALLY_COMPUTED:   #OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_LOCALLY_COMPUTED
}

#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_UNSET: #E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD & 0

#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXPLICITLY_DEFINED: #E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD & 1

#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_EXTERNALLY_QUERIED: #E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD & 2

#OpenconfigMplsTypes_PATH_COMPUTATION_METHOD_LOCALLY_COMPUTED: #E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD & 3

#enumE_OpenconfigMplsTypes_PATH_METRIC_TYPE:
	#OpenconfigMplsTypes_PATH_METRIC_TYPE_UNSET |
	#OpenconfigMplsTypes_PATH_METRIC_TYPE_HOP_COUNT |
	#OpenconfigMplsTypes_PATH_METRIC_TYPE_IGP_METRIC |
	#OpenconfigMplsTypes_PATH_METRIC_TYPE_PATH_DELAY |
	#OpenconfigMplsTypes_PATH_METRIC_TYPE_TE_METRIC

#values_E_OpenconfigMplsTypes_PATH_METRIC_TYPE: {
	OpenconfigMplsTypes_PATH_METRIC_TYPE_UNSET:      #OpenconfigMplsTypes_PATH_METRIC_TYPE_UNSET
	OpenconfigMplsTypes_PATH_METRIC_TYPE_HOP_COUNT:  #OpenconfigMplsTypes_PATH_METRIC_TYPE_HOP_COUNT
	OpenconfigMplsTypes_PATH_METRIC_TYPE_IGP_METRIC: #OpenconfigMplsTypes_PATH_METRIC_TYPE_IGP_METRIC
	OpenconfigMplsTypes_PATH_METRIC_TYPE_PATH_DELAY: #OpenconfigMplsTypes_PATH_METRIC_TYPE_PATH_DELAY
	OpenconfigMplsTypes_PATH_METRIC_TYPE_TE_METRIC:  #OpenconfigMplsTypes_PATH_METRIC_TYPE_TE_METRIC
}

#OpenconfigMplsTypes_PATH_METRIC_TYPE_UNSET: #E_OpenconfigMplsTypes_PATH_METRIC_TYPE & 0

#OpenconfigMplsTypes_PATH_METRIC_TYPE_HOP_COUNT: #E_OpenconfigMplsTypes_PATH_METRIC_TYPE & 1

#OpenconfigMplsTypes_PATH_METRIC_TYPE_IGP_METRIC: #E_OpenconfigMplsTypes_PATH_METRIC_TYPE & 2

#OpenconfigMplsTypes_PATH_METRIC_TYPE_PATH_DELAY: #E_OpenconfigMplsTypes_PATH_METRIC_TYPE & 3

#OpenconfigMplsTypes_PATH_METRIC_TYPE_TE_METRIC: #E_OpenconfigMplsTypes_PATH_METRIC_TYPE & 4

#enumE_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL:
	#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_UNSET |
	#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_LDP |
	#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_RSVP |
	#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_SR

#values_E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL: {
	OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_UNSET:           #OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_UNSET
	OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_LDP:  #OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_LDP
	OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_RSVP: #OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_RSVP
	OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_SR:   #OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_SR
}

#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_UNSET: #E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL & 0

#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_LDP: #E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL & 1

#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_RSVP: #E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL & 2

#OpenconfigMplsTypes_PATH_SETUP_PROTOCOL_PATH_SETUP_SR: #E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL & 3

#enumE_OpenconfigMplsTypes_PROTECTION_TYPE:
	#OpenconfigMplsTypes_PROTECTION_TYPE_UNSET |
	#OpenconfigMplsTypes_PROTECTION_TYPE_LINK_NODE_PROTECTION_REQUESTED |
	#OpenconfigMplsTypes_PROTECTION_TYPE_LINK_PROTECTION_REQUIRED |
	#OpenconfigMplsTypes_PROTECTION_TYPE_UNPROTECTED

#values_E_OpenconfigMplsTypes_PROTECTION_TYPE: {
	OpenconfigMplsTypes_PROTECTION_TYPE_UNSET:                          #OpenconfigMplsTypes_PROTECTION_TYPE_UNSET
	OpenconfigMplsTypes_PROTECTION_TYPE_LINK_NODE_PROTECTION_REQUESTED: #OpenconfigMplsTypes_PROTECTION_TYPE_LINK_NODE_PROTECTION_REQUESTED
	OpenconfigMplsTypes_PROTECTION_TYPE_LINK_PROTECTION_REQUIRED:       #OpenconfigMplsTypes_PROTECTION_TYPE_LINK_PROTECTION_REQUIRED
	OpenconfigMplsTypes_PROTECTION_TYPE_UNPROTECTED:                    #OpenconfigMplsTypes_PROTECTION_TYPE_UNPROTECTED
}

#OpenconfigMplsTypes_PROTECTION_TYPE_UNSET: #E_OpenconfigMplsTypes_PROTECTION_TYPE & 0

#OpenconfigMplsTypes_PROTECTION_TYPE_LINK_NODE_PROTECTION_REQUESTED: #E_OpenconfigMplsTypes_PROTECTION_TYPE & 1

#OpenconfigMplsTypes_PROTECTION_TYPE_LINK_PROTECTION_REQUIRED: #E_OpenconfigMplsTypes_PROTECTION_TYPE & 2

#OpenconfigMplsTypes_PROTECTION_TYPE_UNPROTECTED: #E_OpenconfigMplsTypes_PROTECTION_TYPE & 3

#enumE_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION:
	#OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_UNSET |
	#OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_RAW_MODE |
	#OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_TAGGED_MODE

#values_E_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION: {
	OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_UNSET:                    #OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_UNSET
	OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_RAW_MODE:    #OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_RAW_MODE
	OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_TAGGED_MODE: #OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_TAGGED_MODE
}

#OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_UNSET: #E_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION & 0

#OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_RAW_MODE: #E_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION & 1

#OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION_PWE_ETHERNET_TAGGED_MODE: #E_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION & 2

#enumE_OpenconfigMplsTypes_RSVP_AUTH_TYPE:
	#OpenconfigMplsTypes_RSVP_AUTH_TYPE_UNSET |
	#OpenconfigMplsTypes_RSVP_AUTH_TYPE_RSVP_AUTH_MD5

#values_E_OpenconfigMplsTypes_RSVP_AUTH_TYPE: {
	OpenconfigMplsTypes_RSVP_AUTH_TYPE_UNSET:         #OpenconfigMplsTypes_RSVP_AUTH_TYPE_UNSET
	OpenconfigMplsTypes_RSVP_AUTH_TYPE_RSVP_AUTH_MD5: #OpenconfigMplsTypes_RSVP_AUTH_TYPE_RSVP_AUTH_MD5
}

#OpenconfigMplsTypes_RSVP_AUTH_TYPE_UNSET: #E_OpenconfigMplsTypes_RSVP_AUTH_TYPE & 0

#OpenconfigMplsTypes_RSVP_AUTH_TYPE_RSVP_AUTH_MD5: #E_OpenconfigMplsTypes_RSVP_AUTH_TYPE & 1

#enumE_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS:
	#OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_UNSET |
	#OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_DOWN |
	#OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_UP

#values_E_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS: {
	OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_UNSET:      #OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_UNSET
	OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_DOWN: #OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_DOWN
	OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_UP:   #OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_UP
}

#OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_UNSET: #E_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS & 0

#OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_DOWN: #E_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS & 1

#OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS_ADMIN_UP: #E_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS & 2

#enumE_OpenconfigMplsTypes_TUNNEL_TYPE:
	#OpenconfigMplsTypes_TUNNEL_TYPE_UNSET |
	#OpenconfigMplsTypes_TUNNEL_TYPE_P2MP |
	#OpenconfigMplsTypes_TUNNEL_TYPE_P2P

#values_E_OpenconfigMplsTypes_TUNNEL_TYPE: {
	OpenconfigMplsTypes_TUNNEL_TYPE_UNSET: #OpenconfigMplsTypes_TUNNEL_TYPE_UNSET
	OpenconfigMplsTypes_TUNNEL_TYPE_P2MP:  #OpenconfigMplsTypes_TUNNEL_TYPE_P2MP
	OpenconfigMplsTypes_TUNNEL_TYPE_P2P:   #OpenconfigMplsTypes_TUNNEL_TYPE_P2P
}

#OpenconfigMplsTypes_TUNNEL_TYPE_UNSET: #E_OpenconfigMplsTypes_TUNNEL_TYPE & 0

#OpenconfigMplsTypes_TUNNEL_TYPE_P2MP: #E_OpenconfigMplsTypes_TUNNEL_TYPE & 1

#OpenconfigMplsTypes_TUNNEL_TYPE_P2P: #E_OpenconfigMplsTypes_TUNNEL_TYPE & 2

#enumE_OpenconfigMpls_CspfTieBreaking:
	#OpenconfigMpls_CspfTieBreaking_UNSET |
	#OpenconfigMpls_CspfTieBreaking_RANDOM |
	#OpenconfigMpls_CspfTieBreaking_LEAST_FILL |
	#OpenconfigMpls_CspfTieBreaking_MOST_FILL

#values_E_OpenconfigMpls_CspfTieBreaking: {
	OpenconfigMpls_CspfTieBreaking_UNSET:      #OpenconfigMpls_CspfTieBreaking_UNSET
	OpenconfigMpls_CspfTieBreaking_RANDOM:     #OpenconfigMpls_CspfTieBreaking_RANDOM
	OpenconfigMpls_CspfTieBreaking_LEAST_FILL: #OpenconfigMpls_CspfTieBreaking_LEAST_FILL
	OpenconfigMpls_CspfTieBreaking_MOST_FILL:  #OpenconfigMpls_CspfTieBreaking_MOST_FILL
}

#OpenconfigMpls_CspfTieBreaking_UNSET: #E_OpenconfigMpls_CspfTieBreaking & 0

#OpenconfigMpls_CspfTieBreaking_RANDOM: #E_OpenconfigMpls_CspfTieBreaking & 1

#OpenconfigMpls_CspfTieBreaking_LEAST_FILL: #E_OpenconfigMpls_CspfTieBreaking & 2

#OpenconfigMpls_CspfTieBreaking_MOST_FILL: #E_OpenconfigMpls_CspfTieBreaking & 3

#enumE_OpenconfigMpls_LspControlType:
	#OpenconfigMpls_LspControlType_UNSET |
	#OpenconfigMpls_LspControlType_PCE_DELEGATED |
	#OpenconfigMpls_LspControlType_PCC_CONTROLLED |
	#OpenconfigMpls_LspControlType_PCC_REPORT_ONLY

#values_E_OpenconfigMpls_LspControlType: {
	OpenconfigMpls_LspControlType_UNSET:           #OpenconfigMpls_LspControlType_UNSET
	OpenconfigMpls_LspControlType_PCE_DELEGATED:   #OpenconfigMpls_LspControlType_PCE_DELEGATED
	OpenconfigMpls_LspControlType_PCC_CONTROLLED:  #OpenconfigMpls_LspControlType_PCC_CONTROLLED
	OpenconfigMpls_LspControlType_PCC_REPORT_ONLY: #OpenconfigMpls_LspControlType_PCC_REPORT_ONLY
}

#OpenconfigMpls_LspControlType_UNSET: #E_OpenconfigMpls_LspControlType & 0

#OpenconfigMpls_LspControlType_PCE_DELEGATED: #E_OpenconfigMpls_LspControlType & 1

#OpenconfigMpls_LspControlType_PCC_CONTROLLED: #E_OpenconfigMpls_LspControlType & 2

#OpenconfigMpls_LspControlType_PCC_REPORT_ONLY: #E_OpenconfigMpls_LspControlType & 3

#enumE_OpenconfigMpls_MplsHopType:
	#OpenconfigMpls_MplsHopType_UNSET |
	#OpenconfigMpls_MplsHopType_LOOSE |
	#OpenconfigMpls_MplsHopType_STRICT

#values_E_OpenconfigMpls_MplsHopType: {
	OpenconfigMpls_MplsHopType_UNSET:  #OpenconfigMpls_MplsHopType_UNSET
	OpenconfigMpls_MplsHopType_LOOSE:  #OpenconfigMpls_MplsHopType_LOOSE
	OpenconfigMpls_MplsHopType_STRICT: #OpenconfigMpls_MplsHopType_STRICT
}

#OpenconfigMpls_MplsHopType_UNSET: #E_OpenconfigMpls_MplsHopType & 0

#OpenconfigMpls_MplsHopType_LOOSE: #E_OpenconfigMpls_MplsHopType & 1

#OpenconfigMpls_MplsHopType_STRICT: #E_OpenconfigMpls_MplsHopType & 2

#enumE_OpenconfigMpls_MplsSrlgFloodingType:
	#OpenconfigMpls_MplsSrlgFloodingType_UNSET |
	#OpenconfigMpls_MplsSrlgFloodingType_FLOODED_SRLG |
	#OpenconfigMpls_MplsSrlgFloodingType_STATIC_SRLG

#values_E_OpenconfigMpls_MplsSrlgFloodingType: {
	OpenconfigMpls_MplsSrlgFloodingType_UNSET:        #OpenconfigMpls_MplsSrlgFloodingType_UNSET
	OpenconfigMpls_MplsSrlgFloodingType_FLOODED_SRLG: #OpenconfigMpls_MplsSrlgFloodingType_FLOODED_SRLG
	OpenconfigMpls_MplsSrlgFloodingType_STATIC_SRLG:  #OpenconfigMpls_MplsSrlgFloodingType_STATIC_SRLG
}

#OpenconfigMpls_MplsSrlgFloodingType_UNSET: #E_OpenconfigMpls_MplsSrlgFloodingType & 0

#OpenconfigMpls_MplsSrlgFloodingType_FLOODED_SRLG: #E_OpenconfigMpls_MplsSrlgFloodingType & 1

#OpenconfigMpls_MplsSrlgFloodingType_STATIC_SRLG: #E_OpenconfigMpls_MplsSrlgFloodingType & 2

#enumE_OpenconfigMpls_TeBandwidthType:
	#OpenconfigMpls_TeBandwidthType_UNSET |
	#OpenconfigMpls_TeBandwidthType_SPECIFIED |
	#OpenconfigMpls_TeBandwidthType_AUTO

#values_E_OpenconfigMpls_TeBandwidthType: {
	OpenconfigMpls_TeBandwidthType_UNSET:     #OpenconfigMpls_TeBandwidthType_UNSET
	OpenconfigMpls_TeBandwidthType_SPECIFIED: #OpenconfigMpls_TeBandwidthType_SPECIFIED
	OpenconfigMpls_TeBandwidthType_AUTO:      #OpenconfigMpls_TeBandwidthType_AUTO
}

#OpenconfigMpls_TeBandwidthType_UNSET: #E_OpenconfigMpls_TeBandwidthType & 0

#OpenconfigMpls_TeBandwidthType_SPECIFIED: #E_OpenconfigMpls_TeBandwidthType & 1

#OpenconfigMpls_TeBandwidthType_AUTO: #E_OpenconfigMpls_TeBandwidthType & 2

#enumE_OpenconfigNetworkInstanceTypes_ENCAPSULATION:
	#OpenconfigNetworkInstanceTypes_ENCAPSULATION_UNSET |
	#OpenconfigNetworkInstanceTypes_ENCAPSULATION_MPLS |
	#OpenconfigNetworkInstanceTypes_ENCAPSULATION_VXLAN

#values_E_OpenconfigNetworkInstanceTypes_ENCAPSULATION: {
	OpenconfigNetworkInstanceTypes_ENCAPSULATION_UNSET: #OpenconfigNetworkInstanceTypes_ENCAPSULATION_UNSET
	OpenconfigNetworkInstanceTypes_ENCAPSULATION_MPLS:  #OpenconfigNetworkInstanceTypes_ENCAPSULATION_MPLS
	OpenconfigNetworkInstanceTypes_ENCAPSULATION_VXLAN: #OpenconfigNetworkInstanceTypes_ENCAPSULATION_VXLAN
}

#OpenconfigNetworkInstanceTypes_ENCAPSULATION_UNSET: #E_OpenconfigNetworkInstanceTypes_ENCAPSULATION & 0

#OpenconfigNetworkInstanceTypes_ENCAPSULATION_MPLS: #E_OpenconfigNetworkInstanceTypes_ENCAPSULATION & 1

#OpenconfigNetworkInstanceTypes_ENCAPSULATION_VXLAN: #E_OpenconfigNetworkInstanceTypes_ENCAPSULATION & 2

#enumE_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE:
	#OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_UNSET |
	#OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_LOCAL |
	#OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_REMOTE

#values_E_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE: {
	OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_UNSET:  #OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_UNSET
	OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_LOCAL:  #OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_LOCAL
	OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_REMOTE: #OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_REMOTE
}

#OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_UNSET: #E_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE & 0

#OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_LOCAL: #E_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE & 1

#OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE_REMOTE: #E_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE & 2

#enumE_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE:
	#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_UNSET |
	#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_INSTANCE_LABEL |
	#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_NEXTHOP |
	#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_PREFIX

#values_E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE: {
	OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_UNSET:          #OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_UNSET
	OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_INSTANCE_LABEL: #OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_INSTANCE_LABEL
	OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_NEXTHOP:    #OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_NEXTHOP
	OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_PREFIX:     #OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_PREFIX
}

#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_UNSET: #E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE & 0

#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_INSTANCE_LABEL: #E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE & 1

#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_NEXTHOP: #E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE & 2

#OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE_PER_PREFIX: #E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE & 3

#enumE_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE:
	#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_UNSET |
	#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_DEFAULT_INSTANCE |
	#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2L3 |
	#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2P2P |
	#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2VSI |
	#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L3VRF

#values_E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE: {
	OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_UNSET:            #OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_UNSET
	OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_DEFAULT_INSTANCE: #OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_DEFAULT_INSTANCE
	OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2L3:             #OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2L3
	OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2P2P:            #OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2P2P
	OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2VSI:            #OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2VSI
	OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L3VRF:            #OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L3VRF
}

#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_UNSET: #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE & 0

#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_DEFAULT_INSTANCE: #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE & 1

#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2L3: #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE & 2

#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2P2P: #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE & 3

#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L2VSI: #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE & 4

#OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE_L3VRF: #E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE & 5

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_AUTO

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_UNSET: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_AUTO:  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_AUTO
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi_AUTO: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi & 1

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_DEFAULT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_HIGHEST_RANDOM_WEIGHT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_PREFERENCE

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_UNSET:                 #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_DEFAULT:               #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_DEFAULT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_HIGHEST_RANDOM_WEIGHT: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_HIGHEST_RANDOM_WEIGHT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_PREFERENCE:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_PREFERENCE
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_DEFAULT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_HIGHEST_RANDOM_WEIGHT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod_PREFERENCE: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod & 3

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_STATIC_INGRESS_REPLICATION |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_BGP |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_MULTICAST

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_UNSET:                      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_STATIC_INGRESS_REPLICATION: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_STATIC_INGRESS_REPLICATION
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_BGP:                        #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_BGP
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_MULTICAST:                  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_MULTICAST
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_STATIC_INGRESS_REPLICATION: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_BGP: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode_MULTICAST: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode & 3

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_AUTO

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_UNSET: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_AUTO:  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_AUTO
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher_AUTO: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher & 1

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_AUTO

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_UNSET: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_AUTO:  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_AUTO
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget_AUTO: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget & 1

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_AUTO

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_UNSET: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_AUTO:  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_AUTO
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget_AUTO: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget & 1

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_SYMETRIC |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_ASYMETRIC |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_HYBRID |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_CENTRALIZED

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_UNSET:                 #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_SYMETRIC:  #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_SYMETRIC
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_ASYMETRIC: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_ASYMETRIC
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_HYBRID:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_HYBRID
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_CENTRALIZED:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_CENTRALIZED
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_SYMETRIC: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_DISTRIBUTED_ASYMETRIC: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_HYBRID: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway_CENTRALIZED: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway & 4

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV4_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ROUTER_ALERT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV6_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IMPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ENTROPY_LABEL_INDICATOR |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_NO_LABEL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_UNSET:                   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV4_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV4_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ROUTER_ALERT:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ROUTER_ALERT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV6_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV6_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IMPLICIT_NULL:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IMPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ENTROPY_LABEL_INDICATOR: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ENTROPY_LABEL_INDICATOR
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_NO_LABEL:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_NO_LABEL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV4_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ROUTER_ALERT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IPV6_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_IMPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 4

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_ENTROPY_LABEL_INDICATOR: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 5

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound_NO_LABEL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound & 6

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV4_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ROUTER_ALERT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV6_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IMPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ENTROPY_LABEL_INDICATOR |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_NO_LABEL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_UNSET:                   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV4_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV4_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ROUTER_ALERT:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ROUTER_ALERT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV6_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV6_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IMPLICIT_NULL:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IMPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ENTROPY_LABEL_INDICATOR: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ENTROPY_LABEL_INDICATOR
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_NO_LABEL:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_NO_LABEL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV4_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ROUTER_ALERT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IPV6_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_IMPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 4

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_ENTROPY_LABEL_INDICATOR: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 5

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound_NO_LABEL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound & 6

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_ADJ_SID_ONLY |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_MIXED_MODE

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_UNSET:        #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_ADJ_SID_ONLY: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_ADJ_SID_ONLY
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_MIXED_MODE:   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_MIXED_MODE
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_ADJ_SID_ONLY: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode_MIXED_MODE: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode & 2

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV4_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ROUTER_ALERT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV6_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IMPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ENTROPY_LABEL_INDICATOR |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_NO_LABEL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_UNSET:                   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV4_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV4_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ROUTER_ALERT:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ROUTER_ALERT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV6_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV6_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IMPLICIT_NULL:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IMPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ENTROPY_LABEL_INDICATOR: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ENTROPY_LABEL_INDICATOR
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_NO_LABEL:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_NO_LABEL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV4_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ROUTER_ALERT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IPV6_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_IMPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 4

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_ENTROPY_LABEL_INDICATOR: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 5

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel_NO_LABEL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel & 6

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV4_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ROUTER_ALERT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV6_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IMPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ENTROPY_LABEL_INDICATOR |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_NO_LABEL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_UNSET:                   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV4_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV4_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ROUTER_ALERT:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ROUTER_ALERT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV6_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV6_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IMPLICIT_NULL:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IMPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ENTROPY_LABEL_INDICATOR: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ENTROPY_LABEL_INDICATOR
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_NO_LABEL:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_NO_LABEL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV4_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ROUTER_ALERT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IPV6_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_IMPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 4

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_ENTROPY_LABEL_INDICATOR: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 5

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel_NO_LABEL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel & 6

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_MIRRORED_UP_DOWN |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_SEPARATE_UP_DOWN

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_UNSET:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_MIRRORED_UP_DOWN: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_MIRRORED_UP_DOWN
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_SEPARATE_UP_DOWN: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_SEPARATE_UP_DOWN
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_MIRRORED_UP_DOWN: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification_SEPARATE_UP_DOWN: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification & 2

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_DELTA |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_THRESHOLD_CROSSED

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_UNSET:             #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_DELTA:             #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_DELTA
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_THRESHOLD_CROSSED: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_THRESHOLD_CROSSED
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_DELTA: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType_THRESHOLD_CROSSED: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType & 2

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_PBR_POLICY |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_VRF_SELECTION_POLICY

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_UNSET:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_PBR_POLICY:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_PBR_POLICY
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_VRF_SELECTION_POLICY: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_VRF_SELECTION_POLICY
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_PBR_POLICY: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type_VRF_SELECTION_POLICY: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type & 2

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV4_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ROUTER_ALERT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV6_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IMPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ENTROPY_LABEL_INDICATOR |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_NO_LABEL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_UNSET:                   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV4_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV4_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ROUTER_ALERT:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ROUTER_ALERT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV6_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV6_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IMPLICIT_NULL:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IMPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ENTROPY_LABEL_INDICATOR: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ENTROPY_LABEL_INDICATOR
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_NO_LABEL:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_NO_LABEL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV4_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ROUTER_ALERT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IPV6_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_IMPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 4

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_ENTROPY_LABEL_INDICATOR: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 5

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId_NO_LABEL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId & 6

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_NO_PHP |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_EXPLICIT_NULL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_UNSET:         #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_NO_PHP:        #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_NO_PHP
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_EXPLICIT_NULL: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_EXPLICIT_NULL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_NO_PHP: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions & 2

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV4_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ROUTER_ALERT |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV6_EXPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IMPLICIT_NULL |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ENTROPY_LABEL_INDICATOR |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_NO_LABEL

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_UNSET:                   #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV4_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV4_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ROUTER_ALERT:            #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ROUTER_ALERT
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV6_EXPLICIT_NULL:      #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV6_EXPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IMPLICIT_NULL:           #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IMPLICIT_NULL
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ENTROPY_LABEL_INDICATOR: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ENTROPY_LABEL_INDICATOR
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_NO_LABEL:                #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_NO_LABEL
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV4_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ROUTER_ALERT: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 2

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IPV6_EXPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 3

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_IMPLICIT_NULL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 4

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_ENTROPY_LABEL_INDICATOR: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 5

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId_NO_LABEL: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId & 6

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC1583_COMPATIBLE |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC2328_COMPATIBLE

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_UNSET:              #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC1583_COMPATIBLE: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC1583_COMPATIBLE
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC2328_COMPATIBLE: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC2328_COMPATIBLE
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC1583_COMPATIBLE: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode_RFC2328_COMPATIBLE: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode & 2

#enumE_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status:
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_UNSET |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_ACTIVE |
	#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_SUSPENDED

#values_E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status: {
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_UNSET:     #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_UNSET
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_ACTIVE:    #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_ACTIVE
	OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_SUSPENDED: #OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_SUSPENDED
}

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_UNSET: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status & 0

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_ACTIVE: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status & 1

#OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status_SUSPENDED: #E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status & 2

#enumE_OpenconfigOspfTypes_MAX_METRIC_INCLUDE:
	#OpenconfigOspfTypes_MAX_METRIC_INCLUDE_UNSET |
	#OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_STUB |
	#OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_TYPE2_EXTERNAL

#values_E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE: {
	OpenconfigOspfTypes_MAX_METRIC_INCLUDE_UNSET:                             #OpenconfigOspfTypes_MAX_METRIC_INCLUDE_UNSET
	OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_STUB:           #OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_STUB
	OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_TYPE2_EXTERNAL: #OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_TYPE2_EXTERNAL
}

#OpenconfigOspfTypes_MAX_METRIC_INCLUDE_UNSET: #E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE & 0

#OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_STUB: #E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE & 1

#OpenconfigOspfTypes_MAX_METRIC_INCLUDE_MAX_METRIC_INCLUDE_TYPE2_EXTERNAL: #E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE & 2

#enumE_OpenconfigOspfTypes_MAX_METRIC_TRIGGER:
	#OpenconfigOspfTypes_MAX_METRIC_TRIGGER_UNSET |
	#OpenconfigOspfTypes_MAX_METRIC_TRIGGER_MAX_METRIC_ON_SYSTEM_BOOT

#values_E_OpenconfigOspfTypes_MAX_METRIC_TRIGGER: {
	OpenconfigOspfTypes_MAX_METRIC_TRIGGER_UNSET:                     #OpenconfigOspfTypes_MAX_METRIC_TRIGGER_UNSET
	OpenconfigOspfTypes_MAX_METRIC_TRIGGER_MAX_METRIC_ON_SYSTEM_BOOT: #OpenconfigOspfTypes_MAX_METRIC_TRIGGER_MAX_METRIC_ON_SYSTEM_BOOT
}

#OpenconfigOspfTypes_MAX_METRIC_TRIGGER_UNSET: #E_OpenconfigOspfTypes_MAX_METRIC_TRIGGER & 0

#OpenconfigOspfTypes_MAX_METRIC_TRIGGER_MAX_METRIC_ON_SYSTEM_BOOT: #E_OpenconfigOspfTypes_MAX_METRIC_TRIGGER & 1

#enumE_OpenconfigOspfTypes_OSPF_NETWORK_TYPE:
	#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_UNSET |
	#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_BROADCAST_NETWORK |
	#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_NON_BROADCAST_NETWORK |
	#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_POINT_TO_POINT_NETWORK

#values_E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE: {
	OpenconfigOspfTypes_OSPF_NETWORK_TYPE_UNSET:                  #OpenconfigOspfTypes_OSPF_NETWORK_TYPE_UNSET
	OpenconfigOspfTypes_OSPF_NETWORK_TYPE_BROADCAST_NETWORK:      #OpenconfigOspfTypes_OSPF_NETWORK_TYPE_BROADCAST_NETWORK
	OpenconfigOspfTypes_OSPF_NETWORK_TYPE_NON_BROADCAST_NETWORK:  #OpenconfigOspfTypes_OSPF_NETWORK_TYPE_NON_BROADCAST_NETWORK
	OpenconfigOspfTypes_OSPF_NETWORK_TYPE_POINT_TO_POINT_NETWORK: #OpenconfigOspfTypes_OSPF_NETWORK_TYPE_POINT_TO_POINT_NETWORK
}

#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_UNSET: #E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE & 0

#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_BROADCAST_NETWORK: #E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE & 1

#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_NON_BROADCAST_NETWORK: #E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE & 2

#OpenconfigOspfTypes_OSPF_NETWORK_TYPE_POINT_TO_POINT_NETWORK: #E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE & 3

#enumE_OpenconfigPacketMatchTypes_ETHERTYPE:
	#OpenconfigPacketMatchTypes_ETHERTYPE_UNSET |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ARP |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV4 |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV6 |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_LLDP |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_MPLS |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ROCE |
	#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_VLAN

#values_E_OpenconfigPacketMatchTypes_ETHERTYPE: {
	OpenconfigPacketMatchTypes_ETHERTYPE_UNSET:          #OpenconfigPacketMatchTypes_ETHERTYPE_UNSET
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ARP:  #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ARP
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV4: #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV4
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV6: #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV6
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_LLDP: #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_LLDP
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_MPLS: #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_MPLS
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ROCE: #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ROCE
	OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_VLAN: #OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_VLAN
}

#OpenconfigPacketMatchTypes_ETHERTYPE_UNSET: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 0

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ARP: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 1

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV4: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 2

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_IPV6: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 3

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_LLDP: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 4

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_MPLS: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 5

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_ROCE: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 6

#OpenconfigPacketMatchTypes_ETHERTYPE_ETHERTYPE_VLAN: #E_OpenconfigPacketMatchTypes_ETHERTYPE & 7

#enumE_OpenconfigPacketMatchTypes_IP_PROTOCOL:
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_UNSET |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_AUTH |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_GRE |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_ICMP |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IGMP |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IN_IP |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_L2TP |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_PIM |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_RSVP |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_TCP |
	#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_UDP

#values_E_OpenconfigPacketMatchTypes_IP_PROTOCOL: {
	OpenconfigPacketMatchTypes_IP_PROTOCOL_UNSET:    #OpenconfigPacketMatchTypes_IP_PROTOCOL_UNSET
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_AUTH:  #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_AUTH
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_GRE:   #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_GRE
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_ICMP:  #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_ICMP
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IGMP:  #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IGMP
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IN_IP: #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IN_IP
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_L2TP:  #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_L2TP
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_PIM:   #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_PIM
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_RSVP:  #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_RSVP
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_TCP:   #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_TCP
	OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_UDP:   #OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_UDP
}

#OpenconfigPacketMatchTypes_IP_PROTOCOL_UNSET: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 0

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_AUTH: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 1

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_GRE: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 2

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_ICMP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 3

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IGMP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 4

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_IN_IP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 5

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_L2TP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 6

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_PIM: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 7

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_RSVP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 8

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_TCP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 9

#OpenconfigPacketMatchTypes_IP_PROTOCOL_IP_UDP: #E_OpenconfigPacketMatchTypes_IP_PROTOCOL & 10

#enumE_OpenconfigPacketMatchTypes_TCP_FLAGS:
	#OpenconfigPacketMatchTypes_TCP_FLAGS_UNSET |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ACK |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_CWR |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ECE |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_FIN |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_PSH |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_RST |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_SYN |
	#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_URG

#values_E_OpenconfigPacketMatchTypes_TCP_FLAGS: {
	OpenconfigPacketMatchTypes_TCP_FLAGS_UNSET:   #OpenconfigPacketMatchTypes_TCP_FLAGS_UNSET
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ACK: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ACK
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_CWR: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_CWR
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ECE: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ECE
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_FIN: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_FIN
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_PSH: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_PSH
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_RST: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_RST
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_SYN: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_SYN
	OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_URG: #OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_URG
}

#OpenconfigPacketMatchTypes_TCP_FLAGS_UNSET: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 0

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ACK: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 1

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_CWR: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 2

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_ECE: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 3

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_FIN: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 4

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_PSH: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 5

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_RST: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 6

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_SYN: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 7

#OpenconfigPacketMatchTypes_TCP_FLAGS_TCP_URG: #E_OpenconfigPacketMatchTypes_TCP_FLAGS & 8

#enumE_OpenconfigPcep_PceModeType:
	#OpenconfigPcep_PceModeType_UNSET |
	#OpenconfigPcep_PceModeType_STATELESS |
	#OpenconfigPcep_PceModeType_STATEFUL_PASSIVE |
	#OpenconfigPcep_PceModeType_STATEFUL_ACTIVE

#values_E_OpenconfigPcep_PceModeType: {
	OpenconfigPcep_PceModeType_UNSET:            #OpenconfigPcep_PceModeType_UNSET
	OpenconfigPcep_PceModeType_STATELESS:        #OpenconfigPcep_PceModeType_STATELESS
	OpenconfigPcep_PceModeType_STATEFUL_PASSIVE: #OpenconfigPcep_PceModeType_STATEFUL_PASSIVE
	OpenconfigPcep_PceModeType_STATEFUL_ACTIVE:  #OpenconfigPcep_PceModeType_STATEFUL_ACTIVE
}

#OpenconfigPcep_PceModeType_UNSET: #E_OpenconfigPcep_PceModeType & 0

#OpenconfigPcep_PceModeType_STATELESS: #E_OpenconfigPcep_PceModeType & 1

#OpenconfigPcep_PceModeType_STATEFUL_PASSIVE: #E_OpenconfigPcep_PceModeType & 2

#OpenconfigPcep_PceModeType_STATEFUL_ACTIVE: #E_OpenconfigPcep_PceModeType & 3

#enumE_OpenconfigPimTypes_PIM_MODE:
	#OpenconfigPimTypes_PIM_MODE_UNSET |
	#OpenconfigPimTypes_PIM_MODE_PIM_MODE_DENSE |
	#OpenconfigPimTypes_PIM_MODE_PIM_MODE_SPARSE

#values_E_OpenconfigPimTypes_PIM_MODE: {
	OpenconfigPimTypes_PIM_MODE_UNSET:           #OpenconfigPimTypes_PIM_MODE_UNSET
	OpenconfigPimTypes_PIM_MODE_PIM_MODE_DENSE:  #OpenconfigPimTypes_PIM_MODE_PIM_MODE_DENSE
	OpenconfigPimTypes_PIM_MODE_PIM_MODE_SPARSE: #OpenconfigPimTypes_PIM_MODE_PIM_MODE_SPARSE
}

#OpenconfigPimTypes_PIM_MODE_UNSET: #E_OpenconfigPimTypes_PIM_MODE & 0

#OpenconfigPimTypes_PIM_MODE_PIM_MODE_DENSE: #E_OpenconfigPimTypes_PIM_MODE & 1

#OpenconfigPimTypes_PIM_MODE_PIM_MODE_SPARSE: #E_OpenconfigPimTypes_PIM_MODE & 2

#enumE_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE:
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_UNSET |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_BGP |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_DIRECTLY_CONNECTED |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_GRIBI |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_IGMP |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_ISIS |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_LOCAL_AGGREGATE |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF3 |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PCEP |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PIM |
	#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_STATIC

#values_E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE: {
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_UNSET:              #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_UNSET
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_BGP:                #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_BGP
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_DIRECTLY_CONNECTED: #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_DIRECTLY_CONNECTED
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_GRIBI:              #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_GRIBI
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_IGMP:               #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_IGMP
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_ISIS:               #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_ISIS
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_LOCAL_AGGREGATE:    #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_LOCAL_AGGREGATE
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF:               #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF3:              #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF3
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PCEP:               #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PCEP
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PIM:                #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PIM
	OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_STATIC:             #OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_STATIC
}

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_UNSET: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 0

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_BGP: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 1

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_DIRECTLY_CONNECTED: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 2

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_GRIBI: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 3

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_IGMP: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 4

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_ISIS: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 5

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_LOCAL_AGGREGATE: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 6

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 7

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_OSPF3: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 8

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PCEP: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 9

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_PIM: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 10

#OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE_STATIC: #E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE & 11

#enumE_OpenconfigRoutingPolicy_DefaultPolicyType:
	#OpenconfigRoutingPolicy_DefaultPolicyType_UNSET |
	#OpenconfigRoutingPolicy_DefaultPolicyType_ACCEPT_ROUTE |
	#OpenconfigRoutingPolicy_DefaultPolicyType_REJECT_ROUTE

#values_E_OpenconfigRoutingPolicy_DefaultPolicyType: {
	OpenconfigRoutingPolicy_DefaultPolicyType_UNSET:        #OpenconfigRoutingPolicy_DefaultPolicyType_UNSET
	OpenconfigRoutingPolicy_DefaultPolicyType_ACCEPT_ROUTE: #OpenconfigRoutingPolicy_DefaultPolicyType_ACCEPT_ROUTE
	OpenconfigRoutingPolicy_DefaultPolicyType_REJECT_ROUTE: #OpenconfigRoutingPolicy_DefaultPolicyType_REJECT_ROUTE
}

#OpenconfigRoutingPolicy_DefaultPolicyType_UNSET: #E_OpenconfigRoutingPolicy_DefaultPolicyType & 0

#OpenconfigRoutingPolicy_DefaultPolicyType_ACCEPT_ROUTE: #E_OpenconfigRoutingPolicy_DefaultPolicyType & 1

#OpenconfigRoutingPolicy_DefaultPolicyType_REJECT_ROUTE: #E_OpenconfigRoutingPolicy_DefaultPolicyType & 2

#enumE_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType:
	#OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_UNSET |
	#OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_ANY |
	#OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_INVERT

#values_E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType: {
	OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_UNSET:  #OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_UNSET
	OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_ANY:    #OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_ANY
	OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_INVERT: #OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_INVERT
}

#OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_UNSET: #E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType & 0

#OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_ANY: #E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType & 1

#OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType_INVERT: #E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType & 2

#enumE_OpenconfigRoutingPolicy_PolicyResultType:
	#OpenconfigRoutingPolicy_PolicyResultType_UNSET |
	#OpenconfigRoutingPolicy_PolicyResultType_ACCEPT_ROUTE |
	#OpenconfigRoutingPolicy_PolicyResultType_REJECT_ROUTE

#values_E_OpenconfigRoutingPolicy_PolicyResultType: {
	OpenconfigRoutingPolicy_PolicyResultType_UNSET:        #OpenconfigRoutingPolicy_PolicyResultType_UNSET
	OpenconfigRoutingPolicy_PolicyResultType_ACCEPT_ROUTE: #OpenconfigRoutingPolicy_PolicyResultType_ACCEPT_ROUTE
	OpenconfigRoutingPolicy_PolicyResultType_REJECT_ROUTE: #OpenconfigRoutingPolicy_PolicyResultType_REJECT_ROUTE
}

#OpenconfigRoutingPolicy_PolicyResultType_UNSET: #E_OpenconfigRoutingPolicy_PolicyResultType & 0

#OpenconfigRoutingPolicy_PolicyResultType_ACCEPT_ROUTE: #E_OpenconfigRoutingPolicy_PolicyResultType & 1

#OpenconfigRoutingPolicy_PolicyResultType_REJECT_ROUTE: #E_OpenconfigRoutingPolicy_PolicyResultType & 2

#enumE_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode:
	#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_UNSET |
	#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV4 |
	#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV6 |
	#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_MIXED

#values_E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode: {
	OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_UNSET: #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_UNSET
	OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV4:  #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV4
	OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV6:  #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV6
	OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_MIXED: #OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_MIXED
}

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_UNSET: #E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode & 0

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV4: #E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode & 1

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_IPV6: #E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode & 2

#OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode_MIXED: #E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode & 3

#enumE_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode:
	#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_UNSET |
	#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_INLINE |
	#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_REFERENCE

#values_E_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode: {
	OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_UNSET:     #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_UNSET
	OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_INLINE:    #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_INLINE
	OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_REFERENCE: #OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_REFERENCE
}

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_UNSET: #E_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode & 0

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_INLINE: #E_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode & 1

#OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode_REFERENCE: #E_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode & 2

#enumE_OpenconfigSegmentRouting_SrDataplaneType:
	#OpenconfigSegmentRouting_SrDataplaneType_UNSET |
	#OpenconfigSegmentRouting_SrDataplaneType_MPLS |
	#OpenconfigSegmentRouting_SrDataplaneType_IPV6

#values_E_OpenconfigSegmentRouting_SrDataplaneType: {
	OpenconfigSegmentRouting_SrDataplaneType_UNSET: #OpenconfigSegmentRouting_SrDataplaneType_UNSET
	OpenconfigSegmentRouting_SrDataplaneType_MPLS:  #OpenconfigSegmentRouting_SrDataplaneType_MPLS
	OpenconfigSegmentRouting_SrDataplaneType_IPV6:  #OpenconfigSegmentRouting_SrDataplaneType_IPV6
}

#OpenconfigSegmentRouting_SrDataplaneType_UNSET: #E_OpenconfigSegmentRouting_SrDataplaneType & 0

#OpenconfigSegmentRouting_SrDataplaneType_MPLS: #E_OpenconfigSegmentRouting_SrDataplaneType & 1

#OpenconfigSegmentRouting_SrDataplaneType_IPV6: #E_OpenconfigSegmentRouting_SrDataplaneType & 2

#enumE_OpenconfigTypes_ADDRESS_FAMILY:
	#OpenconfigTypes_ADDRESS_FAMILY_UNSET |
	#OpenconfigTypes_ADDRESS_FAMILY_IPV4 |
	#OpenconfigTypes_ADDRESS_FAMILY_IPV6 |
	#OpenconfigTypes_ADDRESS_FAMILY_L2_ETHERNET |
	#OpenconfigTypes_ADDRESS_FAMILY_MPLS

#values_E_OpenconfigTypes_ADDRESS_FAMILY: {
	OpenconfigTypes_ADDRESS_FAMILY_UNSET:       #OpenconfigTypes_ADDRESS_FAMILY_UNSET
	OpenconfigTypes_ADDRESS_FAMILY_IPV4:        #OpenconfigTypes_ADDRESS_FAMILY_IPV4
	OpenconfigTypes_ADDRESS_FAMILY_IPV6:        #OpenconfigTypes_ADDRESS_FAMILY_IPV6
	OpenconfigTypes_ADDRESS_FAMILY_L2_ETHERNET: #OpenconfigTypes_ADDRESS_FAMILY_L2_ETHERNET
	OpenconfigTypes_ADDRESS_FAMILY_MPLS:        #OpenconfigTypes_ADDRESS_FAMILY_MPLS
}

#OpenconfigTypes_ADDRESS_FAMILY_UNSET: #E_OpenconfigTypes_ADDRESS_FAMILY & 0

#OpenconfigTypes_ADDRESS_FAMILY_IPV4: #E_OpenconfigTypes_ADDRESS_FAMILY & 1

#OpenconfigTypes_ADDRESS_FAMILY_IPV6: #E_OpenconfigTypes_ADDRESS_FAMILY & 2

#OpenconfigTypes_ADDRESS_FAMILY_L2_ETHERNET: #E_OpenconfigTypes_ADDRESS_FAMILY & 3

#OpenconfigTypes_ADDRESS_FAMILY_MPLS: #E_OpenconfigTypes_ADDRESS_FAMILY & 4

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

#OpenconfigVlan_VlanStackAction_SWAP:                                                                                                                                                       #E_OpenconfigVlan_VlanStackAction & 3
#E_OpenconfigMpls_TeBandwidthType:                                                                                                                                                          "SPECIFIED" | "AUTO"
#E_OpenconfigNetworkInstanceTypes_ENCAPSULATION:                                                                                                                                            "VXLAN" | "MPLS"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_RouteDistinguisher:                                                                    "AUTO"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_ConstrainedPath_NamedExplicitPaths_NamedExplicitPath_Config_SidSelectionMode:                                       "ADJ_SID_ONLY" | "MIXED_MODE"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding:                                                                                               "COHERENT_SD25_BCH" | "COHERENT_SD20" | "COHERENT_SD15" | "COHERENT_HD7" | "COHERENT_G709" | "COHERENT_DEFAULT" | "COHERENT_SD25"
#E_OpenconfigMplsTypes_PROTECTION_TYPE:                                                                                                                                                     "LINK_NODE_PROTECTION_REQUESTED" | "LINK_PROTECTION_REQUIRED" | "UNPROTECTED"
#E_OpenconfigBgp_RemovePrivateAsOption:                                                                                                                                                     "PRIVATE_AS_REMOVE_ALL" | "PRIVATE_AS_REPLACE_ALL"
#E_OpenconfigIfEthernet_ETHERNET_SPEED:                                                                                                                                                     "SPEED_10MB" | "SPEED_200GB_4LANE" | "SPEED_2500MB" | "SPEED_25GB" | "SPEED_40GB" | "SPEED_5GB" | "SPEED_100GB" | "SPEED_10GB" | "SPEED_800GB" | "SPEED_100GB_2LANE" | "SPEED_200GB" | "SPEED_UNKNOWN" | "SPEED_1GB" | "SPEED_600GB" | "SPEED_400GB" | "SPEED_50GB" | "SPEED_50GB_1LANE" | "SPEED_100MB" | "SPEED_200GB_8LANE"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdSpecification:                                      "MIRRORED_UP_DOWN" | "SEPARATE_UP_DOWN"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_PolicyForwarding_Policies_Policy_Config_Type:                                                                                 "PBR_POLICY" | "VRF_SELECTION_POLICY"
#E_OpenconfigTypes_ADDRESS_FAMILY:                                                                                                                                                          "IPV4" | "IPV6" | "L2_ETHERNET" | "MPLS"
#E_OpenconfigBgp_CommunityType:                                                                                                                                                             "EXTENDED" | "BOTH" | "NONE" | "STANDARD"
#E_OpenconfigBgp_PeerType:                                                                                                                                                                  "INTERNAL" | "EXTERNAL"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode:                                                                                                                    "FULL" | "HALF"
#E_OpenconfigKeychainTypes_CRYPTO_TYPE:                                                                                                                                                     "AES_28_CMAC_96" | "CRYPTO_NONE" | "HMAC_SHA_1" | "HMAC_SHA_256" | "MD5" | "SHA_1" | "HMAC_MD5" | "HMAC_SHA_1_12" | "HMAC_SHA_1_20" | "HMAC_SHA_1_96"
#E_OpenconfigMpls_MplsSrlgFloodingType:                                                                                                                                                     "FLOODED_SRLG" | "STATIC_SRLG"
#E_OpenconfigNetworkInstanceTypes_ENDPOINT_TYPE:                                                                                                                                            "LOCAL" | "REMOTE"
#E_OpenconfigRoutingPolicy_DefaultPolicyType:                                                                                                                                               "ACCEPT_ROUTE" | "REJECT_ROUTE"
#E_OpenconfigRoutingPolicy_PolicyResultType:                                                                                                                                                "REJECT_ROUTE" | "ACCEPT_ROUTE"
#E_OpenconfigAcl_FORWARDING_ACTION:                                                                                                                                                         "ACCEPT" | "DROP" | "REJECT"
#E_OpenconfigEvpnTypes_EVPN_TYPE:                                                                                                                                                           "VLAN_AWARE" | "VLAN_BASED" | "VLAN_BUNDLE"
#E_OpenconfigRoutingPolicy_RoutingPolicy_PolicyDefinitions_PolicyDefinition_Statements_Statement_Actions_SetTag_Config_Mode:                                                                "INLINE" | "REFERENCE"
#E_AristaIntfAugments_ReflectorDirection:                                                                                                                                                   "none" | "in" | "out"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_TeInterfaceAttributes_Interface_IgpFloodingBandwidth_Config_ThresholdType:                                               "DELTA" | "THRESHOLD_CROSSED"
#E_OpenconfigVlan_VlanModeType:                                                                                                                                                             "ACCESS" | "TRUNK"
#E_AristaIntfAugments_FallbackEnum:                                                                                                                                                         "none" | "static" | "individual"
#E_OpenconfigMplsTypes_PATH_SETUP_PROTOCOL:                                                                                                                                                 "PATH_SETUP_LDP" | "PATH_SETUP_RSVP" | "PATH_SETUP_SR"
#E_OpenconfigIfEthernet_INTERFACE_FEC:                                                                                                                                                      "FEC_DISABLED" | "FEC_FC" | "FEC_RS528" | "FEC_RS544" | "FEC_RS544_2X_INTERLEAVE"
#E_OpenconfigMplsLdp_MplsLdpAfi:                                                                                                                                                            "IPV4" | "IPV6"
#E_OpenconfigNetworkInstanceTypes_LABEL_ALLOCATION_MODE:                                                                                                                                    "PER_PREFIX" | "INSTANCE_LABEL" | "PER_NEXTHOP"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Interfaces_Interface_Config_IrbAnycastGateway:                                                                                "DISTRIBUTED_SYMETRIC" | "DISTRIBUTED_ASYMETRIC" | "HYBRID" | "CENTRALIZED"
#E_OpenconfigPacketMatchTypes_ETHERTYPE:                                                                                                                                                    "ETHERTYPE_VLAN" | "ETHERTYPE_ARP" | "ETHERTYPE_IPV4" | "ETHERTYPE_IPV6" | "ETHERTYPE_LLDP" | "ETHERTYPE_MPLS" | "ETHERTYPE_ROCE"
#E_AristaIntfAugments_ReflectorMacAction:                                                                                                                                                   "swap" | "none"
#E_OpenconfigEvpn_EsiType:                                                                                                                                                                  "TYPE_2_BRIDGE_PROTOCOL_BASED" | "TYPE_3_MAC_BASED" | "TYPE_4_ROUTER_ID_BASED" | "TYPE_5_AS_BASED" | "TYPE_0_OPERATOR_CONFIGURED" | "TYPE_1_LACP_BASED"
#E_OpenconfigKeychainTypes_AUTH_TYPE:                                                                                                                                                       "KEYCHAIN" | "SIMPLE_KEY"
#E_OpenconfigLocalRouting_LOCAL_DEFINED_NEXT_HOP:                                                                                                                                           "DROP" | "LOCAL_LINK"
#E_OpenconfigMplsTypes_PSEUDOWIRE_ENCAPSULATION:                                                                                                                                            "PWE_ETHERNET_RAW_MODE" | "PWE_ETHERNET_TAGGED_MODE"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ImportRouteTarget:                                                  "AUTO"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_LowerBound:                                                         "IPV4_EXPLICIT_NULL" | "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL"
#E_OpenconfigAcl_ACL_TYPE:                                                                                                                                                                  "ACL_IPV6" | "ACL_L2" | "ACL_MIXED" | "ACL_MPLS" | "ACL_IPV4"
#E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_DestinationPort:                                                                                                   "ANY"
#E_OpenconfigBgpTypes_AFI_SAFI_TYPE:                                                                                                                                                        "IPV4_FLOWSPEC" | "VPNV4_FLOWSPEC" | "IPV4_UNICAST" | "IPV6_LABELED_UNICAST" | "L2VPN_EVPN" | "LINKSTATE" | "LINKSTATE_VPN" | "SRTE_POLICY_IPV6" | "IPV4_LABELED_UNICAST" | "IPV6_UNICAST" | "L3VPN_IPV4_UNICAST" | "LINKSTATE_SPF" | "SRTE_POLICY_IPV4" | "L2VPN_VPLS" | "L3VPN_IPV4_MULTICAST" | "L3VPN_IPV6_MULTICAST" | "L3VPN_IPV6_UNICAST"
#E_OpenconfigIfAggregate_AggregationType:                                                                                                                                                   "LACP" | "STATIC"
#E_OpenconfigIsisTypes_AFI_TYPE:                                                                                                                                                            "IPV4" | "IPV6"
#E_OpenconfigMpls_CspfTieBreaking:                                                                                                                                                          "RANDOM" | "LEAST_FILL" | "MOST_FILL"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_Config_Esi:                                                                             "AUTO"
#E_OpenconfigPacketMatchTypes_IP_PROTOCOL:                                                                                                                                                  "IP_TCP" | "IP_AUTH" | "IP_GRE" | "IP_ICMP" | "IP_L2TP" | "IP_PIM" | "IP_IGMP" | "IP_IN_IP" | "IP_RSVP" | "IP_UDP"
#E_IETFInterfaces_InterfaceType:                                                                                                                                                            "atmRadio" | "ds0" | "interleave" | "slip" | "termPad" | "vdsl2" | "docsCableScte55d1RetOob" | "isdnu" | "pdnEtherLoop1" | "proteon10Mbit" | "sonetVT" | "v37" | "ds3" | "gfp" | "ipOverAtm" | "mediaMailOverIp" | "atmLogical" | "bridge" | "g9983" | "isdns" | "mfSigLink" | "gpon" | "smdsDxi" | "virtualTg" | "voiceFXS" | "x25huntGroup" | "ciscoISLvlan" | "hdsl2" | "opticalChannelGroup" | "propBWAp2Mp" | "fddi" | "gfast" | "myrinet" | "propCnls" | "srp" | "voiceFGDOS" | "aflane8023" | "dvbRccDownstream" | "dvbRcsMacLayer" | "idsl" | "ieee1394" | "shdsl" | "wwanPP2" | "sdlc" | "cnr" | "digitalPowerline" | "docsCableDownstream" | "dvbRccMacLayer" | "hostPad" | "ipOverCdlc" | "q2931" | "v11" | "x25ple" | "pos" | "propPointToPointSerial" | "reachDSL" | "async" | "docsCableUpstream" | "imt" | "rfc877x25" | "aviciOpticalEther" | "sdci" | "voiceEBS" | "voiceOverIp" | "xboxWireless" | "mplsTunnel" | "pppMultilinkBundle" | "isdn" | "msdsl" | "primaryISDN" | "aal2" | "fibreChannel" | "h323Proxy" | "hippiInterface" | "ieee80212" | "ieee80216WMAN" | "linegroup" | "other" | "voiceEMFGD" | "coffee" | "ds0Bundle" | "pdnEtherLoop2" | "ptm" | "sipTg" | "vmwareVirtualNic" | "ethernet3Mbit" | "frameRelayInterconnect" | "ieee8023adLag" | "a12MppSwitch" | "cableDownstreamRfPort" | "capwapDot11Bss" | "sonet" | "if-gsn" | "plc" | "qam" | "aluGponOnu" | "iso88024TokenBus" | "teLink" | "aluGponPhysicalUni" | "dlsw" | "dvbTdm" | "eplrs" | "frameRelayService" | "hiperlan2" | "isup" | "lapd" | "mpls" | "bsc" | "fcipLink" | "g703at64k" | "g9982" | "sonetPath" | "e1" | "frameRelay" | "hdlc" | "aal5" | "dvbRccUpstream" | "l3ipvlan" | "mpegTransport" | "rsrb" | "docsCableUpstreamRfPort" | "localTalk" | "opticalTransport" | "sip" | "capwapWtpVirtualRadio" | "frDlciEndPt" | "hippi" | "iso88025TokenRing" | "wwanPP" | "x213" | "aluELP" | "frameRelayMPI" | "hyperchannel" | "propMultiplexor" | "v35" | "ibm370parChan" | "aflane8025" | "aluEpon" | "bits" | "docsCableScte55d2UsOob" | "dtm" | "dvbRcsTdma" | "hssi" | "opticalChannel" | "propDocsWirelessUpstream" | "propWirelessP2P" | "voiceDID" | "voiceOverCable" | "docsOfdmDownstream" | "ds1" | "escon" | "mpc" | "ppp" | "stackToStack" | "voiceEncap" | "actelisMetaLOOP" | "ces" | "ifVfiType" | "rs232" | "ethernetCsmacd" | "ipForward" | "iso88026Man" | "lmp" | "nsip" | "propDocsWirelessMaclayer" | "regular1822" | "docsCableScte55d2DsOob" | "macSecUncontrolledIF" | "voiceOverAtm" | "x25mlp" | "adsl" | "aluEponOnu" | "macSecControlledIF" | "ieee80211" | "iso88023Csmacd" | "lapb" | "radioMAC" | "sonetOverheadChannel" | "basicISDN" | "miox25" | "voiceFGDEANA" | "usb" | "x86Laps" | "fast" | "vmwareNicTeam" | "atmbond" | "channel" | "frf16MfrBundle" | "ip" | "atmFuni" | "frForward" | "l3ipxvlan" | "atmIma" | "bgppolicyaccounting" | "g703at2mb" | "transpHdlc" | "voiceFXO" | "adsl2" | "iana-interface-type" | "iso88022llc" | "otnOdu" | "proteon80Mbit" | "ss7SigLink" | "tdlc" | "arcnet" | "atmVciEndPt" | "homepna" | "qllc" | "aluEponLogicalLink" | "arap" | "nfas" | "adsl2plus" | "fastEtherFX" | "gtp" | "ipSwitch" | "lapf" | "mocaVersion1" | "aluEponPhysicalUni" | "dvbAsiIn" | "eon" | "gr303RDT" | "l2vlan" | "tr008" | "voiceOverFrameRelay" | "gigabitEthernet" | "para" | "smdsIcip" | "v36" | "atm" | "atmSubInterface" | "ds1FDL" | "iso88025Fiber" | "pon622" | "atmDxi" | "pon155" | "sixToFour" | "virtualIpAddress" | "cctEmul" | "docsCableMaclayer" | "docsCableNdr" | "docsOfdmaUpstream" | "iso88025Dtr" | "modem" | "sipSig" | "compositeLink" | "rfc1483" | "dcn" | "g9981" | "hdh1822" | "ipOverClaw" | "rpr" | "tunnel" | "capwapDot11Profile" | "cblVectaStar" | "docsCableNdf" | "docsCableUpstreamChannel" | "softwareLoopback" | "voiceEM" | "propDocsWirelessDownstream" | "starLan" | "docsCableScte55d1FwdOob" | "infiniband" | "otnOtu" | "dvbAsiOut" | "fastEther" | "mvl" | "propVirtual" | "sdsl" | "vdsl" | "ieee802154" | "ddnX25" | "h323Gatekeeper" | "ifPwType" | "propAtm" | "atmVirtual" | "digitalWrapperOverheadChannel" | "fastdsl" | "gr303IDT" | "iso88025CRFPInt" | "pip" | "arcnetPlus" | "docsCableMCmtsDownstream" | "econet" | "ilan" | "radsl" | "ultra"
#E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Transport_Config_SourcePort:                                                                                                        "ANY"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_SidId:        "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL" | "IPV4_EXPLICIT_NULL"
#E_OpenconfigRoutingPolicy_MatchSetOptionsRestrictedType:                                                                                                                                   "ANY" | "INVERT"
#E_OpenconfigKeychain_Keychains_Keychain_Config_Tolerance:                                                                                                                                  "FOREVER"
#E_OpenconfigMplsTypes_PATH_METRIC_TYPE:                                                                                                                                                    "HOP_COUNT" | "IGP_METRIC" | "PATH_DELAY" | "TE_METRIC"
#E_OpenconfigMpls_MplsHopType:                                                                                                                                                              "LOOSE" | "STRICT"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_Config_ReplicationMode:                                                                       "STATIC_INGRESS_REPLICATION" | "BGP" | "MULTICAST"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Global_ReservedLabelBlocks_ReservedLabelBlock_Config_UpperBound:                                                         "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL" | "IPV4_EXPLICIT_NULL" | "ROUTER_ALERT"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_PushLabel:                                                                       "IPV4_EXPLICIT_NULL" | "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL"
#E_OpenconfigPimTypes_PIM_MODE:                                                                                                                                                             "PIM_MODE_SPARSE" | "PIM_MODE_DENSE"
#E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode:                                                                                                          "DISABLE" | "REMOTE_ONLY" | "ALL"
#E_OpenconfigMplsTypes_RSVP_AUTH_TYPE:                                                                                                                                                      "RSVP_AUTH_MD5"
#E_OpenconfigIsisTypes_SAFI_TYPE:                                                                                                                                                           "MULTICAST" | "UNICAST"
#E_OpenconfigMplsTypes_PATH_COMPUTATION_METHOD:                                                                                                                                             "EXPLICITLY_DEFINED" | "EXTERNALLY_QUERIED" | "LOCALLY_COMPUTED"
#E_OpenconfigOspfTypes_OSPF_NETWORK_TYPE:                                                                                                                                                   "BROADCAST_NETWORK" | "NON_BROADCAST_NETWORK" | "POINT_TO_POINT_NETWORK"
#E_OpenconfigPolicyTypes_INSTALL_PROTOCOL_TYPE:                                                                                                                                             "IGMP" | "LOCAL_AGGREGATE" | "OSPF" | "OSPF3" | "PCEP" | "BGP" | "DIRECTLY_CONNECTED" | "GRIBI" | "ISIS" | "PIM" | "STATIC"
#E_AristaIntfAugments_AristaAddrType:                                                                                                                                                       "IPV6" | "PRIMARY" | "SECONDARY"
#E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_EndLabelValue:                                                                                                          "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL" | "IPV4_EXPLICIT_NULL" | "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL"
#E_OpenconfigMpls_LspControlType:                                                                                                                                                           "PCE_DELEGATED" | "PCC_CONTROLLED" | "PCC_REPORT_ONLY"
#E_OpenconfigPacketMatchTypes_TCP_FLAGS:                                                                                                                                                    "TCP_RST" | "TCP_SYN" | "TCP_URG" | "TCP_ACK" | "TCP_CWR" | "TCP_ECE" | "TCP_FIN" | "TCP_PSH"
#E_OpenconfigIsis_CircuitType:                                                                                                                                                              "POINT_TO_POINT" | "BROADCAST"
#E_OpenconfigIsis_LevelType:                                                                                                                                                                "LEVEL_1" | "LEVEL_2" | "LEVEL_1_2"
#E_OpenconfigRoutingPolicy_RoutingPolicy_DefinedSets_PrefixSets_PrefixSet_Config_Mode:                                                                                                      "IPV4" | "IPV6" | "MIXED"
#E_OpenconfigVlanTypes_TPID_TYPES:                                                                                                                                                          "TPID_0X8100" | "TPID_0X88A8" | "TPID_0X9100" | "TPID_0X9200" | "TPID_ANY"
#E_OpenconfigVlan_VlanStackAction:                                                                                                                                                          "PUSH" | "POP" | "SWAP"
#E_OpenconfigOspfTypes_MAX_METRIC_INCLUDE:                                                                                                                                                  "MAX_METRIC_INCLUDE_STUB" | "MAX_METRIC_INCLUDE_TYPE2_EXTERNAL"
#E_OpenconfigOspfTypes_MAX_METRIC_TRIGGER:                                                                                                                                                  "MAX_METRIC_ON_SYSTEM_BOOT"
#E_OpenconfigIsisTypes_OVERLOAD_RESET_TRIGGER_TYPE:                                                                                                                                         "WAIT_FOR_BGP" | "WAIT_FOR_SYSTEM"
#E_OpenconfigMplsTypes_LSP_METRIC_TYPE:                                                                                                                                                     "LSP_METRIC_ABSOLUTE" | "LSP_METRIC_INHERITED" | "LSP_METRIC_RELATIVE"
#E_OpenconfigMplsTypes_TUNNEL_TYPE:                                                                                                                                                         "P2P" | "P2MP"
#E_OpenconfigNetworkInstanceTypes_NETWORK_INSTANCE_TYPE:                                                                                                                                    "DEFAULT_INSTANCE" | "L2L3" | "L2P2P" | "L2VSI" | "L3VRF"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EvpnInstances_EvpnInstance_ImportExportPolicy_Config_ExportRouteTarget:                                                  "AUTO"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Vlans_Vlan_Config_Status:                                                                                                     "ACTIVE" | "SUSPENDED"
#E_OpenconfigAcl_Acl_AclSets_AclSet_AclEntries_AclEntry_Mpls_Config_StartLabelValue:                                                                                                        "IPV4_EXPLICIT_NULL" | "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL"
#E_OpenconfigEvpnTypes_EVPN_REDUNDANCY_MODE:                                                                                                                                                "ALL_ACTIVE" | "SINGLE_ACTIVE"
#E_OpenconfigPcep_PceModeType:                                                                                                                                                              "STATELESS" | "STATEFUL_PASSIVE" | "STATEFUL_ACTIVE"
#E_OpenconfigMplsTypes_NULL_LABEL_TYPE:                                                                                                                                                     "EXPLICIT" | "IMPLICIT"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Mpls_Lsps_StaticLsps_StaticLsp_Egress_Config_IncomingLabel:                                                                   "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR" | "NO_LABEL" | "IPV4_EXPLICIT_NULL"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_AdjacencySids_AdjacencySid_Config_SidId:  "NO_LABEL" | "IPV4_EXPLICIT_NULL" | "ROUTER_ALERT" | "IPV6_EXPLICIT_NULL" | "IMPLICIT_NULL" | "ENTROPY_LABEL_INDICATOR"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Isis_Interfaces_Interface_Levels_Level_AfiSafi_Af_SegmentRouting_PrefixSids_PrefixSid_Config_LabelOptions: "NO_PHP" | "EXPLICIT_NULL"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Protocols_Protocol_Ospfv2_Global_Config_SummaryRouteCostMode:                                                                 "RFC1583_COMPATIBLE" | "RFC2328_COMPATIBLE"
#E_OpenconfigSegmentRouting_SrDataplaneType:                                                                                                                                                "MPLS" | "IPV6"
#E_OpenconfigIsisTypes_AUTH_MODE:                                                                                                                                                           "MD5" | "TEXT"
#E_OpenconfigIsis_HelloPaddingType:                                                                                                                                                         "STRICT" | "LOOSE" | "ADAPTIVE" | "DISABLE"
#E_OpenconfigMplsTypes_TUNNEL_ADMIN_STATUS:                                                                                                                                                 "ADMIN_DOWN" | "ADMIN_UP"
#E_OpenconfigNetworkInstance_NetworkInstances_NetworkInstance_Evpn_EthernetSegments_EthernetSegment_DfElection_Config_DfElectionMethod:                                                     "DEFAULT" | "HIGHEST_RANDOM_WEIGHT" | "PREFERENCE"
#E_OpenconfigAcl_LOG_ACTION:                                                                                                                                                                "LOG_NONE" | "LOG_SYSLOG"
#E_OpenconfigIsis_MetricStyle:                                                                                                                                                              "NARROW_METRIC" | "WIDE_METRIC"
