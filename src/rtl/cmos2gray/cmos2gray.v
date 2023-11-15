module cmos2filter (
    input   wire                clk,
    input   wire                rst_n,
    input   wire                cam_vsync,
    input   wire                cam_href,
    input   wire [7:0]          cam_data,
    input   wire [15:0]         cmos_h,
    input   wire [15:0]         cmos_v,
    input   wire                eth_clk,
    input   wire [1:0]          mode,
    input   wire [31:0]         pc_ip,
    input   wire [47:0]         pc_mac,

    output  wire                gmii_eth_txc,
    output  wire                gmii_eth_txctl,
    output  wire [7:0]          gmii_eth_txd   

);

wire [7:0]          filter_data;
wire                filter_en;
wire                filter_pic_start;
wire                filter_href_end;
wire                filter_first_href;

wire                gray_en;
wire [7:0]          gray_data;
wire                href_start;
wire                href_end;
wire                pic_start;
wire                first_href;
wire                second_href;
wire                last_href;

init2gray  inst_init2gray (
    .clk               (clk),        
    .rst_n             (rst_n),      
    .cam_vsync         (cam_vsync),  
    .cam_href          (cam_href),   
    .cam_data          (cam_data),   
    .cmos_v            (cmos_v), 

    .gray_en           (gray_en),    
    .gray_data         (gray_data),  
    .href_start        (href_start), 
    .href_end          (href_end),   
    .pic_start         (pic_start),  
    .first_href        (first_href), 
    .second_href       (second_href),
    .last_href         (last_href)   
);

gray2filter  inst_gray2filter (
    .clk               (clk),
    .rst_n             (rst_n),
    .pic_start         (pic_start),      
    .first_href        (first_href),     
    .second_href       (second_href),    
    .last_href         (last_href),      
    .href_start        (href_start),     
    .href_end          (href_end),       
    .gray_en           (gray_en),        
    .gray_data         (gray_data),      
    .cmos_h            (cmos_h),
    
    .filter_data        (filter_data),     
    .filter_en          (filter_en),       
    .filter_pic_start   (filter_pic_start),
    .filter_href_end    (filter_href_end), 
    .filter_first_href  (filter_first_href)
);

filter_send  inst_filter_send (
    .clk               (eth_clk),
    .rst_n             (rst_n),
    .href_end          (filter_href_end),
    .if_first_href     (filter_first_href),
    .fifo_wr_data      (filter_data),
    .fifo_wr           (filter_en),
    .fifo_wr_clk       (clk),
    .pc_ip             (pc_ip),
    .pc_mac            (pc_mac),
    .cmos_h            (cmos_h),
    .cmos_v            (cmos_v),
    .mode              (mode),
    .gmii_eth_txc      (gmii_eth_txc),
    .gmii_eth_txctl    (gmii_eth_txctl),
    .gmii_eth_txd      (gmii_eth_txd)
);
endmodule