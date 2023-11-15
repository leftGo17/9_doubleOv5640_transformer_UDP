module main
(
    input       wire            sys_clk             ,
    input       wire            sys_rst_n           ,
    input		wire			key_in              ,
	input		wire [3:0]		dip					,
	
	input		wire			rgmii_eth_rxc       ,
	input		wire			rgmii_eth_rxctl     ,
	input		wire [3:0]		rgmii_eth_rxd       ,

	output		wire			rgmii_eth_txc       ,
    output		wire			rgmii_eth_txctl     ,
    output		wire [3:0]		rgmii_eth_txd       ,
	output		wire			eth_rst_n	 	    ,

    input       wire            cam1_pclk            ,  
    input       wire            cam1_vsync           ,  
    input       wire            cam1_href            ,  
    input       wire [7:0]      cam1_data            ,  

    output      wire            cam1_sda             ,  
    output      wire            cam1_rst_n           ,  
    output      wire            cam1_pwdn            ,   
    output      wire            cam1_scl             ,  

    input       wire            cam2_pclk            ,  
    input       wire            cam2_vsync           ,  
    input       wire            cam2_href            ,  
    input       wire [7:0]      cam2_data            ,  

    output      wire            cam2_sda             ,  
    output      wire            cam2_rst_n           ,  
    output      wire            cam2_pwdn            ,  
    output      wire            cam2_scl             ,  
 
    output      reg             led		 			 			 
);

// localparam      cmos_h =  16'd1280;
// localparam      cmos_v =  16'd720;
 
// localparam      cmos_h =  16'd640;
// localparam      cmos_v =  16'd480;

localparam cmos_h = 16'd854;
localparam cmos_v = 16'd480;

// localparam cmos_h = 16'd850;
// localparam cmos_v = 16'd480;
reg				cam_pclk ;
reg				cam_vsync;
reg				cam_href ;
reg [7:0]		cam_data ;

wire			cam_sda  ;
wire			cam_rst_n;
wire			cam_pwdn ;
wire			cam_scl  ;

wire[10:0]		wr_data_count;

wire            clk_50m;
wire			clk_25m;
wire            locked1;
wire			locked2;
wire            rst_n;

wire			cmos_config_end;

wire			key_flag;

wire            gmii_eth_txc;
reg             gmii_eth_txctl;
reg[7:0]        gmii_eth_txd;
wire            gmii_eth_rxc;
wire            gmii_eth_rxctl;
wire[7:0]       gmii_eth_rxd; 

wire            arp_eth_txc;
wire            arp_eth_txctl;
wire[7:0]       arp_eth_txd;
wire            icmp_eth_txc;
wire            icmp_eth_txctl;
wire[7:0]       icmp_eth_txd;
wire            udp_cmos1_eth_txc;
wire            udp_cmos1_eth_txctl;
wire[7:0]       udp_cmos1_eth_txd;
wire            udp_cmos2_eth_txc;
wire            udp_cmos2_eth_txctl;
wire[7:0]       udp_cmos2_eth_txd;
wire            udp_cmos3_eth_txc;
wire            udp_cmos3_eth_txctl;
wire[7:0]       udp_cmos3_eth_txd;
wire            udp_cmos4_eth_txc;
wire            udp_cmos4_eth_txctl;
wire[7:0]       udp_cmos4_eth_txd;

wire[31:0]		pc_ip;
wire[47:0]		pc_mac;

reg [1:0]		cam1_mode;
reg [1:0]		cam2_mode;
wire			eth_work1;
wire			eth_work2;

assign  cam_pwdn  = 1'b0;
assign  cam_rst_n = 1'b1;
assign	eth_rst_n = 1'b1;
assign  rst_n = sys_rst_n & locked1 & locked2;


assign cam2_sda   = cam_sda  ;
assign cam2_rst_n = cam_rst_n;
assign cam2_pwdn  = cam_pwdn ;
assign cam2_scl   = cam_scl  ;

assign cam1_sda   = cam_sda  ;
assign cam1_rst_n = cam_rst_n;
assign cam1_pwdn  = cam_pwdn ;
assign cam1_scl   = cam_scl  ;



Gowin_rPLL50M inst_Gowin_rPLL50M(
	.clkout(clk_50m), //output clkout
	.lock(locked1), //output lock
	.clkin(sys_clk) //input clkin
);

Gowin_rPLL25M inst_Gowin_rPLL25M(
	.clkout(clk_25m), //output clkout
	.lock(locked2), //output lock
	.clkin(sys_clk) //input clkin
);  
key_filter key_filter_inst
(
    .clk                (clk_50m),
    .rst_n              (rst_n),
    .key_in				(key_in),
    .key_flag			(key_flag)
);
always @(posedge clk_50m) begin
	if (rst_n == 0)
		led <= 0;
	else
		if (key_flag == 1)
			led <= ~led;
end

//10 发送拼接帧头 00发送不拼接帧头
//x1 不发送帧头
always @(posedge clk_50m) begin
	if (rst_n == 0)
		begin
			cam1_mode <= 2'b10;
			cam2_mode <= 2'b01; 
		end
	else
		if (dip[0] == 1 && dip[1] == 1)//cat cam1 & cam2
			begin
				cam1_mode <= 2'b10;
				cam2_mode <= 2'b01; 
			end
		else if (dip[1] == 1 && dip[0] == 0)//only cam1
			begin
				cam1_mode <= 2'b00;
				cam2_mode <= 2'b01;
			end
		else if (dip[1] == 0 && dip[0] == 1)//only cam2
			begin
				cam1_mode <= 2'b01;
				cam2_mode <= 2'b00;
			end
		else
			begin
				cam1_mode <= 2'b00;
				cam2_mode <= 2'b01; 
			end				
				
end

localparam		total_h = 16'd1896;
localparam      total_v = 16'd984; 
eth_trans eth_trans_inst
(
	.rst_n			(rst_n),
	.rgmii_eth_rxc	(rgmii_eth_rxc),
	.rgmii_eth_rxctl(rgmii_eth_rxctl),
	.rgmii_eth_rxd	(rgmii_eth_rxd),
	.gmii_eth_txc	(gmii_eth_txc),
	.gmii_eth_txctl	(gmii_eth_txctl),
	.gmii_eth_txd	(gmii_eth_txd),

	.rgmii_eth_txc	(rgmii_eth_txc),
	.rgmii_eth_txctl(rgmii_eth_txctl),
	.rgmii_eth_txd	(rgmii_eth_txd),
	.gmii_eth_rxc	(gmii_eth_rxc),
	.gmii_eth_rxctl	(gmii_eth_rxctl),
	.gmii_eth_rxd	(gmii_eth_rxd)
);
arp arp_inst
(
	.rst_n			(rst_n),
	.key_in			(0),
	.gmii_eth_rxc	(gmii_eth_rxc),
	.gmii_eth_rxctl	(gmii_eth_rxctl),
	.gmii_eth_rxd	(gmii_eth_rxd),
	.gmii_eth_txc	(arp_eth_txc),
	.gmii_eth_txctl	(arp_eth_txctl),
	.gmii_eth_txd	(arp_eth_txd),
	.pc_mac			(pc_mac),
	.pc_ip			(pc_ip)	
);
icmp icmp_inst
(
	.rst_n			(rst_n),
	.key_in			(0),
	.gmii_eth_rxc	(gmii_eth_rxc),
	.gmii_eth_rxctl	(gmii_eth_rxctl),
	.gmii_eth_rxd	(gmii_eth_rxd),
	.pc_ip			(pc_ip),
	.pc_mac			(pc_mac),
	.gmii_eth_txc	(icmp_eth_txc),
	.gmii_eth_txctl	(icmp_eth_txctl),
	.gmii_eth_txd	(icmp_eth_txd)
);
cmos_config  inst_cmos_config (
    .clk               (clk_50m),
    .rst_n             (rst_n),
    .cmos_h            (cmos_h  [12:0]),
    .cmos_v            (cmos_v  [12:0]),
	.total_h		   (total_h [12:0]),
	.total_v           (total_v [12:0]),
    .sda               (cam_sda),
    .scl               (cam_scl),
    .cmos_config_end   (cmos_config_end)        
);

cmos2eth  inst_cmos2eth_1 (
    .cam_clk           (cam1_pclk),     
    .eth_clk           (gmii_eth_rxc),     
    .rst_n             (rst_n),       
    .cam_vsync         (cam1_vsync),   
    .cam_href          (cam1_href),    
    .cam_data          (cam1_data),  
	.cmos_h   		   (cmos_h),
	.cmos_v   		   (cmos_v),
	.pc_ip   		   (pc_ip),        
	.pc_mac   		   (pc_mac),
	.mode  			   (cam1_mode),
    .gmii_eth_txc      (udp_cmos1_eth_txc),
    .gmii_eth_txctl    (udp_cmos1_eth_txctl),
    .gmii_eth_txd      (udp_cmos1_eth_txd),
	.eth_work		   (eth_work1)
);

cmos2eth  inst_cmos2eth_2 (
    .cam_clk           (cam2_pclk),     
    .eth_clk           (gmii_eth_rxc),     
    .rst_n             (rst_n),       
    .cam_vsync         (cam2_vsync),   
    .cam_href          (cam2_href),    
    .cam_data          (cam2_data),  
	.cmos_h   		   (cmos_h),
	.cmos_v   		   (cmos_v),
	.pc_ip   		   (pc_ip),        
	.pc_mac   		   (pc_mac),
	.mode  			   (cam2_mode),
    .gmii_eth_txc      (udp_cmos2_eth_txc),
    .gmii_eth_txctl    (udp_cmos2_eth_txctl),
    .gmii_eth_txd      (udp_cmos2_eth_txd),
	.eth_work		   (eth_work2)
);

cmos2transformer  inst_cmos2transformer (
    .clk               (cam1_pclk),
    .rst_n             (rst_n),
    .cam_vsync         (cam1_vsync),     
    .cam_href          (cam1_href),      
    .cam_data          (cam1_data),      
    .cmos_h            (cmos_h),        
    .cmos_v            (cmos_v),        
    .eth_clk           (gmii_eth_rxc),       
    .mode              (cam1_mode),
	.pc_ip   		   (pc_ip),        
	.pc_mac   		   (pc_mac),
    .gmii_eth_txc      (udp_cmos3_eth_txc),  
    .gmii_eth_txctl    (udp_cmos3_eth_txctl),
    .gmii_eth_txd      (udp_cmos3_eth_txd)   
);

cmos2filter inst_cmos2filter  (
    .clk               (cam1_pclk),
    .rst_n             (rst_n),
    .cam_vsync         (cam1_vsync),     
    .cam_href          (cam1_href),      
    .cam_data          (cam1_data),      
    .cmos_h            (cmos_h),        
    .cmos_v            (cmos_v),        
    .eth_clk           (gmii_eth_rxc),       
    .mode              (cam1_mode),
	.pc_ip   		   (pc_ip),        
	.pc_mac   		   (pc_mac),
    .gmii_eth_txc      (udp_cmos4_eth_txc),  
    .gmii_eth_txctl    (udp_cmos4_eth_txctl),
    .gmii_eth_txd      (udp_cmos4_eth_txd)   
);
reg		eth_work1_reg;
reg 	eth_work2_reg;
wire	eth_work1_rise;
wire	eth_work2_rise;
wire	eth_work1_drop;
wire	eth_work2_drop;

assign eth_work1_rise = (eth_work1_reg == 0 && eth_work1 == 1) ? 1 : 0;
assign eth_work1_drop = (eth_work1_reg == 1 && eth_work1 == 0) ? 1 : 0;
assign eth_work2_rise = (eth_work2_reg == 0 && eth_work2 == 1) ? 1 : 0;
assign eth_work2_drop = (eth_work2_reg == 1 && eth_work2 == 0) ? 1 : 0;

always @(posedge gmii_eth_rxc) begin
	eth_work1_reg <= eth_work1;
	eth_work2_reg <= eth_work2;	
end

localparam  S0 = 4'b0001;
localparam  S1 = 4'b0010;
localparam  S2 = 4'b0100;
localparam  S3 = 4'b1000;
reg[3:0]    STATE;
reg[3:0]    NXT_STATE;

always @(posedge gmii_eth_rxc)
	if (rst_n == 0)
		STATE <= S0;
	else
		STATE <= NXT_STATE;

always @(*)
	case(STATE)
		S0:
			if (eth_work1_rise == 1)
				NXT_STATE = S1;
			else
				NXT_STATE = S0;
		S1:
			if (eth_work1_drop == 1)
				NXT_STATE = S2;
			else
				NXT_STATE = S1;
		S2:
			if (eth_work2_rise == 1)
				NXT_STATE = S3;
			else
				NXT_STATE = S2;
		S3:
			if (eth_work2_drop == 1)
				NXT_STATE = S0;
			else
				NXT_STATE = S3;
		default: NXT_STATE = S0;
	endcase

assign gmii_eth_txc = gmii_eth_rxc;

always @(posedge gmii_eth_txc)
	if(rst_n == 0)
		begin
			gmii_eth_txctl 	<= 0;
			gmii_eth_txd 	<= 0;	
		end
	else
		if (dip[2] == 1)
			begin
				gmii_eth_txctl 	<= udp_cmos4_eth_txctl	;
				gmii_eth_txd 	<= udp_cmos4_eth_txd 	;			
			end
		else if (dip[3] == 1)
			begin
				gmii_eth_txctl 	<= udp_cmos3_eth_txctl	;
				gmii_eth_txd 	<= udp_cmos3_eth_txd 	;			
			end
		else if (dip[1] == 1 && dip[0] == 0)
			begin
				gmii_eth_txctl 	<= udp_cmos1_eth_txctl	;
				gmii_eth_txd 	<= udp_cmos1_eth_txd 	;			
			end
		else if (dip[1] == 0 && dip[0] == 1)
			begin
				gmii_eth_txctl 	<= udp_cmos2_eth_txctl	;
				gmii_eth_txd 	<= udp_cmos2_eth_txd 	;			
			end
		else if(dip[0] == 1 && STATE == S1 && dip[1] == 1)
			begin
				gmii_eth_txctl 	<= udp_cmos1_eth_txctl	;
				gmii_eth_txd 	<= udp_cmos1_eth_txd 	;			
			end
		else if(dip[0] == 1 && STATE == S3 && dip[1] == 1)
			begin
				gmii_eth_txctl 	<= udp_cmos2_eth_txctl	;
				gmii_eth_txd 	<= udp_cmos2_eth_txd 	;			
			end
		else if(arp_eth_txctl == 1)
			begin
				gmii_eth_txctl 	<= arp_eth_txctl	;
				gmii_eth_txd 	<= arp_eth_txd 	;			
			end
		else if (icmp_eth_txctl == 1)
			begin
				gmii_eth_txctl 	<= icmp_eth_txctl;
				gmii_eth_txd 	<= icmp_eth_txd 	;
			end
		else
			begin
				gmii_eth_txctl	 <= 0;
				gmii_eth_txd	 <= 0;
			end
endmodule