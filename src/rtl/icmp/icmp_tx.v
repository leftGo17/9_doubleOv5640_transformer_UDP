module icmp_tx
(
    input       wire            clk,
    input       wire            rst_n,

    input       wire            icmp_tx_start,
    input       wire[47:0]      pc_mac,      
    input       wire[31:0]      pc_ip,      
    input       wire[15:0]      identify,
    input       wire[15:0]      sequence,
    
    output      wire            gmii_eth_txc,
    output      reg[7:0]        gmii_eth_txd,
    output      reg             gmii_eth_txctl,   
    output      reg             eth_tx_end
);

reg[31:0]   pc_ip_reg;
reg[47:0]   pc_mac_reg;
reg[15:0]   identify_reg;
reg[15:0]   sequence_reg;
always @(posedge clk) begin
    if (icmp_tx_start == 1)
    begin
        pc_ip_reg <= pc_ip;
        pc_mac_reg <= pc_mac;
        identify_reg <= identify;
        sequence_reg <= sequence;
    end
end
localparam  DATA_BYTE = 60;
wire[47:0]      board_mac;
wire[31:0]      board_ip;
assign  board_mac = 48'h00_11_22_33_44_55;
assign  board_ip = {8'd192,8'd168,8'd1,8'd10};
assign  gmii_eth_txc = clk;

wire[7:0]   pre_data[0:7];
wire[7:0]   head_data[0:13];
wire[7:0]   user_data[0:DATA_BYTE-1];
wire[7:0]   crc_data[0:3];

reg[11:0]   cnt;

reg         crc_en;
wire[31:0]  crc_out;
reg[31:0]   pre_crc;
wire[15:0]  ip_check_sum;
wire[15:0]  icmp_check_sum;
//----------------------***----------------------
//以太网MAC组帧
//----------------------***----------------------

//前导码和起始界定
genvar i;
generate for (i = 0; i < 7; i = i + 1)
    begin : pre_loop
        assign pre_data[i] = 8'h55;   
    end
endgenerate
assign pre_data[7] = 8'hd5;
//头部
assign {head_data[0],head_data[1],head_data[2],head_data[3],head_data[4],head_data[5]} = pc_mac_reg;
assign {head_data[6],head_data[7],head_data[8],head_data[9],head_data[10],head_data[11]} = board_mac;
assign {head_data[12], head_data[13]} = 16'h0800;
//用户数据
assign {user_data[0],user_data[1],user_data[2],user_data[3]}     = {4'h4, 4'h5, 8'h00, 16'h003C};
assign {user_data[4],user_data[5],user_data[6],user_data[7]}     = {16'h0, 3'h2, 13'h0};
assign {user_data[8],user_data[9],user_data[10],user_data[11]}   = {8'h80,8'h01,ip_check_sum};
assign {user_data[12],user_data[13],user_data[14],user_data[15]} = board_ip;
assign {user_data[16],user_data[17],user_data[18],user_data[19]} = pc_ip_reg;
assign {user_data[20],user_data[21],user_data[22],user_data[23]} = {8'h00,8'h00,icmp_check_sum};
assign {user_data[24],user_data[25],user_data[26],user_data[27]} = {identify_reg,sequence_reg};

generate for (i = 28; i < DATA_BYTE; i = i + 1)
    begin : user_data_loop
        assign user_data[i] = 0; 
    end
endgenerate

wire[19:0]  temp_sum;
wire[19:0]  temp_1;


assign temp_sum = {user_data[0],user_data[1]} + {user_data[2],user_data[3]} + {user_data[4],user_data[5]} + {user_data[6],user_data[7]} + {user_data[8],user_data[9]} + {user_data[12],user_data[13]} + {user_data[14],user_data[15]} + {user_data[16],user_data[17]} + {user_data[18],user_data[19]};
assign temp_1 = temp_sum[15:0] + temp_sum[19:16];
assign ip_check_sum = ~temp_1[15:0];


wire[19:0]  icmp_sum;
wire[19:0]  icmp_1;

assign icmp_sum = {user_data[20],user_data[21]} + {user_data[24],user_data[25]} + {user_data[26],user_data[27]};
assign icmp_1 = icmp_sum[15:0] + icmp_sum[19:16];
assign icmp_check_sum = ~icmp_1[15:0];
//crc数据
assign {crc_data[3],crc_data[2],crc_data[1],crc_data[0]} = pre_crc;



localparam  IDLE = 5'b00001;
localparam  PRE_SEND = 5'b00010;
localparam  HEAD_SEND = 5'b00100;
localparam  DATA_SEND = 5'b01000;
localparam  CRC_SEND = 5'b10000;
reg[4:0]    STATE;
reg[4:0]    NXT_STATE;

always @(posedge clk)
    if (rst_n == 0)
        STATE <= IDLE;
    else
        STATE <= NXT_STATE;

always @(*)
    case(STATE)
        IDLE:
            if (icmp_tx_start == 1)
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

//cnt赋值
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

//gmii_tx_ctl赋???
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
//eth_tx_end赋值
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
                    else
                        gmii_eth_txd <= user_data[cnt + 1];
                CRC_SEND:
                    if (STATE != NXT_STATE)
                        gmii_eth_txd <= crc_out[7:0];
                    else
                        gmii_eth_txd <= crc_data[cnt + 1];
                default:
                    gmii_eth_txd <= 0;        
            endcase   
        end

//crc_en赋???
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
            if (icmp_tx_start == 1)
                pre_crc <= 32'hffff_ffff;
            else if (crc_en == 1)
                pre_crc <= crc_out;  
        end
crc32 crc32_init_icmp
(
    .data_in(gmii_eth_txd),
    .pre_crc(pre_crc),
    .crc_en(crc_en),
    .crc_out(crc_out)
);
endmodule