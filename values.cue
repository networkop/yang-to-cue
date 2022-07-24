package values

import intfs "github.com/networkop/yang-to-cue/pkg/cue:yang"

interfaces: intfs.#OpenconfigInterfaces_Interfaces

interfaces: interface: loopback0: {
	config: {
		description: "loopback interface"
		mtu:         1500
		name:        "loopback0"
	}

	subinterfaces: {
		subinterface: "0": {
			config: {
				description: "default subinterface"
				index:       0
			}
			index: 0
			ipv4: {
				addresses: {
					address: "192.0.2.1": {
						ip: "192.0.2.1"
						config: {
							"prefix-length": 24
							ip:              "192.0.2.1"
						}
					}
				}
			}
		}
	}

}
