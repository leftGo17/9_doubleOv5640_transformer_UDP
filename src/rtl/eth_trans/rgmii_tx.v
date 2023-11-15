module rgmii_tx(
    //GMII发送端口
    input              gmii_tx_clk , //GMII发送时钟    
    input              gmii_tx_en  , //GMII输出数据有效信号
    input       [7:0]  gmii_txd    , //GMII输出数据        
    
    //RGMII发送端口
    output             rgmii_txc   , //RGMII发送数据时钟    
    output             rgmii_tx_ctl, //RGMII输出数据有效信号
    output      [3:0]  rgmii_txd     //RGMII输出数据     
    );

assign rgmii_txc = gmii_tx_clk; 

ODDR  ODDR_inst
(
	.Q0(rgmii_tx_ctl), 
	.Q1(),
	.D0(gmii_tx_en), 
	.D1(gmii_tx_en), 
	.TX(1),
	.CLK(gmii_tx_clk) 
); 

genvar i;


generate for (i=0; i<4; i=i+1)
    begin
        ODDR ODDR_inst
		(
			.Q0(rgmii_txd[i]), 
			.Q1(),
			.D0(gmii_txd[i]), 
			.D1(gmii_txd[4+i]), 
			.TX(1),
			.CLK(gmii_tx_clk) 
		);      
    end
endgenerate

endmodule