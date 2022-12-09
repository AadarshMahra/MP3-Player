
module mp3player_soc (
	bridge_address,
	bridge_byte_enable,
	bridge_read,
	bridge_write,
	bridge_write_data,
	bridge_acknowledge,
	bridge_read_data,
	clk_clk,
	i2c0_sda_in,
	i2c0_scl_in,
	i2c0_sda_oe,
	i2c0_scl_oe,
	keys_export,
	reset_reset_n,
	sdram_wire_1_addr,
	sdram_wire_1_ba,
	sdram_wire_1_cas_n,
	sdram_wire_1_cke,
	sdram_wire_1_cs_n,
	sdram_wire_1_dq,
	sdram_wire_1_dqm,
	sdram_wire_1_ras_n,
	sdram_wire_1_we_n,
	spi0_MISO,
	spi0_MOSI,
	spi0_SCLK,
	spi0_SS_n);	

	input	[25:0]	bridge_address;
	input	[1:0]	bridge_byte_enable;
	input		bridge_read;
	input		bridge_write;
	input	[15:0]	bridge_write_data;
	output		bridge_acknowledge;
	output	[15:0]	bridge_read_data;
	input		clk_clk;
	input		i2c0_sda_in;
	input		i2c0_scl_in;
	output		i2c0_sda_oe;
	output		i2c0_scl_oe;
	input	[1:0]	keys_export;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_1_addr;
	output	[1:0]	sdram_wire_1_ba;
	output		sdram_wire_1_cas_n;
	output		sdram_wire_1_cke;
	output		sdram_wire_1_cs_n;
	inout	[15:0]	sdram_wire_1_dq;
	output	[1:0]	sdram_wire_1_dqm;
	output		sdram_wire_1_ras_n;
	output		sdram_wire_1_we_n;
	input		spi0_MISO;
	output		spi0_MOSI;
	output		spi0_SCLK;
	output		spi0_SS_n;
endmodule
