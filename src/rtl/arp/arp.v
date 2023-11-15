module arp
(
    input       wire            rst_n,
    input       wire            key_in,
    
    input       wire            gmii_eth_rxc,
    input       wire            gmii_eth_rxctl,
    input       wire[7:0]       gmii_eth_rxd,

    output      wire            gmii_eth_txc,
    output      wire            gmii_eth_txctl,
    output      wire[7:0]       gmii_eth_txd,

    output      reg[47:0]       pc_mac,
    output      reg[31:0]       pc_ip 
);


wire[31:0]  board_ip;
wire[47:0]  board_mac;
assign board_ip = {8'd192,8'd168,8'd1,8'd10};
assign board_mac = {8'h00,8'h11,8'h22,8'h33,8'h44,8'h55};

wire[31:0]  rx_pc_ip;
wire[47:0]  rx_pc_mac;
wire[15:0]  rx_arp_op;
wire        arp_rx_end;
arp_rx arp_rx_inst
(
    .rst_n          (rst_n),
    .clk            (gmii_eth_rxc),
    .gmii_eth_rxctl (gmii_eth_rxctl),
    .gmii_eth_rxd   (gmii_eth_rxd),
    .pc_ip          (rx_pc_ip),
    .pc_mac         (rx_pc_mac),
    .arp_op         (rx_arp_op),
    .arp_rx_end     (arp_rx_end)
);

reg[15:0]   tx_arp_op;
reg         arp_tx_start;
wire        arp_tx_end;
arp_tx arp_tx_inst
(
    .clk            (gmii_eth_rxc),
    .rst_n          (rst_n),
    .arp_tx_start   (arp_tx_start),

    .pc_mac         (pc_mac),
    .pc_ip          (pc_ip),
    .arp_op         (tx_arp_op),

    .gmii_eth_txc   (gmii_eth_txc),
    .gmii_eth_txd   (gmii_eth_txd),
    .gmii_eth_txctl (gmii_eth_txctl),
    
    .eth_tx_end     (arp_tx_end)
);

reg[9:0]    cnt;

//
always @ (posedge gmii_eth_rxc)
    if (rst_n == 0)
        begin
            pc_mac <= 48'hff_ff_ff_ff_ff_ff;  
            pc_ip  <= {8'd192,8'd168,8'd1,8'd102};       
        end       
    else
        begin
            if (arp_rx_end == 1)
                begin
                    pc_mac <= rx_pc_mac;
                    pc_ip  <= rx_pc_ip;      
                end  
        end

//
always @ (posedge gmii_eth_rxc)
    if (rst_n == 0)
        cnt <= 14;
    else
        begin
            if (arp_rx_end == 1 && rx_arp_op == 1)
                cnt <= 0;
            else if (cnt == 14)
                cnt <= 14;
            else
                cnt <= cnt + 1;
        end

//
always @ (posedge gmii_eth_rxc)
    if (rst_n == 0)
        begin
            tx_arp_op <= 1;
            arp_tx_start <= 0;       
        end   
    else
        begin
            if (key_in == 1)
                begin
                    arp_tx_start <= 1;
                    tx_arp_op <= 1;
                end
            else if (cnt == 13)
                begin
                    arp_tx_start <= 1;
                    tx_arp_op <= 2;
                end
            else
                arp_tx_start <= 0;
        end


endmodule