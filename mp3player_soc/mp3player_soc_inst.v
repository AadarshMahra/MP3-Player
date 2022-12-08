	mp3player_soc u0 (
		.clk_clk            (<connected-to-clk_clk>),            //          clk.clk
		.i2c0_sda_in        (<connected-to-i2c0_sda_in>),        //         i2c0.sda_in
		.i2c0_scl_in        (<connected-to-i2c0_scl_in>),        //             .scl_in
		.i2c0_sda_oe        (<connected-to-i2c0_sda_oe>),        //             .sda_oe
		.i2c0_scl_oe        (<connected-to-i2c0_scl_oe>),        //             .scl_oe
		.keys_export        (<connected-to-keys_export>),        //         keys.export
		.reset_reset_n      (<connected-to-reset_reset_n>),      //        reset.reset_n
		.spi0_MISO          (<connected-to-spi0_MISO>),          //         spi0.MISO
		.spi0_MOSI          (<connected-to-spi0_MOSI>),          //             .MOSI
		.spi0_SCLK          (<connected-to-spi0_SCLK>),          //             .SCLK
		.spi0_SS_n          (<connected-to-spi0_SS_n>),          //             .SS_n
		.sdram_wire_1_addr  (<connected-to-sdram_wire_1_addr>),  // sdram_wire_1.addr
		.sdram_wire_1_ba    (<connected-to-sdram_wire_1_ba>),    //             .ba
		.sdram_wire_1_cas_n (<connected-to-sdram_wire_1_cas_n>), //             .cas_n
		.sdram_wire_1_cke   (<connected-to-sdram_wire_1_cke>),   //             .cke
		.sdram_wire_1_cs_n  (<connected-to-sdram_wire_1_cs_n>),  //             .cs_n
		.sdram_wire_1_dq    (<connected-to-sdram_wire_1_dq>),    //             .dq
		.sdram_wire_1_dqm   (<connected-to-sdram_wire_1_dqm>),   //             .dqm
		.sdram_wire_1_ras_n (<connected-to-sdram_wire_1_ras_n>), //             .ras_n
		.sdram_wire_1_we_n  (<connected-to-sdram_wire_1_we_n>),  //             .we_n
		.bridge_address     (<connected-to-bridge_address>),     //       bridge.address
		.bridge_byte_enable (<connected-to-bridge_byte_enable>), //             .byte_enable
		.bridge_read        (<connected-to-bridge_read>),        //             .read
		.bridge_write       (<connected-to-bridge_write>),       //             .write
		.bridge_write_data  (<connected-to-bridge_write_data>),  //             .write_data
		.bridge_acknowledge (<connected-to-bridge_acknowledge>), //             .acknowledge
		.bridge_read_data   (<connected-to-bridge_read_data>)    //             .read_data
	);

