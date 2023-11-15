module icmp_rx
(
    input       wire            rst_n,
    
    input       wire            clk,
    input       wire            gmii_eth_rxctl,
    input       wire[7:0]       gmii_eth_rxd,

    output      reg[15:0]       identify,
    output      reg[15:0]       sequence,

    output      reg             icmp_rx_end
);

localparam  DATA_BYTE = 60;
reg[7:0]    pre_data[0:7];
reg[7:0]    head_data[0:13];
reg[7:0]    user_data[0:DATA_BYTE - 1];
reg[7:0]    crc_data[0:3];
reg[9:0]    cnt;

localparam  IDLE = 5'b00001;
localparam  PRE_SEND = 5'b00010;
localparam  HEAD_SEND = 5'b00100;
localparam  USER_SEND = 5'b01000;
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
            if (gmii_eth_rxctl == 1)
                NXT_STATE = PRE_SEND;
            else
                NXT_STATE = IDLE;
        PRE_SEND:
            if (gmii_eth_rxctl == 0)
                NXT_STATE = IDLE;
            else if (cnt == 7 && pre_data[7] == 8'hd5)
                NXT_STATE = HEAD_SEND;
            else if (cnt == 7 && pre_data[7] != 8'hd5)
                NXT_STATE = CRC_SEND;
            else
                NXT_STATE = PRE_SEND;
        HEAD_SEND:
            if (gmii_eth_rxctl == 0)
                NXT_STATE = IDLE;
            else if (cnt == 13)
                NXT_STATE = USER_SEND;
            else
                NXT_STATE = HEAD_SEND;
        USER_SEND:
            if (gmii_eth_rxctl == 0)
                NXT_STATE = IDLE;
            else if (cnt == DATA_BYTE -1)
                NXT_STATE = CRC_SEND;
            else
                NXT_STATE = USER_SEND;
        CRC_SEND:
            if (gmii_eth_rxctl == 0)
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
            USER_SEND:
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
integer i;
//data赋值
always @ (posedge clk)
    if (rst_n == 0)
        begin
            for (i = 0; i < 8; i = i + 1)pre_data[i] <= 0;
            for (i = 0; i < 14; i = i + 1)head_data[i] <= 0;
            for (i = 0; i < DATA_BYTE; i = i + 1)user_data[i] <= 0;
            for (i = 0; i < 4; i = i + 1)crc_data[i] <= 0;
        end
    else
        begin
            case (NXT_STATE)
            IDLE:
                begin
                    for (i = 0; i < 8; i = i + 1)pre_data[i] <= pre_data[i];
                    for (i = 0; i < 14; i = i + 1)head_data[i] <= head_data[i];
                    for (i = 0; i < DATA_BYTE; i = i + 1)user_data[i] <= user_data[i];
                    for (i = 0; i < 4; i = i + 1)crc_data[i] <= crc_data[i];
                end
            PRE_SEND:
                if (NXT_STATE != STATE)
                    begin
                        pre_data[0] <= gmii_eth_rxd;
                        for (i = 1; i < 8; i = i + 1)pre_data[i] <= 0;
                        for (i = 0; i < 14; i = i + 1)head_data[i] <= 0;
                        for (i = 0; i < DATA_BYTE; i = i + 1)user_data[i] <= 0;
                        for (i = 0; i < 4; i = i + 1)crc_data[i] <= 0;
                    end
                else
                    pre_data[cnt + 1] <= gmii_eth_rxd;
            HEAD_SEND:
                if (NXT_STATE != STATE)
                    head_data[0] <= gmii_eth_rxd;
                else
                    head_data[cnt + 1] <= gmii_eth_rxd;
            USER_SEND:
                if (NXT_STATE != STATE)
                    user_data[0] <= gmii_eth_rxd;
                else
                    user_data[cnt + 1] <= gmii_eth_rxd;
            CRC_SEND:
                if (NXT_STATE != STATE)
                    crc_data[0] <= gmii_eth_rxd;
                else
                    crc_data[cnt + 1] <= gmii_eth_rxd;
            default:
                begin
                    for (i = 0; i < 8; i = i + 1)pre_data[i] <= 0;
                    for (i = 0; i < 14; i = i + 1)head_data[i] <= 0;
                    for (i = 0; i < DATA_BYTE; i = i + 1)user_data[i] <= 0;
                    for (i = 0; i < 4; i = i + 1)crc_data[i] <= 0; 
                end
            endcase
        end

wire[15:0]  rx_head_id;
wire        check_head_id;
assign      rx_head_id = {head_data[12],head_data[13]};
assign      check_head_id = ({rx_head_id == 16'h0800}) ? 1 : 0;
wire        check_icmp_id;
assign      check_icmp_id = (user_data[9] == 8'h01) ? 1 : 0;
//arp_rx_end
always @ (posedge clk)
    if (rst_n == 0)
        begin
            icmp_rx_end <= 0;
            identify <= 1;
            sequence <= 1;
        end
    else
        begin
            case (NXT_STATE) 
            IDLE:
                if (STATE == CRC_SEND && check_head_id && check_icmp_id)
                    begin
                        identify <= {user_data[24],user_data[25]};
                        sequence <= {user_data[26],user_data[27]};
                        icmp_rx_end <= 1;
                    end
                else
                    icmp_rx_end <= 0;
            default:
                icmp_rx_end <= 0;
            endcase
        end
// ila_0 your_instance_name (
//     .clk(clk), // input wire clk


//     .probe0(gmii_eth_rxctl), // input wire [0:0]  probe0  
//     .probe1(gmii_eth_rxd), // input wire [7:0]  probe1 
//     .probe2(STATE), // input wire [4:0]  probe2 
//     .probe3(NXT_STATE), // input wire [4:0]  probe3 
//     .probe4(cnt), // input wire [0:0]  probe4 
//     .probe5(check_icmp_id), // input wire [0:0]  probe5 
//     .probe6(check_head_id), // input wire [0:0]  probe6 
//     .probe7(user_data[9]), // input wire [7:0]  probe7
//     .probe8(head_data[0]), // input wire [7:0]  probe8 
//     .probe9(user_data[0]) // input wire [7:0]  probe9
// );
endmodule