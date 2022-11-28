package yang

#E_OpenconfigVlan_VlanStackAction:                                                            "PUSH" | "POP" | "SWAP"
#E_AristaIntfAugments_ReflectorDirection:                                                     "none" | "in" | "out"
#E_OpenconfigIfEthernet_INTERFACE_FEC:                                                        "FEC_RS544" | "FEC_RS544_2X_INTERLEAVE" | "FEC_DISABLED" | "FEC_FC" | "FEC_RS528"
#E_OpenconfigInterfaces_Interfaces_Interface_RoutedVlan_Ipv4_ProxyArp_Config_Mode:            "DISABLE" | "REMOTE_ONLY" | "ALL"
#E_OpenconfigIfAggregate_AggregationType:                                                     "LACP" | "STATIC"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_DuplexMode:                      "FULL" | "HALF"
#E_OpenconfigInterfaces_Interfaces_Interface_Ethernet_Config_FecEncoding_CoherentFecEncoding: "COHERENT_SD25_BCH" | "COHERENT_SD20" | "COHERENT_SD15" | "COHERENT_HD7" | "COHERENT_G709" | "COHERENT_DEFAULT" | "COHERENT_SD25"
#E_OpenconfigIfEthernet_ETHERNET_SPEED:                                                       "SPEED_5GB" | "SPEED_600GB" | "SPEED_UNKNOWN" | "SPEED_100GB" | "SPEED_400GB" | "SPEED_40GB" | "SPEED_100MB" | "SPEED_200GB" | "SPEED_200GB_8LANE" | "SPEED_800GB" | "SPEED_1GB" | "SPEED_50GB" | "SPEED_50GB_1LANE" | "SPEED_200GB_4LANE" | "SPEED_2500MB" | "SPEED_25GB" | "SPEED_100GB_2LANE" | "SPEED_10GB" | "SPEED_10MB"
#E_AristaIntfAugments_AristaAddrType:                                                         "PRIMARY" | "SECONDARY" | "IPV6"
#E_AristaIntfAugments_FallbackEnum:                                                           "none" | "static" | "individual"
#E_IETFInterfaces_InterfaceType:                                                              "modem" | "aluGponPhysicalUni" | "atmIma" | "docsOfdmaUpstream" | "fastEther" | "atmVciEndPt" | "capwapDot11Bss" | "sipTg" | "ipOverClaw" | "iso88025Dtr" | "lapb" | "qllc" | "docsCableScte55d2UsOob" | "docsOfdmDownstream" | "dvbRcsMacLayer" | "ipForward" | "rs232" | "sipSig" | "usb" | "v37" | "interleave" | "iso88025Fiber" | "mpc" | "reachDSL" | "softwareLoopback" | "v35" | "docsCableNdf" | "ifVfiType" | "imt" | "q2931" | "bsc" | "dvbRccDownstream" | "frameRelayService" | "hdlc" | "h323Proxy" | "l2vlan" | "bridge" | "propMultiplexor" | "voiceFGDOS" | "atmRadio" | "hdsl2" | "nfas" | "regular1822" | "mplsTunnel" | "pon622" | "otnOdu" | "rpr" | "x25huntGroup" | "l3ipvlan" | "x213" | "aluELP" | "fastEtherFX" | "voiceOverCable" | "homepna" | "mvl" | "voiceOverIp" | "ds1FDL" | "frameRelayMPI" | "g9983" | "gr303IDT" | "sonet" | "fast" | "frameRelay" | "isdnu" | "proteon10Mbit" | "mpls" | "voiceFXO" | "a12MppSwitch" | "aflane8025" | "dvbRccMacLayer" | "linegroup" | "sonetOverheadChannel" | "arcnetPlus" | "docsCableMCmtsDownstream" | "e1" | "ipSwitch" | "hdh1822" | "hippi" | "starLan" | "sixToFour" | "smdsIcip" | "x86Laps" | "ciscoISLvlan" | "dlsw" | "docsCableMaclayer" | "propDocsWirelessDownstream" | "para" | "adsl" | "atmSubInterface" | "escon" | "ieee802154" | "ddnX25" | "dvbAsiIn" | "ieee80212" | "vdsl2" | "aluGponOnu" | "basicISDN" | "cnr" | "docsCableUpstreamChannel" | "eplrs" | "frf16MfrBundle" | "gigabitEthernet" | "iso88022llc" | "ibm370parChan" | "sdlc" | "shdsl" | "voiceFXS" | "atmFuni" | "docsCableScte55d2DsOob" | "ethernet3Mbit" | "virtualTg" | "macSecUncontrolledIF" | "radioMAC" | "teLink" | "aflane8023" | "ces" | "dvbAsiOut" | "dvbRcsTdma" | "atmDxi" | "ieee80216WMAN" | "nsip" | "dvbTdm" | "iso88023Csmacd" | "voiceEMFGD" | "aluEpon" | "sonetVT" | "tdlc" | "frameRelayInterconnect" | "lmp" | "propDocsWirelessUpstream" | "adsl2" | "ds1" | "fastdsl" | "frForward" | "aluEponPhysicalUni" | "sip" | "hssi" | "iso88024TokenBus" | "propVirtual" | "rfc1483" | "virtualIpAddress" | "voiceEM" | "arap" | "ds3" | "fibreChannel" | "plc" | "pdnEtherLoop2" | "ppp" | "sdci" | "tunnel" | "capwapDot11Profile" | "cblVectaStar" | "lapf" | "macSecControlledIF" | "wwanPP2" | "pppMultilinkBundle" | "propDocsWirelessMaclayer" | "slip" | "termPad" | "aal2" | "atmVirtual" | "dtm" | "mpegTransport" | "docsCableNdr" | "docsCableScte55d1FwdOob" | "miox25" | "capwapWtpVirtualRadio" | "infiniband" | "opticalChannel" | "v36" | "gpon" | "gr303RDT" | "isdn" | "opticalChannelGroup" | "atm" | "bits" | "compositeLink" | "fcipLink" | "stackToStack" | "voiceDID" | "aluEponLogicalLink" | "g703at2mb" | "hostPad" | "ilan" | "ipOverCdlc" | "iso88025CRFPInt" | "other" | "qam" | "vmwareVirtualNic" | "xboxWireless" | "actelisMetaLOOP" | "fddi" | "ieee1394" | "primaryISDN" | "x25ple" | "docsCableDownstream" | "frDlciEndPt" | "ipOverAtm" | "mediaMailOverIp" | "pos" | "rsrb" | "pon155" | "propPointToPointSerial" | "ss7SigLink" | "transpHdlc" | "coffee" | "digitalWrapperOverheadChannel" | "iso88025TokenRing" | "localTalk" | "v11" | "voiceOverFrameRelay" | "aluEponOnu" | "hippiInterface" | "iso88026Man" | "voiceEBS" | "gtp" | "hiperlan2" | "ieee8023adLag" | "atmLogical" | "dcn" | "docsCableScte55d1RetOob" | "g9982" | "propBWAp2Mp" | "voiceEncap" | "wwanPP" | "x25mlp" | "hyperchannel" | "ifPwType" | "propCnls" | "ultra" | "adsl2plus" | "iana-interface-type" | "opticalTransport" | "vmwareNicTeam" | "idsl" | "isdns" | "lapd" | "srp" | "arcnet" | "cctEmul" | "ds0" | "ds0Bundle" | "vdsl" | "ieee80211" | "otnOtu" | "pdnEtherLoop1" | "aviciOpticalEther" | "econet" | "propAtm" | "voiceFGDEANA" | "g703at64k" | "isup" | "pip" | "ptm" | "mfSigLink" | "digitalPowerline" | "docsCableUpstreamRfPort" | "gfp" | "ip" | "radsl" | "sdsl" | "channel" | "docsCableUpstream" | "gfast" | "msdsl" | "g9981" | "l3ipxvlan" | "proteon80Mbit" | "smdsDxi" | "atmbond" | "if-gsn" | "propWirelessP2P" | "rfc877x25" | "cableDownstreamRfPort" | "h323Gatekeeper" | "tr008" | "voiceOverAtm" | "eon" | "mocaVersion1" | "myrinet" | "sonetPath" | "ethernetCsmacd" | "aal5" | "async" | "bgppolicyaccounting" | "dvbRccUpstream"
#E_AristaIntfAugments_ReflectorMacAction:                                                     "none" | "swap"
#E_OpenconfigVlanTypes_TPID_TYPES:                                                            "TPID_0X8100" | "TPID_0X88A8" | "TPID_0X9100" | "TPID_0X9200" | "TPID_ANY"
#E_OpenconfigVlan_VlanModeType:                                                               "ACCESS" | "TRUNK"
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
