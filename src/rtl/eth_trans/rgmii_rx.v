module rgmii_rx(
    input              rgmii_rxc   , 
    input              rgmii_rx_ctl, 
    input       [3:0]  rgmii_rxd   , 
    output             gmii_rx_clk , 
    output             gmii_rx_dv  , 
    output      [7:0]  gmii_rxd      
    );

parameter  DELAY_VALUE=50;//;0~127

//wire define
wire         rgmii_rxc_bufg;     
wire         rgmii_rxc_bufio;    
wire  [3:0]  rgmii_rxd_delay;    
wire         rgmii_rx_ctl_delay; 
wire  [1:0]  gmii_rxdv_t;        


assign gmii_rx_clk = rgmii_rxc_bufg;
assign gmii_rx_dv = gmii_rxdv_t[0] & gmii_rxdv_t[1];

BUFG BUFG_inst (
  .I            (rgmii_rxc),     // 1-bit input: Clock input
  .O            (rgmii_rxc_bufg) // 1-bit output: Clock output
);

BUFG BUFIO_inst_1 (
  .I            (rgmii_rxc),      // 1-bit input: Clock input
  .O            (rgmii_rxc_bufio) // 1-bit output: Clock output
);



IODELAY #(.C_STATIC_DLY(DELAY_VALUE))//integer,0~127
IODELAY_inst_dv1(
    .DO(rgmii_rx_ctl_delay), 
    .DF(), 
    .DI(rgmii_rx_ctl), 
    .SDTAP(0), 
    .SETN(0), 
    .VALUE(0)
);

IDDR U_IDDR_dv1
(
    .Q0(gmii_rxdv_t[0]), 
    .Q1(gmii_rxdv_t[1]), 
    .D(rgmii_rx_ctl_delay), 
    .CLK(rgmii_rxc_bufio) 
);

generate
genvar m ;
  for(m = 0; m <= 3;m = m + 1) 
  begin
      IODELAY #(.C_STATIC_DLY(DELAY_VALUE))//integer,0~127
      IODELAY_inst_dq1(
      .DO(rgmii_rxd_delay[m]), 
      .DF(), 
      .DI(rgmii_rxd[m]), 
      .SDTAP(0), 
      .SETN(0), 
      .VALUE(0)
      );
  end
endgenerate

generate
genvar i ;
  for(i = 0; i <= 3; i = i + 1) 
  begin
  IDDR	  U_IDDR_dq1
      (.Q0(gmii_rxd[i]), 
      .Q1(gmii_rxd[i+4]), 
      .D(rgmii_rxd_delay[i]), 
      .CLK(rgmii_rxc_bufio) 
      );
  end
endgenerate

endmodule