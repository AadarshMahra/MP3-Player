	component mp3player_soc is
		port (
			bridge_0_external_interface_address     : in    std_logic_vector(25 downto 0) := (others => 'X'); -- address
			bridge_0_external_interface_byte_enable : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- byte_enable
			bridge_0_external_interface_read        : in    std_logic                     := 'X';             -- read
			bridge_0_external_interface_write       : in    std_logic                     := 'X';             -- write
			bridge_0_external_interface_write_data  : in    std_logic_vector(15 downto 0) := (others => 'X'); -- write_data
			bridge_0_external_interface_acknowledge : out   std_logic;                                        -- acknowledge
			bridge_0_external_interface_read_data   : out   std_logic_vector(15 downto 0);                    -- read_data
			clk_clk                                 : in    std_logic                     := 'X';             -- clk
			i2c0_sda_in                             : in    std_logic                     := 'X';             -- sda_in
			i2c0_scl_in                             : in    std_logic                     := 'X';             -- scl_in
			i2c0_sda_oe                             : out   std_logic;                                        -- sda_oe
			i2c0_scl_oe                             : out   std_logic;                                        -- scl_oe
			keys_export                             : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			reset_reset_n                           : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr                         : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                           : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                        : out   std_logic;                                        -- cas_n
			sdram_wire_cke                          : out   std_logic;                                        -- cke
			sdram_wire_cs_n                         : out   std_logic;                                        -- cs_n
			sdram_wire_dq                           : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                          : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                        : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                         : out   std_logic;                                        -- we_n
			spi0_MISO                               : in    std_logic                     := 'X';             -- MISO
			spi0_MOSI                               : out   std_logic;                                        -- MOSI
			spi0_SCLK                               : out   std_logic;                                        -- SCLK
			spi0_SS_n                               : out   std_logic                                         -- SS_n
		);
	end component mp3player_soc;

	u0 : component mp3player_soc
		port map (
			bridge_0_external_interface_address     => CONNECTED_TO_bridge_0_external_interface_address,     -- bridge_0_external_interface.address
			bridge_0_external_interface_byte_enable => CONNECTED_TO_bridge_0_external_interface_byte_enable, --                            .byte_enable
			bridge_0_external_interface_read        => CONNECTED_TO_bridge_0_external_interface_read,        --                            .read
			bridge_0_external_interface_write       => CONNECTED_TO_bridge_0_external_interface_write,       --                            .write
			bridge_0_external_interface_write_data  => CONNECTED_TO_bridge_0_external_interface_write_data,  --                            .write_data
			bridge_0_external_interface_acknowledge => CONNECTED_TO_bridge_0_external_interface_acknowledge, --                            .acknowledge
			bridge_0_external_interface_read_data   => CONNECTED_TO_bridge_0_external_interface_read_data,   --                            .read_data
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                         clk.clk
			i2c0_sda_in                             => CONNECTED_TO_i2c0_sda_in,                             --                        i2c0.sda_in
			i2c0_scl_in                             => CONNECTED_TO_i2c0_scl_in,                             --                            .scl_in
			i2c0_sda_oe                             => CONNECTED_TO_i2c0_sda_oe,                             --                            .sda_oe
			i2c0_scl_oe                             => CONNECTED_TO_i2c0_scl_oe,                             --                            .scl_oe
			keys_export                             => CONNECTED_TO_keys_export,                             --                        keys.export
			reset_reset_n                           => CONNECTED_TO_reset_reset_n,                           --                       reset.reset_n
			sdram_wire_addr                         => CONNECTED_TO_sdram_wire_addr,                         --                  sdram_wire.addr
			sdram_wire_ba                           => CONNECTED_TO_sdram_wire_ba,                           --                            .ba
			sdram_wire_cas_n                        => CONNECTED_TO_sdram_wire_cas_n,                        --                            .cas_n
			sdram_wire_cke                          => CONNECTED_TO_sdram_wire_cke,                          --                            .cke
			sdram_wire_cs_n                         => CONNECTED_TO_sdram_wire_cs_n,                         --                            .cs_n
			sdram_wire_dq                           => CONNECTED_TO_sdram_wire_dq,                           --                            .dq
			sdram_wire_dqm                          => CONNECTED_TO_sdram_wire_dqm,                          --                            .dqm
			sdram_wire_ras_n                        => CONNECTED_TO_sdram_wire_ras_n,                        --                            .ras_n
			sdram_wire_we_n                         => CONNECTED_TO_sdram_wire_we_n,                         --                            .we_n
			spi0_MISO                               => CONNECTED_TO_spi0_MISO,                               --                        spi0.MISO
			spi0_MOSI                               => CONNECTED_TO_spi0_MOSI,                               --                            .MOSI
			spi0_SCLK                               => CONNECTED_TO_spi0_SCLK,                               --                            .SCLK
			spi0_SS_n                               => CONNECTED_TO_spi0_SS_n                                --                            .SS_n
		);

