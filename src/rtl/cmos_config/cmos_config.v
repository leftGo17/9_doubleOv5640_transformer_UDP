module cmos_config  (
    input       wire        clk          ,
    input       wire        rst_n           ,
    input       wire [12:0] cmos_h          ,
    input       wire [12:0] cmos_v          ,
    input       wire [12:0] total_h         ,
    input       wire [12:0] total_v         ,

    output      wire        sda             ,

    output      wire        scl             ,
    output      wire        cmos_config_end       
);



wire            i2c_dri_clk     ;   
wire            i2c_done        ;   
wire   [7:0]    i2c_data_r      ;   
wire            i2c_exec        ;   
wire   [23:0]   i2c_data        ;   
wire            i2c_rh_wl       ;   
wire            i2c_ack         ;

i2c_send #(
    .SLAVE_ADDR ( 7'h3c             ),
    .CLK_FREQ   ( 27'd50_000_000    ),
    .I2C_FREQ   ( 20'd250_000       ))
inst_i2c_send (
    .clk               (clk),
    .rst_n             (rst_n),
    .i2c_exec          (i2c_exec),
    .bit_ctrl          (1),
    .i2c_rh_wl         (i2c_rh_wl),
    .i2c_addr          (i2c_data[23:8]),
    .i2c_data_w        (i2c_data[7:0]),
    .i2c_data_r        (i2c_data_r),
    .i2c_done          (i2c_done),
    .i2c_ack           (),
    .scl               (scl),
    .sda               (sda),
    .dri_clk           (i2c_dri_clk)
);

config_ctrl  inst_config_ctrl (
   // .clk            (clk),
    .clk               (i2c_dri_clk),
    .rst_n             (rst_n),
    .start_config      (0),
    .i2c_data_r        (i2c_data_r),
    .i2c_done          (i2c_done),
    .cmos_h            (cmos_h),
    .cmos_v            (cmos_v),
    .total_h           (total_h),
    .total_v           (total_v),
    .i2c_exec          (i2c_exec),
    .i2c_data          (i2c_data),
    .i2c_rh_wl         (i2c_rh_wl),
    .init_down         (cmos_config_end)
);


endmodule