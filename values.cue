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
}
