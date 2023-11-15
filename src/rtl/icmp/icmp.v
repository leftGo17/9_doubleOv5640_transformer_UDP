module icmp
(
    input       wire            rst_n,
    input       wire            key_in,
    
    input       wire            gmii_eth_rxc,
    input       wire            gmii_eth_rxctl,
    input       wire[7:0]       gmii_eth_rxd,
    input       wire[31:0]      pc_ip,
    input       wire[47:0]      pc_mac,

    output      wire            gmii_eth_txc,
    output      wire            gmii_eth_txctl,
    output      wire[7:0]       gmii_eth_txd
);

wire        clk;
assign  clk = gmii_eth_rxc;
wire[15:0]  sequence;
wire[15:0]  identify;
wire        icmp_rx_end;

reg[31:0]   pc_ip_reg;
reg[47:0]   pc_mac_reg;
always @(posedge clk) begin
    pc_ip_reg <= pc_ip;
    pc_mac_reg <= pc_mac;
end
icmp_rx icmp_rx_inst
(
    .rst_n          (rst_n),
    .clk            (gmii_eth_rxc),
    .gmii_eth_rxctl (gmii_eth_rxctl),
    .gmii_eth_rxd   (gmii_eth_rxd),
    .identify       (identify),
    .sequence       (sequence),
    .icmp_rx_end    (icmp_rx_end)
);

reg         icmp_tx_start;
wire        icmp_tx_end;
icmp_tx icmp_tx_inst
(
    .clk            (gmii_eth_rxc),
    .rst_n          (rst_n),
    .icmp_tx_start  (icmp_tx_start),

    .pc_mac         (pc_mac_reg ),
    .pc_ip          (pc_ip_reg  ),
    .identify       (identify),
    .sequence       (sequence),

    .gmii_eth_txc   (gmii_eth_txc),
    .gmii_eth_txd   (gmii_eth_txd),
    .gmii_eth_txctl (gmii_eth_txctl),
    
    .eth_tx_end     (icmp_tx_end)
);

reg[9:0]    cnt;

//
always @ (posedge gmii_eth_rxc)
    if (rst_n == 0)
        cnt <= 14;
    else
        begin
            if (icmp_rx_end == 1)
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
            icmp_tx_start <= 0;       
        end   
    else
        begin
            if (key_in == 1)
                begin
                    icmp_tx_start <= 1;
                end
            else if (cnt == 13)
                begin
                    icmp_tx_start <= 1;
                end
            else
                icmp_tx_start <= 0;
        end


endmodule