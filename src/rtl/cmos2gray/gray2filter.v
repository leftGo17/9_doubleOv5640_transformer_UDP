module gray2filter (
    input   wire            clk,
    input   wire            rst_n,
    input   wire            pic_start,
    input   wire            first_href,
    input   wire            second_href,
    input   wire            last_href,
    input   wire            href_start,
    input   wire            href_end,
    input   wire            gray_en,
    input   wire [7:0]      gray_data,
    input   wire [15:0]     cmos_h,

    output  reg [7:0]       filter_data,
    output  reg             filter_en,
    output  reg             filter_pic_start,
    output  reg             filter_href_end,
    output  reg             filter_first_href
);   
reg             fifo1_wr;
reg [7:0]       fifo1_wr_data;
reg             fifo1_rd;
wire [7:0]      fifo1_rd_data;

reg             fifo2_wr;
reg [7:0]       fifo2_wr_data;
reg             fifo2_rd;
wire [7:0]      fifo2_rd_data;
reg             fifo2_rd_reg;

reg             abc_ctrl;

reg [7:0]       gray_data_reg;
reg [7:0]       a1;
reg [7:0]       b1;
reg [7:0]       c1;
reg [7:0]       a2;
reg [7:0]       b2;
reg [7:0]       c2;
reg [7:0]       a3;
reg [7:0]       b3;
reg [7:0]       c3;

reg [8:0]       gx;
reg [8:0]       gy;
reg [7:0]       gxy;

reg [10:0]      sum;
reg [7:0]       gxy_gray;
reg             gxy_gray_en;
reg             gxy_gray_en_reg;

reg [11:0]      abc_cnt;  
reg [10:0]      href_cnt;

always @(posedge clk) begin
    if(pic_start == 1)
        href_cnt <= 0;
    else if (href_start == 1)
        href_cnt <= href_cnt + 1;
end

always @(posedge clk) begin
    filter_pic_start <= pic_start;
end

always @(posedge clk) begin
    filter_first_href = first_href;
end

always @(posedge clk) begin
    if (abc_cnt == cmos_h + 5 && abc_ctrl == 1)
        filter_href_end <= 1;
    else
        filter_href_end <= 0;
end

// always @(posedge clk) begin
//     filter_href_end <= href_end;
// end
always @(posedge clk) begin
    if (href_start == 1)
        abc_ctrl <= 0;
    else
        abc_ctrl <= ~abc_ctrl;
end

always @(posedge clk) begin
    if (href_start == 1)
        abc_cnt <= 0;
    else if (abc_ctrl == 1 && abc_cnt < 12'b1111_1111_1111)
        abc_cnt <= abc_cnt + 1;
end

always @(posedge clk) begin
    if (rst_n == 0)
        fifo1_rd <= 0;
    else
        if (first_href == 0 && second_href == 0 && gray_en == 1)
            fifo1_rd <= 1;
        else
            fifo1_rd <= 0;
end

always @(posedge clk) begin
    if (rst_n == 0)
        fifo2_rd <= 0;
    else
        if (first_href == 0 && second_href == 0 && gray_en == 1)
            fifo2_rd <= 1;
        else
            fifo2_rd <= 0;
end

always @(posedge clk) begin
    if (abc_ctrl == 1)
    begin
        gray_data_reg <= gray_data;
        c3 <= gray_data_reg;
        b3 <= c3;
        a3 <= b3;
        c1 <= fifo1_rd_data;
        b1 <= c1;
        a1 <= b1;
        c2 <= fifo2_rd_data;
        b2 <= c2;
        a2 <= b2;
    end
end

always @(posedge clk) begin
    if (abc_ctrl == 0 && abc_cnt >= 5 && abc_cnt <= cmos_h + 2)
        sum <= a1 + b1 + c1 + a2 + b2 + c2 + a3 + b3 + c3;
        
end

always @(posedge clk) begin
    if (abc_cnt >= 3 && abc_cnt <= cmos_h + 2 && abc_ctrl == 1)
    begin
        if (first_href == 1 || second_href == 1)
            begin
                gxy_gray <= 66;
                gxy_gray_en <= 1;
            end
        else if (abc_cnt <= 4)
            begin
                gxy_gray <= 66;
                gxy_gray_en <= 1;               
            end
        else
            begin
                gxy_gray <= (sum >> 4) + (sum >> 5) + (sum >> 6);
                gxy_gray_en <= 1;
            end
    end
    else
        gxy_gray_en <= 0;
end

always @(posedge clk) begin
    fifo2_rd_reg <= fifo2_rd;
end

always @(posedge clk) begin
    if (rst_n == 0)
        fifo1_wr <= 0;
    else
        if (last_href == 1)
            fifo1_wr <= 0;
        else if (first_href == 1 && gray_en == 1)
            begin
                fifo1_wr <= 1;
                fifo1_wr_data <= gray_data;           
            end
        else if (fifo2_rd_reg == 1)
            begin
                fifo1_wr <= 1;
                fifo1_wr_data <= fifo2_rd_data;
            end
        else
            fifo1_wr <= 0;
end

always @(posedge clk) begin
    if (rst_n == 0)
        fifo2_wr <= 0;
    else
        if (last_href == 1)
            fifo2_wr <= 0;
        else if (second_href == 1 && gray_en == 1)
            begin
                fifo2_wr <= 1;
                fifo2_wr_data <= gray_data;    
            end
        else if (first_href == 0 && gray_en == 1)
            begin
                fifo2_wr <= 1;
                fifo2_wr_data <= gray_data;
            end
        else
            fifo2_wr <= 0;
end

always @(posedge clk) begin
    gxy_gray_en_reg <= gxy_gray_en;
end

always @(posedge clk) begin
    if (rst_n == 0)
        filter_en <= 0;
    else
        if (gxy_gray_en == 1 || gxy_gray_en_reg == 1)
            filter_en <= 1;
        else
            filter_en <= 0;
end

always @(posedge clk) begin
    if (gxy_gray_en == 1)
        filter_data <= {gxy_gray[7:3], gxy_gray[7:5]};
    else if (gxy_gray_en_reg == 1)
        filter_data <= {gxy_gray[4:2], gxy_gray[7:3]};
        
end

fifo_sc_fifo1 inst_fifo_sc_fifo1(
    .Data(fifo1_wr_data), //input [7:0] Data
    .Clk(clk), //input Clk
    .WrEn(fifo1_wr), //input WrEn
    .RdEn(fifo1_rd), //input RdEn
    .Reset(pic_start), //input Reset
    .Q(fifo1_rd_data), //output [7:0] Q
    .Empty(), //output Empty
    .Full() //output Full
);

fifo_sc_fifo2 inst_fifo_sc_fifo2(
    .Data(fifo2_wr_data), //input [7:0] Data
    .Clk(clk), //input Clk
    .WrEn(fifo2_wr), //input WrEn
    .RdEn(fifo2_rd), //input RdEn
    .Reset(pic_start), //input Reset
    .Q(fifo2_rd_data), //output [7:0] Q
    .Empty(), //output Empty
    .Full() //output Full
);

// FIFO_HS_Top inst_FIFO_HS_Top_fifo1(
//     .Data(fifo1_wr_data), //input [7:0] Data
//     .WrClk(clk), //input WrClk
//     .RdClk(clk), //input RdClk
//     .WrEn(fifo1_wr), //input WrEn
//     .RdEn(fifo1_rd), //input RdEn
//     .Q(fifo1_rd_data), //output [7:0] Q
//     .Empty(), //output Empty
//     .Full() //output Full
// );

// FIFO_HS_Top inst_FIFO_HS_Top_fifo2(
//     .Data(fifo2_wr_data), //input [7:0] Data
//     .WrClk(clk), //input WrClk
//     .RdClk(clk), //input RdClk
//     .WrEn(fifo2_wr), //input WrEn
//     .RdEn(fifo2_rd), //input RdEn
//     .Q(fifo2_rd_data), //output [7:0] Q
//     .Empty(), //output Empty
//     .Full() //output Full
// );
endmodule