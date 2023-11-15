module cmos_data_rev (
    input       wire            clk     ,
    input       wire            rst_n   ,
    input       wire            cam_vsync,
    input       wire            cam_href,
    input       wire [7:0]      cam_data,
    input       wire [15:0]     cmos_v,

    output      reg             pic_start,
    output      reg             fifo_wr,
    output      reg  [7:0]      fifo_wr_data,
    output      reg             fifo_clr,
    output      reg             href_end,
    output      reg             if_first_href,
    output      reg             if_last_href
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

reg   [5:0]     clr_cnt;
reg             href_start;
reg   [10:0]    href_cnt;       

//register delay
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
//fifo ctrl
always @(posedge clk) begin
    if (rst_n == 0)
        begin
            fifo_wr <= 0;
        end
    else
        begin
            fifo_wr <= cam_href_reg2;
            fifo_wr_data <= cam_data_reg2;
        end
end


//respent a new picture start
always @(posedge clk) begin
    if (rst_n == 0)
        pic_start <= 0;
    else
        if (cam_vsync_reg3 == 0 && cam_vsync_reg2 == 1)
            pic_start <= 1;
        else
            pic_start <= 0;
end
//rst fifo
always @(posedge clk) begin
    if (pic_start == 1)
        clr_cnt <= 0;
    else if (clr_cnt <= 20)
        clr_cnt <= clr_cnt + 1;
end
always @(posedge clk) begin
    if (clr_cnt == 1)
        fifo_clr <= 1;
    else if (clr_cnt == 18)
        fifo_clr <= 0;
end
//href_start & href_end
always @(posedge clk) begin
    if (rst_n == 0 )
        href_start <= 0;
    else
        if (cam_href_reg3 == 0 && cam_href_reg2 == 1)
            href_start <= 1;
        else
            href_start <= 0;
end
always @(posedge clk) begin
    if (rst_n == 0 )
        href_end <= 0;
    else
        if (cam_href_reg3 == 1 && cam_href_reg2 == 0)
            href_end <= 1;
        else
            href_end <= 0;
end
//href_cnt
always @(posedge clk) begin
    if (pic_start == 1)
        href_cnt <= 0;
    else if (href_start == 1)
        href_cnt <= href_cnt + 1;
end
//if first href
always @(posedge clk) begin
    if (href_cnt == 1)
        if_first_href <= 1;
    else
        if_first_href <= 0;
end

always @(posedge clk) begin
    if (href_cnt == cmos_v)
        if_last_href <= 1;
    else
        if_last_href <= 0;
end
endmodule