package main

import intfs "yang.to.cue/pkg:yang"

config: intfs.#Device & {
	interfaces: interface: [{
		config: {
			description: "loopback interface"
			mtu:         1500
			name:        "Loopback0"
		}
		name: "Loopback0"
		subinterfaces: {
			subinterface: [{
				config: {
					description: "default subinterface"
					index:       0
				}
				index: 0
				ipv4: {
					addresses: {
						address: [{
							ip: "192.0.2.1"
							config: {
								"addr-type":     "PRIMARY"
								"prefix-length": 24
								ip:              "192.0.2.1"
							}
						}]
					}
				}
			}]
		}
	}]
	"network-instances": "network-instance": [{
		config: name: "default"
		name: "default"
		protocols: protocol: [{
			bgp: {
				global: config: as: 65000
				neighbors: neighbor: [{
					"afi-safis": "afi-safi": [{
						"afi-safi-name": "IPV4_UNICAST"
						config: "afi-safi-name": "IPV4_UNICAST"
					}]
					config: {
						"neighbor-address": "169.254.0.1"
						"peer-as":          65001
					}
					"neighbor-address": "169.254.0.1"
				}]
			}
			config: {
				identifier: "BGP"
				name:       "BGP"
			}
			identifier: "BGP"
			name:       "BGP"
		}]
	}]
}
