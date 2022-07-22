0. Clone YANG modules

```
git clone --depth=1 https://github.com/YangModels/yang.git
git clone https://github.com/openconfig/public openconfig
```

1.  Generate types with ygot

Compress Paths needs to be set to false!

```
go run github.com/openconfig/ygot/generator \
-path=openconfig \
-generate_fakeroot \
-fakeroot_name=device \
-output_file=pkg/yang.go \
-compress_paths=false \
-exclude_modules=ietf-interfaces \
-package_name=yang \
-exclude_state \
openconfig/release/models/interfaces/openconfig-if-ip.yang
```

Optionally cleanup YANG models to speed up CUE cli commands with `./...`

```
rm -rf yang && rm -rf openconfig
```

2. Init CUE mod

```
cue mod init yang.cue
```

3. Import Go types into CUE


```
cue get go github.com/networkop/yang-to-cue/pkg/...
```

4. Write some CUE to model data

```
cat values.cue
```

5. Evaluate CUE values

```
cue eval ./... --out=json
```

```json
{
    "Interface": {
        "loopback0": {
            "Config": {
                "Description": "loopback interface",
                "Mtu": 1500,
                "Name": "loopback0"
            },
            "Subinterfaces": {
                "Subinterface": {
                    "0": {
                        "Config": {
                            "Description": "default subinterface",
                            "Index": 0
                        },
                        "Index": 0,
                        "Ipv4": {
                            "Addresses": {
                                "Address": {
                                    "192.0.2.1": {
                                        "Ip": "192.0.2.1",
                                        "Config": {
                                            "PrefixLength": 24,
                                            "Ip": "192.0.2.1"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
```

6. Compare this to the json produced by ygot:

```
go run main.go
```

```json
{
  "interface": [
    {
      "config": {
        "description": "loopback interface",
        "mtu": 1500
      },
      "name": "loopback0",
      "subinterfaces": {
        "subinterface": [
          {
            "config": {
              "description": "default subinterface"
            },
            "index": 0,
            "ipv4": {
              "addresses": {
                "address": [
                  {
                    "config": {
                      "prefix-length": 24
                    },
                    "ip": "192.0.2.1"
                  }
                ]
              }
            }
          }
        ]
      }
    }
  ]
}
```

What I had to modify in the auto-generated CUE file:


```diff
+#OpenconfigInterfaces_Interfaces_Interface_Subinterfaces: {
+	Subinterface: {[string]: null | #OpenconfigInterfaces_Interfaces_Interface} @go(,map[string]*OpenconfigInterfaces_Interfaces_Interface)
+}

// OpenconfigInterfaces_Interfaces_Interface represents the /openconfig-interfaces/interfaces/interface YANG schema element.
#OpenconfigInterfaces_Interfaces_Interface: {
	Aggregation?: null | #OpenconfigInterfaces_Interfaces_Interface_Aggregation @go(,*OpenconfigInterfaces_Interfaces_Interface_Aggregation)
	Config?:      null | #OpenconfigInterfaces_Interfaces_Interface_Config      @go(,*OpenconfigInterfaces_Interfaces_Interface_Config)
	Ethernet?:    null | #OpenconfigInterfaces_Interfaces_Interface_Ethernet    @go(,*OpenconfigInterfaces_Interfaces_Interface_Ethernet)
	HoldTime?:    null | #OpenconfigInterfaces_Interfaces_Interface_HoldTime    @go(,*OpenconfigInterfaces_Interfaces_Interface_HoldTime)
	Name?:        null | string                                                 @go(,*string)
	RoutedVlan?:  null | #OpenconfigInterfaces_Interfaces_Interface_RoutedVlan  @go(,*OpenconfigInterfaces_Interfaces_Interface_RoutedVlan)
+	Subinterfaces?: null | #OpenconfigInterfaces_Interfaces_Interface_Subinterfaces
}
```

```diff
// OpenconfigInterfaces_Interfaces_Interface_Config represents the /openconfig-interfaces/interfaces/interface/config YANG schema element.
#OpenconfigInterfaces_Interfaces_Interface_Config: {
	Description?:  null | string @go(,*string)
	Enabled?:      null | bool   @go(,*bool)
	LoopbackMode?: null | bool   @go(,*bool)
	Mtu?:          null | uint16 @go(,*uint16)
	Name?:         null | string @go(,*string)
-	Tpid:          #E_OpenconfigVlanTypes_TPID_TYPES
+   Tpid?:          #E_OpenconfigVlanTypes_TPID_TYPES
-	Type:          #E_IETFInterfaces_InterfaceType
+	Type?:          #E_IETFInterfaces_InterfaceType
}
```