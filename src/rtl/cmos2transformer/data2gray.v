module init2gray (
    input   wire                clk,
    input   wire                rst_n,
    input   wire                cam_vsync,
    input   wire                cam_href,
    input   wire [7:0]          cam_data,
    input   wire [15:0]         cmos_v,

    output  reg                 gray_en,
    output  reg [7:0]           gray_data,
    output  reg                 href_start,
    output  reg                 href_end,
    output  reg                 pic_start,
    output  reg                 first_href,
    output  reg                 second_href,
    output  reg                 last_href
);
reg             cam_vsync_reg1;
reg             cam_vsync_reg2;
reg             cam_vsync_reg3;

reg             cam_href_reg1;
reg             cam_href_reg2;
reg             cam_href_reg3;

reg   [7:0]     cam_data_reg1;
reg   [7:0]     cam_data_reg2;
reg   [7:0]     cam_data_reg3;


reg             hl_ctrl;
reg [7:0]       high_byte;
reg [7:0]       r;
reg [7:0]       g;
reg [7:0]       b;
reg             rgb_en;
reg [10:0]      href_cnt;

wire            vsync_rise;
wire            href_rise;

assign vsync_rise = (cam_vsync_reg3 == 0 && cam_vsync_reg2 == 1) ? 1 : 0;
assign href_rise = (cam_href_reg3 == 0 && cam_href_reg2 == 1) ? 1 : 0;

always @(posedge clk) begin
    begin
        cam_vsync_reg1 <= cam_vsync;
        cam_vsync_reg2 <= cam_vsync_reg1;
        cam_vsync_reg3 <= cam_vsync_reg2;

        cam_href_reg1 <= cam_href;
        cam_href_reg2 <= cam_href_reg1;
        cam_href_reg3 <= cam_href_reg2;
    
        cam_data_reg1 <= cam_data;
        cam_data_reg2 <= cam_data_reg1;
        cam_data_reg3 <= cam_data_reg2;
    end
end   


always @(posedge clk) begin
    if (vsync_rise == 1)
        pic_start <= 1;
    else
        pic_start <= 0;
end

always @(posedge clk) begin
    if (pic_start == 1)
        href_cnt <= 0;
    else if (href_rise == 1)
        href_cnt <= href_cnt + 1;
end

always @(posedge clk) begin
    if (href_rise == 1)
        hl_ctrl <= 0;
    else if (cam_href_reg3 == 1)
        hl_ctrl <= ~ hl_ctrl;
end

always @(posedge clk) begin
    if (cam_href_reg3 == 1 && hl_ctrl == 0)
        high_byte <= cam_data_reg3;
end

always @(posedge clk) begin
    if (cam_href_reg3 == 1 && hl_ctrl == 1)
        rgb_en <= 1;
    else
        rgb_en <= 0;
end

always @(posedge clk) begin
    if (cam_href_reg3 == 1 && hl_ctrl == 1)
        begin
            r <= {high_byte[7:3], 3'b0};
            g <= {high_byte[2:0], cam_data_reg3[7:5], 2'b0};
            b <= {cam_data_reg3[4:0],3'b0};
        end
end

always @(posedge clk) begin
    gray_en <= rgb_en;
end

always @(posedge clk) begin
    if (rgb_en == 1)
        gray_data <= (r * 4 + g * 10 + b * 2) >> 4;
end

always @(posedge clk) begin
    if (rst_n == 0)
        href_end <= 0;
    else
        if (gray_en == 1 && cam_href_reg3 == 0)
            href_end <= 1;
        else
            href_end <= 0;
end

always @(posedge clk) begin
    if (rst_n == 0)
        first_href <= 0;
    else
        if (href_cnt == 1)
            first_href <= 1;
        else
            first_href <= 0;
end

always @(posedge clk) begin
    if (rst_n == 0)
        second_href <= 0;
    else
        if (href_cnt == 2)
            second_href <= 1;
        else
            second_href <= 0;
end

always @(posedge clk) begin
    if (rst_n == 0)
        last_href <= 0;
    else
        if (href_cnt == cmos_v)
            last_href <= 1;
        else
            last_href <= 0;
end

always @(posedge clk) begin
    if (href_rise == 1)
        href_start <= 1;
    else
        href_start <= 0;
end


endmodule