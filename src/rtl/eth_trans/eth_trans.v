module eth_trans
(
    input       wire            rst_n,
    input       wire            rgmii_eth_rxc,
    input       wire            rgmii_eth_rxctl,
    input       wire[3:0]       rgmii_eth_rxd,

    input       wire            gmii_eth_txc,
    input       wire            gmii_eth_txctl,
    input       wire[7:0]       gmii_eth_txd,

    output      wire            rgmii_eth_txc,
    output      wire            rgmii_eth_txctl,
    output      wire[3:0]       rgmii_eth_txd,

    output      wire            gmii_eth_rxc,
    output      wire            gmii_eth_rxctl,
    output      wire[7:0]       gmii_eth_rxd 
);

rgmii_rx rgmii_rx_inst
(
    .rgmii_rxc      (rgmii_eth_rxc   ),
    .rgmii_rx_ctl   (rgmii_eth_rxctl ),
    .rgmii_rxd      (rgmii_eth_rxd   ),
    .gmii_rx_clk    (gmii_eth_rxc    ),
    .gmii_rx_dv     (gmii_eth_rxctl  ),
    .gmii_rxd       (gmii_eth_rxd    )
);
rgmii_tx rgmii_tx_inst
(
    .gmii_tx_clk    (gmii_eth_txc),
    .gmii_tx_en     (gmii_eth_txctl),
    .gmii_txd       (gmii_eth_txd),

    .rgmii_txc      (rgmii_eth_txc),
    .rgmii_tx_ctl   (rgmii_eth_txctl),
    .rgmii_txd      (rgmii_eth_txd)
);
endmodule