module filter_send (
    input   wire                clk,
    input   wire                rst_n,
    input   wire                href_end,
    input   wire                if_first_href,
    input   wire [7:0]          fifo_wr_data,
    input   wire                fifo_wr,
    input   wire                fifo_wr_clk,         
    input   wire [31:0]         pc_ip,
    input   wire [47:0]         pc_mac,
    input   wire [15:0]         cmos_h,
    input   wire [15:0]         cmos_v,
    input   wire [1:0]          mode,


    output  wire                gmii_eth_txc,
    output  reg                 gmii_eth_txctl,
    output  reg [7:0]           gmii_eth_txd
);
reg         eth_tx_end;
reg         fifo_rd;
wire [7:0]  fifo_rd_data;

FIFO_HS_Top inst_FIFO_HS_Top_filter(
    .Data(fifo_wr_data), //input [7:0] Data
    .WrClk(fifo_wr_clk), //input WrClk
    .RdClk(clk), //input RdClk
    .WrEn(fifo_wr), //input WrEn
    .RdEn(fifo_rd), //input RdEn
    .Q(fifo_rd_data), //output [7:0] Q
    .Empty(), //output Empty
    .Full() //output Full
);
reg[15:0]       DATA_BYTE;
reg[5:0]        nofifo_num;      
reg[11:0]       cnt;
reg             crc_en;
reg[31:0]       pre_crc;
reg             udp_tx_start;

wire[19:0]      temp_sum;
wire[19:0]      temp_1;
wire[7:0]       head_data[0:13];
wire[7:0]       user_data[0:35];
wire[47:0]      board_mac;
wire[31:0]      board_ip;
wire[15:0]      UDP_BYTE;
wire[7:0]       pre_data[0:7];
wire[31:0]      crc_out;
wire[15:0]      ip_check_sum;
wire[31:0]      true_v;

assign true_v = cmos_v * (mode[1] + 1);

localparam  IDLE = 5'b00001;
localparam  PRE_SEND = 5'b00010;
localparam  HEAD_SEND = 5'b00100;
localparam  DATA_SEND = 5'b01000;
localparam  CRC_SEND = 5'b10000;
reg[4:0]    STATE;
reg[4:0]    NXT_STATE;

always @(posedge clk) begin
    if (href_end == 1 && if_first_href == 1 && mode[0] == 0)
        nofifo_num <= 27 + 8;
    else if (href_end == 1)
        nofifo_num <= 27;
end

always @(posedge clk) begin
    if (href_end == 1 && if_first_href == 1 && mode[0] == 0)
        DATA_BYTE <= cmos_h * 2 + 28 + 8;
    else if (href_end == 1)
        DATA_BYTE <= cmos_h * 2 + 28;
end

assign  board_mac = 48'h00_11_22_33_44_55;
assign  board_ip = {8'd192,8'd168,8'd1,8'd10};

assign  UDP_BYTE = DATA_BYTE - 20;



assign {head_data[0],head_data[1],head_data[2],head_data[3],head_data[4],head_data[5]}   = pc_mac;
assign {head_data[6],head_data[7],head_data[8],head_data[9],head_data[10],head_data[11]} = board_mac;
assign {head_data[12], head_data[13]}  = 16'h0800;
assign {user_data[0],user_data[1],user_data[2],user_data[3]}     = {4'h4, 4'h5,8'h0,DATA_BYTE};
assign {user_data[4],user_data[5],user_data[6],user_data[7]}     = {16'h0, 3'h2, 13'h0};
assign {user_data[8],user_data[9],user_data[10],user_data[11]}   = {8'h80,8'd17,ip_check_sum};
assign {user_data[12],user_data[13],user_data[14],user_data[15]} = board_ip;
assign {user_data[16],user_data[17],user_data[18],user_data[19]} = pc_ip;
assign {user_data[20],user_data[21],user_data[22],user_data[23]} = {16'd1234,16'd1234};
assign {user_data[24],user_data[25],user_data[26],user_data[27]} = {UDP_BYTE, 16'h0};
assign {user_data[28],user_data[29],user_data[30],user_data[31]} = {32'hf0_5a_a5_0f};
assign {user_data[32],user_data[33]} = cmos_h;       
assign {user_data[34],user_data[35]} = true_v[15:0];


assign temp_sum = {user_data[0],user_data[1]} + {user_data[2],user_data[3]} + {user_data[4],user_data[5]} + {user_data[6],user_data[7]} + {user_data[8],user_data[9]} + {user_data[12],user_data[13]} + {user_data[14],user_data[15]} + {user_data[16],user_data[17]} + {user_data[18],user_data[19]};     
assign temp_1 = temp_sum[15:0] + temp_sum[19:16];  
assign ip_check_sum = ~temp_1[15:0];


always @(posedge clk) begin
    if (href_end == 1)
        udp_tx_start <= 1;
    else
        udp_tx_start <= 0;
end

//fifo_rd
always @ (posedge clk)
    if (rst_n == 0)
        fifo_rd <= 0;    
    else
        begin
            if (STATE == DATA_SEND && cnt == nofifo_num - 2)
                fifo_rd <= 1;
            else if (STATE == DATA_SEND && cnt == DATA_BYTE - 2)
                fifo_rd <= 0;
        end

assign  gmii_eth_txc = clk;

genvar i;
generate for (i = 0; i < 7; i = i + 1)
    begin : pre_loop
        assign pre_data[i] = 8'h55;   
    end
endgenerate
assign pre_data[7] = 8'hd5;

//FSM
always @(posedge clk) begin
    
end

always @(posedge clk)
    if (rst_n == 0)
        STATE <= IDLE;
    else
        STATE <= NXT_STATE;

always @(*)
    case(STATE)
        IDLE:
            if (udp_tx_start == 1)
                NXT_STATE = PRE_SEND;
            else
                NXT_STATE = IDLE;
        PRE_SEND:
            if (cnt == 7)
                NXT_STATE = HEAD_SEND;
            else
                NXT_STATE= PRE_SEND;
        HEAD_SEND:
            if (cnt == 13)
                NXT_STATE = DATA_SEND;
            else
                NXT_STATE = HEAD_SEND;
        DATA_SEND:
            if (cnt == DATA_BYTE - 1)
                NXT_STATE = CRC_SEND;
            else
                NXT_STATE = DATA_SEND;
        CRC_SEND:
            if (cnt == 3)
                NXT_STATE = IDLE;
            else 
                NXT_STATE = CRC_SEND;

        default: NXT_STATE = IDLE;
    endcase

always @ (posedge clk)
    if (rst_n == 0)
        cnt <= 0;  
    else
        begin
            case (NXT_STATE)
            IDLE:
                cnt <= 0;
            PRE_SEND:
                if (NXT_STATE != STATE) 
                    cnt <= 0;
                else
                    cnt <= cnt + 1;
            HEAD_SEND:
                if (NXT_STATE != STATE) 
                    cnt <= 0;
                else
                    cnt <= cnt + 1;
            DATA_SEND:
                if (NXT_STATE != STATE) 
                    cnt <= 0;
                else
                    cnt <= cnt + 1;
            CRC_SEND:
                if (NXT_STATE != STATE) 
                    cnt <= 0;
                else
                    cnt <= cnt + 1;
            default:
                cnt <= 0;
            endcase
        end

//txctl
always @ (posedge clk)
    if (rst_n == 0)
        gmii_eth_txctl <= 0;
    else
        begin
            case (NXT_STATE) 
            IDLE:
                gmii_eth_txctl <= 0;
            PRE_SEND:
                gmii_eth_txctl <= 1;
            HEAD_SEND:
                gmii_eth_txctl <= 1;
            DATA_SEND:
                gmii_eth_txctl <= 1;
            CRC_SEND:
                gmii_eth_txctl <= 1;
            default:
                gmii_eth_txctl <= 0;
            endcase
        end
//eth_tx_end
always @ (posedge clk)
    if (rst_n == 0)
        eth_tx_end <= 0;
    else
        begin
            case (NXT_STATE) 
            IDLE:
                if (STATE == CRC_SEND)
                    eth_tx_end <= 1;
                else 
                    eth_tx_end <= 0;
            default:
                eth_tx_end <= 0;
            endcase
        end
//txd
always @ (posedge clk)
    if (rst_n == 0)
        gmii_eth_txd <= 0;
    else
        begin
            case (NXT_STATE) 
                IDLE:
                    gmii_eth_txd <= 0;
                PRE_SEND:
                    if (STATE != NXT_STATE)
                        gmii_eth_txd <= pre_data[0];
                    else
                        gmii_eth_txd <= pre_data[cnt + 1];
                HEAD_SEND:
                    if (STATE != NXT_STATE)
                        gmii_eth_txd <= head_data[0];
                    else
                        gmii_eth_txd <= head_data[cnt + 1];
                DATA_SEND:
                    if (STATE != NXT_STATE)
                        gmii_eth_txd <= user_data[0];
                    else if (cnt < nofifo_num)
                        gmii_eth_txd <= user_data[cnt + 1];
                    else
                        gmii_eth_txd <= fifo_rd_data;
                CRC_SEND:
                    if (STATE != NXT_STATE)
                        gmii_eth_txd <= crc_out[7:0];
                    else if (cnt == 0)
                        gmii_eth_txd <= pre_crc[15:8];
                    else if (cnt == 1)
                        gmii_eth_txd <= pre_crc[23:16];
                    else if (cnt == 2)
                        gmii_eth_txd <= pre_crc[31:24];
                default:
                    gmii_eth_txd <= 0;        
            endcase   
        end

always @ (posedge clk)
    if (rst_n == 0)
        crc_en <= 0;
    else
        begin
            case (NXT_STATE) 
                IDLE:
                    crc_en <= 0;
                PRE_SEND:
                    crc_en <= 0;
                HEAD_SEND:
                    crc_en <= 1;
                DATA_SEND:
                    crc_en <= 1;
                CRC_SEND:
                    crc_en <= 0;
                default:
                    crc_en <= 0;
            endcase   
        end

//crc_pre
always @ (posedge clk)
    if (rst_n == 0)
        pre_crc <= 32'hffff_ffff;
    else
        begin
            if (udp_tx_start == 1)
                pre_crc <= 32'hffff_ffff;
            else if (crc_en == 1)
                pre_crc <= crc_out;  
        end
crc32 crc32_init_filter
(
    .data_in(gmii_eth_txd),
    .pre_crc(pre_crc),
    .crc_en(crc_en),
    .crc_out(crc_out)
);

endmodule