`timescale 1ns/1ns
module tb_main();
GSR GSR(.GSRI(1'b1));

reg             sys_clk;
reg             sys_rst_n;
reg		         key_in;

reg             rgmii_eth_rxc;
wire            rgmii_eth_rxctl;
wire[3:0]       rgmii_eth_rxd;
wire            rgmii_eth_rxctl_2;
wire[3:0]       rgmii_eth_rxd_2;
wire            rgmii_eth_rxctl_4;
wire[3:0]       rgmii_eth_rxd_4;
wire            rgmii_eth_txc;
wire            rgmii_eth_txctl;
wire[3:0]       rgmii_eth_txd;

assign #2 rgmii_eth_rxd_2 = rgmii_eth_txd;
assign #2 rgmii_eth_rxctl_2 = rgmii_eth_txctl;
assign #2 rgmii_eth_rxd_4 = rgmii_eth_rxd_2;
assign #2 rgmii_eth_rxctl_4 = rgmii_eth_rxctl_2;
assign #2 rgmii_eth_rxd = rgmii_eth_rxd_4;
assign #2 rgmii_eth_rxctl = rgmii_eth_rxctl_4;
initial begin
    sys_clk = 1;
    rgmii_eth_rxc = 1;
    sys_rst_n <= 0;
    key_in <= 0;
    #400;
    #8;
    sys_rst_n <= 1;
    key_in <= 1;
    #8;
    key_in <= 0;
end

always #10 sys_clk = ~sys_clk;

always #4 rgmii_eth_rxc = ~rgmii_eth_rxc;
    

main main_init
(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    .key_in         (key_in),

    .rgmii_eth_txc  (rgmii_eth_txc),
    .rgmii_eth_txctl(rgmii_eth_txctl),
    .rgmii_eth_txd  (rgmii_eth_txd),

    .rgmii_eth_rxc  (rgmii_eth_rxc),
    .rgmii_eth_rxd  (rgmii_eth_rxd),
    .rgmii_eth_rxctl(rgmii_eth_rxctl)
);

endmodule