
module mp3player_soc (
	clk_clk,
	i2c0_sda_in,
	i2c0_scl_in,
	i2c0_sda_oe,
	i2c0_scl_oe,
	reset_reset_n,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n);	

	input		clk_clk;
	input		i2c0_sda_in;
	input		i2c0_scl_in;
	output		i2c0_sda_oe;
	output		i2c0_scl_oe;
	input		reset_reset_n;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
endmodule
