module cmos2eth (
    input       wire            cam_clk ,
    input       wire            eth_clk ,
    input       wire            rst_n   ,
    input       wire            cam_vsync,
    input       wire            cam_href,
    input       wire [7:0]      cam_data,
    input       wire [15:0]     cmos_h,
    input       wire [15:0]     cmos_v,
    input       wire [31:0]     pc_ip,
    input       wire [47:0]     pc_mac,
    input       wire [1:0]      mode,

    output      wire            gmii_eth_txc,
    output      wire            gmii_eth_txctl,
    output      wire [7:0]      gmii_eth_txd,
    output      wire            eth_work   
);

wire			pic_start;
wire			fifo_wr;
wire [7:0]		fifo_wr_data;
wire			fifo_clr;
wire			if_first_href;
wire            if_last_href;
wire            href_end;

cmos_data_rev  inst_cmos_data_rev (     
    .clk               (cam_clk),
    .rst_n             (rst_n),       
    .cam_vsync         (cam_vsync),   
    .cam_href          (cam_href),    
    .cam_data          (cam_data),   
    .cmos_v            (cmos_v),
    .pic_start         (pic_start),   
    .fifo_wr           (fifo_wr),     
    .fifo_wr_data      (fifo_wr_data),
    .fifo_clr          (fifo_clr),    
    .href_end          (href_end),    
    .if_first_href     (if_first_href),
    .if_last_href      (if_last_href)
);

cmos_udp_send  inst_cmos_udp_send (
    .clk               (eth_clk),
    .rst_n             (rst_n),
    .href_end          (href_end),
    .if_first_href     (if_first_href),
    .if_last_href      (if_last_href),

	.fifo_wr_data	   (fifo_wr_data),
	.fifo_wr_clk	   (cam_clk),
	.fifo_wr           (fifo_wr),
	.fifo_clr          (fifo_clr),
    .pc_ip             (pc_ip),
    .pc_mac            (pc_mac),
    .cmos_h            (cmos_h),
    .cmos_v            (cmos_v),
    .mode              (mode),

    .gmii_eth_txc      (gmii_eth_txc),
    .gmii_eth_txctl    (gmii_eth_txctl),
    .gmii_eth_txd      (gmii_eth_txd),
    .eth_work          (eth_work)
);

endmodule