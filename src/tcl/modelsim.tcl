vlog D:/Acode/Gowin/4_ov5640_beta3/src/ip/fifo_hs/fifo_hs.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/ip/gowin_rpll25M/gowin_rpll25M.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/ip/gowin_rpll50M/gowin_rpll50M.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/main.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/arp/arp.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/arp/arp_rx.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/arp/arp_tx.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/cmosdata_rev/cmosdata_rev.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/cmos_config/cmos_config.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/cmos_config/config_ctrl.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/cmos_config/i2c_send.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/cmos_udp_send/cmos_udp_send.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/eth_trans/crc32.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/eth_trans/eth_trans.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/eth_trans/rgmii_rx.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/eth_trans/rgmii_tx.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/icmp/icmp.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/icmp/icmp_rx.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/icmp/icmp_tx.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/rtl/key_filter/key_filter.v
vlog D:/Acode/Gowin/4_ov5640_beta3/src/sim/tb_main.v
vsim work.tb_main -novopt -L {D:/Software/ModelsimSE 10.5/gowin/gowin} 

add ware /tb_main/* 

run 1us')