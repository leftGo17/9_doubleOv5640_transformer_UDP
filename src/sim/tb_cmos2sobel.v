`timescale 1ns/1ns

module tb_cmos2sobel();
GSR GSR(.GSRI(1'b1));
reg sys_clk;
reg sys_rst_n;
reg eth_clk;

localparam CLK_PERIOD = 20;
localparam ETH_PERIOD = 8;
initial begin
    sys_clk = 1;
    sys_rst_n <= 0;
    #CLK_PERIOD;
    sys_rst_n <= 1;
end
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;
initial begin
    eth_clk = 1;
end
always #(ETH_PERIOD/2) eth_clk = ~eth_clk;
reg     start_flag;
initial begin
    start_flag <= 0;
    #CLK_PERIOD;
    start_flag <= 1;
    #CLK_PERIOD;
    start_flag <= 0;
end
wire        clk;
wire        rst_n;
assign  clk = sys_clk;
assign  rst_n = sys_rst_n;
reg [9:0]   cnt;

always @(posedge clk) begin
    if (rst_n == 0)
        cnt <= 0;
    else
        if (start_flag == 1)
            cnt <= 0;
        else if (cnt == 600)
            cnt <= 0;
        else
            cnt <= cnt + 1;
end

wire [15:0]     cmos_h;
wire [15:0]     cmos_v;
assign cmos_h = 10;
assign cmos_v = 10;

reg             cam_href;
reg             cam_vsync;
reg [7:0]       cam_data;
always @(posedge clk) begin
    if (rst_n == 0)
        cam_vsync <= 0;
    else
        if (cnt == 1)
            cam_vsync <= 1;
        else
            cam_vsync <= 0;
end

always @(posedge clk) begin
    if (rst_n == 0)
        cam_href <= 0;
    else
        if (cnt % 50 == 0 && cnt < 550 && cnt > 0)
            cam_href <= 1;
        else if ((cnt - 20) % 50 == 0 && cnt < 550 && cnt > 0)
            cam_href <= 0;
end

always @(posedge clk) begin
    cam_data <= cnt / 50;
end

wire [1:0]  mode;
assign mode = 2'b00;

wire [31:0] pc_ip;
wire [47:0] pc_mac;

assign pc_ip = {8'd192,8'd168,8'd1,8'd10};
assign pc_mac = 48'hff_ff_ff_ff;


wire [7:0]  a;
wire [7:0]  b;
wire [7:0]  c;
wire [7:0]  d;
wire [11:0] e;

assign a = 8'h08;
assign b = 8'h60;
assign c = 8'h0c;
assign e = (a * 4 + b * 10 + c * 2);
assign d = (a * 4 + b * 10 + c * 2) >> 4;
cmos2sobel  inst_cmos2sobel (
    .clk               (sys_clk),
    .rst_n             (sys_rst_n),
    .cam_vsync         (cam_vsync),      
    .cam_href          (cam_href),       
    .cam_data          (cam_data),       
    .cmos_h            (cmos_h),
    .cmos_v            (cmos_v),
    .eth_clk           (eth_clk),
    .mode              (mode),
    .pc_ip             (pc_ip),
    .pc_mac            (pc_mac)
);

endmodule