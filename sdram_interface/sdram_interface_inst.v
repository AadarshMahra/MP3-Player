	sdram_interface u0 (
		.bridge_0_external_interface_address     (<connected-to-bridge_0_external_interface_address>),     // bridge_0_external_interface.address
		.bridge_0_external_interface_byte_enable (<connected-to-bridge_0_external_interface_byte_enable>), //                            .byte_enable
		.bridge_0_external_interface_read        (<connected-to-bridge_0_external_interface_read>),        //                            .read
		.bridge_0_external_interface_write       (<connected-to-bridge_0_external_interface_write>),       //                            .write
		.bridge_0_external_interface_write_data  (<connected-to-bridge_0_external_interface_write_data>),  //                            .write_data
		.bridge_0_external_interface_acknowledge (<connected-to-bridge_0_external_interface_acknowledge>), //                            .acknowledge
		.bridge_0_external_interface_read_data   (<connected-to-bridge_0_external_interface_read_data>),   //                            .read_data
		.reset_reset_n                           (<connected-to-reset_reset_n>),                           //                       reset.reset_n
		.sdram_wire_addr                         (<connected-to-sdram_wire_addr>),                         //                  sdram_wire.addr
		.sdram_wire_ba                           (<connected-to-sdram_wire_ba>),                           //                            .ba
		.sdram_wire_cas_n                        (<connected-to-sdram_wire_cas_n>),                        //                            .cas_n
		.sdram_wire_cke                          (<connected-to-sdram_wire_cke>),                          //                            .cke
		.sdram_wire_cs_n                         (<connected-to-sdram_wire_cs_n>),                         //                            .cs_n
		.sdram_wire_dq                           (<connected-to-sdram_wire_dq>),                           //                            .dq
		.sdram_wire_dqm                          (<connected-to-sdram_wire_dqm>),                          //                            .dqm
		.sdram_wire_ras_n                        (<connected-to-sdram_wire_ras_n>),                        //                            .ras_n
		.sdram_wire_we_n                         (<connected-to-sdram_wire_we_n>),                         //                            .we_n
		.clk_clk                                 (<connected-to-clk_clk>)                                  //                         clk.clk
	);

