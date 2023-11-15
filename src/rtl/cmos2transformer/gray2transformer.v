module gray2transformer (
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

    output  reg [7:0]       transformer_data,
    output  reg             transformer_en,
    output  reg             transformer_pic_start,
    output  reg             transformer_href_end,
    output  reg             transformer_first_href
);  

//transformer define
wire [7:0]      WQ1[0:8];
wire [7:0]      WK1[0:8];
wire [7:0]      WV1[0:8];
reg [8:0]       Q1;
reg [8:0]       K1;
reg [8:0]       V1;
reg [7:0]       Z1;

wire [7:0]      WQ2[0:8];
wire [7:0]      WK2[0:8];
wire [7:0]      WV2[0:8];
reg [8:0]       Q2;
reg [8:0]       K2;
reg [8:0]       V2;
reg [7:0]       Z2;

reg [7:0]       Z;

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

reg [11:0]      abc_cnt;  
reg [10:0]      href_cnt;

reg [7:0]       gxy_gray;
reg             gxy_gray_en;
reg             gxy_gray_en_reg;


assign WQ1[0] = 1;
assign WQ1[1] = 0;
assign WQ1[2] = -1;
assign WQ1[3] = 2;
assign WQ1[4] = 0;
assign WQ1[5] = -1;
assign WQ1[6] = 1;
assign WQ1[7] = 0;
assign WQ1[8] = -1;

assign WQ2[0] = 1;
assign WQ2[1] = 0;
assign WQ2[2] = -1;
assign WQ2[3] = 2;
assign WQ2[4] = 0;
assign WQ2[5] = -1;
assign WQ2[6] = 1;
assign WQ2[7] = 0;
assign WQ2[8] = -1;

assign WK1[0] = 1;
assign WK1[1] = 2;
assign WK1[2] = 1;
assign WK1[3] = 0;
assign WK1[4] = 0;
assign WK1[5] = 0;
assign WK1[6] = -1;
assign WK1[7] = -2;
assign WK1[8] = -1;

assign WK2[0] = 1;
assign WK2[1] = 2;
assign WK2[2] = 1;
assign WK2[3] = 0;
assign WK2[4] = 0;
assign WK2[5] = 0;
assign WK2[6] = -1;
assign WK2[7] = -2;
assign WK2[8] = -1;

assign WV1[0] = 1;
assign WV1[1] = 1;
assign WV1[2] = 1;
assign WV1[3] = 1;
assign WV1[4] = 1;
assign WV1[5] = 1;
assign WV1[6] = 1;
assign WV1[7] = 1;
assign WV1[8] = 1;

assign WV2[0] = 1;
assign WV2[1] = 1;
assign WV2[2] = 1;
assign WV2[3] = 1;
assign WV2[4] = 1;
assign WV2[5] = 1;
assign WV2[6] = 1;
assign WV2[7] = 1;
assign WV2[8] = 1;

always @(posedge clk) begin
    if(pic_start == 1)
        href_cnt <= 0;
    else if (href_start == 1)
        href_cnt <= href_cnt + 1;
end

always @(posedge clk) begin
    transformer_pic_start <= pic_start;
end

always @(posedge clk) begin
    transformer_first_href = first_href;
end

always @(posedge clk) begin
    if (abc_cnt == cmos_h + 5 && abc_ctrl == 1)
        transformer_href_end <= 1;
    else
        transformer_href_end <= 0;
end

// always @(posedge clk) begin
//     transformer_href_end <= href_end;
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
        Q1 <= a1 * WQ1[0] + b1 * WQ1[1] + c1 * WQ1[2] + a2 * WQ1[3] + b2 * WQ1[4] + c2 * WQ1[5] + a3 * WQ1[6] + b3 * WQ1[7] + c3 * WQ1[8];
        K1 <= a1 * WK1[0] + b1 * WK1[1] + c1 * WK1[2] + a2 * WK1[3] + b2 * WK1[4] + c2 * WK1[5] + a3 * WK1[6] + b3 * WK1[7] + c3 * WK1[8];
        V1 <= a1 * WV1[0] + b1 * WV1[1] + c1 * WV1[2] + a2 * WV1[3] + b2 * WV1[4] + c2 * WV1[5] + a3 * WV1[6] + b3 * WV1[7] + c3 * WV1[8];
        Q2 <= a1 * WQ2[0] + b1 * WQ2[1] + c1 * WQ2[2] + a2 * WQ2[3] + b2 * WQ2[4] + c2 * WQ2[5] + a3 * WQ2[6] + b3 * WQ2[7] + c3 * WQ2[8];
        K2 <= a1 * WK2[0] + b1 * WK2[1] + c1 * WK2[2] + a2 * WK2[3] + b2 * WK2[4] + c2 * WK2[5] + a3 * WK2[6] + b3 * WK2[7] + c3 * WK2[8];
        V2 <= a1 * WV2[0] + b1 * WV2[1] + c1 * WV2[2] + a2 * WV2[3] + b2 * WV2[4] + c2 * WV2[5] + a3 * WV2[6] + b3 * WV2[7] + c3 * WV2[8];
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
                if((Q1[8] == 1'b1) && (K1[8] == 1'b1))
                    Z1 = (~Q1[7:0] + 1'b1) + (~K1[7:0] + 1'b1);
                else if((Q1[8] == 1'b1) && (K1[8] == 1'b0))
                    Z1 = (~Q1[7:0] + 1'b1) + (K1[7:0]);
                else if((Q1[8] == 1'b0) && (K1[8] == 1'b1))
                    Z1 = (Q1[7:0]) + (~K1[7:0] + 1'b1);
                else if((Q1[8] == 1'b0) && (K1[8] == 1'b0))
                    Z1 = (Q1[7:0]) + (K1[7:0]);
                if((Q2[8] == 1'b1) && (K2[8] == 1'b1))
                    Z2 = (~Q2[7:0] + 1'b1) + (~K2[7:0] + 1'b1);
                else if((Q2[8] == 1'b1) && (K2[8] == 1'b0))
                    Z2 = (~Q2[7:0] + 1'b1) + (K2[7:0]);
                else if((Q2[8] == 1'b0) && (K2[8] == 1'b1))
                    Z2 = (Q2[7:0]) + (~K2[7:0] + 1'b1);
                else if((Q2[8] == 1'b0) && (K2[8] == 1'b0))
                    Z2 = (Q2[7:0]) + (K2[7:0]);
                if (Z1 > Z2)
                    Z = Z1;
                else
                    Z = Z2;
                if (Z > 50)
                    gxy_gray = 255;
                else
                    gxy_gray = 0;
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
        transformer_en <= 0;
    else
        if (gxy_gray_en == 1 || gxy_gray_en_reg == 1)
            transformer_en <= 1;
        else
            transformer_en <= 0;
end

always @(posedge clk) begin
    if (gxy_gray_en == 1)
        transformer_data <= {gxy_gray[7:3], gxy_gray[7:5]};
    else if (gxy_gray_en_reg == 1)
        transformer_data <= {gxy_gray[4:2], gxy_gray[7:3]};
        
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