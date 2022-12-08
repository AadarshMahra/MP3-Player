
module sdram_interface (
	bridge_0_external_interface_address,
	bridge_0_external_interface_byte_enable,
	bridge_0_external_interface_read,
	bridge_0_external_interface_write,
	bridge_0_external_interface_write_data,
	bridge_0_external_interface_acknowledge,
	bridge_0_external_interface_read_data,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	clk_clk);	

	input	[26:0]	bridge_0_external_interface_address;
	input	[1:0]	bridge_0_external_interface_byte_enable;
	input		bridge_0_external_interface_read;
	input		bridge_0_external_interface_write;
	input	[15:0]	bridge_0_external_interface_write_data;
	output		bridge_0_external_interface_acknowledge;
	output	[15:0]	bridge_0_external_interface_read_data;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		clk_clk;
endmodule
