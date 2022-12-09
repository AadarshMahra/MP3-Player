
module mp3player_soc (
	altpll_0_pll_slave_read,
	altpll_0_pll_slave_write,
	altpll_0_pll_slave_address,
	altpll_0_pll_slave_readdata,
	altpll_0_pll_slave_writedata,
	bridge_0_external_interface_address,
	bridge_0_external_interface_byte_enable,
	bridge_0_external_interface_read,
	bridge_0_external_interface_write,
	bridge_0_external_interface_write_data,
	bridge_0_external_interface_acknowledge,
	bridge_0_external_interface_read_data,
	clk_clk,
	i2c0_sda_in,
	i2c0_scl_in,
	i2c0_sda_oe,
	i2c0_scl_oe,
	keys_export,
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
	spi0_MISO,
	spi0_MOSI,
	spi0_SCLK,
	spi0_SS_n);	

	input		altpll_0_pll_slave_read;
	input		altpll_0_pll_slave_write;
	input	[1:0]	altpll_0_pll_slave_address;
	output	[31:0]	altpll_0_pll_slave_readdata;
	input	[31:0]	altpll_0_pll_slave_writedata;
	input	[25:0]	bridge_0_external_interface_address;
	input	[1:0]	bridge_0_external_interface_byte_enable;
	input		bridge_0_external_interface_read;
	input		bridge_0_external_interface_write;
	input	[15:0]	bridge_0_external_interface_write_data;
	output		bridge_0_external_interface_acknowledge;
	output	[15:0]	bridge_0_external_interface_read_data;
	input		clk_clk;
	input		i2c0_sda_in;
	input		i2c0_scl_in;
	output		i2c0_sda_oe;
	output		i2c0_scl_oe;
	input	[1:0]	keys_export;
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
	input		spi0_MISO;
	output		spi0_MOSI;
	output		spi0_SCLK;
	output		spi0_SS_n;
endmodule
