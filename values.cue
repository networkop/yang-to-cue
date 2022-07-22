package values

import intfs "github.com/networkop/yang-to-cue/pkg:yang"


interfaces: intfs.#OpenconfigInterfaces_Interfaces

interfaces: Interface: loopback0: {
	Config: {
		Description: "loopback interface"
		Mtu:         1500
		Name:        "loopback0"
	}

	Subinterfaces: {
		Subinterface: "0": {
			Config: {
				Description: "default subinterface"
				Index:       0
			}
            Index: 0
			Ipv4: {
				Addresses: {
					Address: "192.0.2.1": {
						Ip: "192.0.2.1"
						Config: {
							PrefixLength: 24
							Ip:           "192.0.2.1"
						}
					}
				}
			}
		}
	}

}
