package yang

#E_OpenconfigIfEthernet_ETHERNET_SPEED:                                                       "SPEED_100GB" | "SPEED_100MB" | "SPEED_200GB_8LANE" | "SPEED_2500MB" | "SPEED_25GB" | "SPEED_600GB" | "SPEED_10GB" | "SPEED_1GB" | "SPEED_200GB" | "SPEED_10MB" | "SPEED_200GB_4LANE" | "SPEED_40GB" | "SPEED_50GB_1LANE" | "SPEED_5GB" | "SPEED_800GB" | "SPEED_100GB_2LANE" | "SPEED_400GB" | "SPEED_50GB" | "SPEED_UNKNOWN"
#E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode:            "DISABLE" | "REMOTE_ONLY" | "ALL"
#E_OpenconfigVlan_VlanModeType:                                                               "ACCESS" | "TRUNK"
#E_OpenconfigVlan_VlanStackAction:                                                            "PUSH" | "POP" | "SWAP"
#E_AristaIntfAugments_ReflectorDirection:                                                     "none" | "in" | "out"
#E_IETFInterfaces_InterfaceType:                                                              "aviciOpticalEther" | "docsCableUpstreamChannel" | "escon" | "imt" | "bsc" | "docsCableScte55d1RetOob" | "mocaVersion1" | "pos" | "propPointToPointSerial" | "rs232" | "isup" | "voiceEM" | "aal2" | "adsl2" | "h323Proxy" | "msdsl" | "sonetVT" | "v35" | "x25ple" | "aflane8023" | "aluEponLogicalLink" | "capwapWtpVirtualRadio" | "cnr" | "dvbRccUpstream" | "g9981" | "cblVectaStar" | "homepna" | "ieee802154" | "tr008" | "coffee" | "eplrs" | "iana-interface-type" | "if-gsn" | "mfSigLink" | "voiceEMFGD" | "ieee8023adLag" | "primaryISDN" | "rpr" | "teLink" | "ds3" | "g703at64k" | "isdns" | "pdnEtherLoop1" | "ppp" | "softwareLoopback" | "gigabitEthernet" | "sonetPath" | "iso88026Man" | "mpc" | "bits" | "dcn" | "hippiInterface" | "idsl" | "isdn" | "iso88022llc" | "para" | "srp" | "adsl" | "mvl" | "tdlc" | "bridge" | "frf16MfrBundle" | "otnOtu" | "g9983" | "hyperchannel" | "ipOverAtm" | "pon622" | "slip" | "docsCableDownstream" | "dvbAsiOut" | "ibm370parChan" | "frameRelayService" | "gtp" | "isdnu" | "lapd" | "macSecUncontrolledIF" | "rfc877x25" | "dtm" | "econet" | "frDlciEndPt" | "ipForward" | "fast" | "hdsl2" | "vdsl2" | "docsCableScte55d2DsOob" | "iso88025Fiber" | "iso88025TokenRing" | "modem" | "docsCableScte55d1FwdOob" | "fibreChannel" | "g9982" | "ieee80216WMAN" | "proteon80Mbit" | "wwanPP2" | "ds0" | "pdnEtherLoop2" | "regular1822" | "v11" | "voiceOverCable" | "a12MppSwitch" | "docsCableScte55d2UsOob" | "frameRelay" | "transpHdlc" | "docsCableMaclayer" | "propBWAp2Mp" | "docsCableNdf" | "nsip" | "aal5" | "eon" | "ciscoISLvlan" | "nfas" | "pon155" | "compositeLink" | "sip" | "v36" | "propMultiplexor" | "sonetOverheadChannel" | "x213" | "voiceOverAtm" | "ddnX25" | "frameRelayMPI" | "g703at2mb" | "iso88025CRFPInt" | "propAtm" | "ultra" | "smdsDxi" | "x86Laps" | "aluEpon" | "atmbond" | "e1" | "frameRelayInterconnect" | "myrinet" | "otnOdu" | "xboxWireless" | "aluGponPhysicalUni" | "dlsw" | "hssi" | "sdsl" | "virtualTg" | "wwanPP" | "voiceEBS" | "voiceOverFrameRelay" | "atmDxi" | "capwapDot11Bss" | "frForward" | "opticalChannelGroup" | "radsl" | "vmwareNicTeam" | "aluEponOnu" | "ieee80211" | "l3ipvlan" | "miox25" | "docsCableUpstreamRfPort" | "mpegTransport" | "mpls" | "pip" | "sipSig" | "vmwareVirtualNic" | "voiceDID" | "aflane8025" | "docsOfdmDownstream" | "pppMultilinkBundle" | "qllc" | "voiceEncap" | "voiceFGDEANA" | "atmFuni" | "ethernet3Mbit" | "ilan" | "ip" | "sonet" | "channel" | "hiperlan2" | "radioMAC" | "hippi" | "virtualIpAddress" | "adsl2plus" | "ds1" | "dvbRccMacLayer" | "ipOverClaw" | "plc" | "stackToStack" | "docsCableNdr" | "fcipLink" | "q2931" | "propWirelessP2P" | "voiceOverIp" | "aluGponOnu" | "fastdsl" | "l2vlan" | "mediaMailOverIp" | "other" | "propCnls" | "aluEponPhysicalUni" | "atmIma" | "cctEmul" | "ds0Bundle" | "fastEtherFX" | "atmSubInterface" | "bgppolicyaccounting" | "dvbRcsTdma" | "gr303RDT" | "ipOverCdlc" | "docsCableMCmtsDownstream" | "hostPad" | "ds1FDL" | "dvbRccDownstream" | "x25huntGroup" | "aluELP" | "hdlc" | "propVirtual" | "qam" | "smdsIcip" | "voiceFGDOS" | "ieee80212" | "propDocsWirelessDownstream" | "sixToFour" | "voiceFXS" | "atm" | "gpon" | "ipSwitch" | "iso88023Csmacd" | "lapf" | "sdci" | "digitalPowerline" | "h323Gatekeeper" | "mplsTunnel" | "rfc1483" | "shdsl" | "usb" | "l3ipxvlan" | "actelisMetaLOOP" | "arap" | "async" | "atmRadio" | "docsOfdmaUpstream" | "fddi" | "atmVirtual" | "dvbRcsMacLayer" | "localTalk" | "ieee1394" | "proteon10Mbit" | "sdlc" | "ss7SigLink" | "interleave" | "reachDSL" | "basicISDN" | "cableDownstreamRfPort" | "ces" | "lmp" | "starLan" | "v37" | "gfast" | "lapb" | "linegroup" | "dvbAsiIn" | "dvbTdm" | "ifVfiType" | "rsrb" | "voiceFXO" | "arcnet" | "ethernetCsmacd" | "opticalTransport" | "termPad" | "iso88025Dtr" | "macSecControlledIF" | "capwapDot11Profile" | "fastEther" | "ifPwType" | "x25mlp" | "vdsl" | "arcnetPlus" | "docsCableUpstream" | "gfp" | "infiniband" | "opticalChannel" | "ptm" | "atmLogical" | "atmVciEndPt" | "propDocsWirelessMaclayer" | "propDocsWirelessUpstream" | "sipTg" | "digitalWrapperOverheadChannel" | "gr303IDT" | "hdh1822" | "iso88024TokenBus" | "tunnel"
#E_AristaIntfAugments_ReflectorMacAction:                                                     "none" | "swap"
#E_OpenconfigIfAggregate_AggregationType:                                                     "STATIC" | "LACP"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode:                      "FULL" | "HALF"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding: "COHERENT_SD15" | "COHERENT_HD7" | "COHERENT_G709" | "COHERENT_DEFAULT" | "COHERENT_SD25" | "COHERENT_SD25_BCH" | "COHERENT_SD20"
#E_OpenconfigVlanTypes_TPID_TYPES:                                                            "TPID_0X88A8" | "TPID_0X9100" | "TPID_0X9200" | "TPID_ANY" | "TPID_0X8100"
#E_AristaIntfAugments_AristaAddrType:                                                         "IPV6" | "PRIMARY" | "SECONDARY"
#E_OpenconfigIfEthernet_INTERFACE_FEC:                                                        "FEC_RS528" | "FEC_RS544" | "FEC_RS544_2X_INTERLEAVE" | "FEC_DISABLED" | "FEC_FC"
#E_AristaIntfAugments_FallbackEnum:                                                           "none" | "static" | "individual"
