// mp3player_soc_interface_0.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module mp3player_soc_interface_0 (
		input  wire [26:0] bridge_0_external_interface_address,     // bridge_0_external_interface.address
		input  wire [1:0]  bridge_0_external_interface_byte_enable, //                            .byte_enable
		input  wire        bridge_0_external_interface_read,        //                            .read
		input  wire        bridge_0_external_interface_write,       //                            .write
		input  wire [15:0] bridge_0_external_interface_write_data,  //                            .write_data
		output wire        bridge_0_external_interface_acknowledge, //                            .acknowledge
		output wire [15:0] bridge_0_external_interface_read_data,   //                            .read_data
		input  wire        clk_clk,                                 //                         clk.clk
		input  wire        reset_reset_n,                           //                       reset.reset_n
		output wire [12:0] sdram_wire_addr,                         //                  sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,                           //                            .ba
		output wire        sdram_wire_cas_n,                        //                            .cas_n
		output wire        sdram_wire_cke,                          //                            .cke
		output wire        sdram_wire_cs_n,                         //                            .cs_n
		inout  wire [15:0] sdram_wire_dq,                           //                            .dq
		output wire [1:0]  sdram_wire_dqm,                          //                            .dqm
		output wire        sdram_wire_ras_n,                        //                            .ras_n
		output wire        sdram_wire_we_n                          //                            .we_n
	);

	wire         altpll_0_c0_clk;                                           // altpll_0:c0 -> [mm_interconnect_0:altpll_0_c0_clk, new_sdram_controller_0:clk, rst_controller_001:clk]
	wire  [15:0] bridge_0_avalon_master_readdata;                           // mm_interconnect_0:bridge_0_avalon_master_readdata -> bridge_0:avalon_readdata
	wire         bridge_0_avalon_master_waitrequest;                        // mm_interconnect_0:bridge_0_avalon_master_waitrequest -> bridge_0:avalon_waitrequest
	wire   [1:0] bridge_0_avalon_master_byteenable;                         // bridge_0:avalon_byteenable -> mm_interconnect_0:bridge_0_avalon_master_byteenable
	wire         bridge_0_avalon_master_read;                               // bridge_0:avalon_read -> mm_interconnect_0:bridge_0_avalon_master_read
	wire  [26:0] bridge_0_avalon_master_address;                            // bridge_0:avalon_address -> mm_interconnect_0:bridge_0_avalon_master_address
	wire         bridge_0_avalon_master_write;                              // bridge_0:avalon_write -> mm_interconnect_0:bridge_0_avalon_master_write
	wire  [15:0] bridge_0_avalon_master_writedata;                          // bridge_0:avalon_writedata -> mm_interconnect_0:bridge_0_avalon_master_writedata
	wire  [31:0] mm_interconnect_0_altpll_0_pll_slave_readdata;             // altpll_0:readdata -> mm_interconnect_0:altpll_0_pll_slave_readdata
	wire   [1:0] mm_interconnect_0_altpll_0_pll_slave_address;              // mm_interconnect_0:altpll_0_pll_slave_address -> altpll_0:address
	wire         mm_interconnect_0_altpll_0_pll_slave_read;                 // mm_interconnect_0:altpll_0_pll_slave_read -> altpll_0:read
	wire         mm_interconnect_0_altpll_0_pll_slave_write;                // mm_interconnect_0:altpll_0_pll_slave_write -> altpll_0:write
	wire  [31:0] mm_interconnect_0_altpll_0_pll_slave_writedata;            // mm_interconnect_0:altpll_0_pll_slave_writedata -> altpll_0:writedata
	wire         mm_interconnect_0_new_sdram_controller_0_s1_chipselect;    // mm_interconnect_0:new_sdram_controller_0_s1_chipselect -> new_sdram_controller_0:az_cs
	wire  [15:0] mm_interconnect_0_new_sdram_controller_0_s1_readdata;      // new_sdram_controller_0:za_data -> mm_interconnect_0:new_sdram_controller_0_s1_readdata
	wire         mm_interconnect_0_new_sdram_controller_0_s1_waitrequest;   // new_sdram_controller_0:za_waitrequest -> mm_interconnect_0:new_sdram_controller_0_s1_waitrequest
	wire  [24:0] mm_interconnect_0_new_sdram_controller_0_s1_address;       // mm_interconnect_0:new_sdram_controller_0_s1_address -> new_sdram_controller_0:az_addr
	wire         mm_interconnect_0_new_sdram_controller_0_s1_read;          // mm_interconnect_0:new_sdram_controller_0_s1_read -> new_sdram_controller_0:az_rd_n
	wire   [1:0] mm_interconnect_0_new_sdram_controller_0_s1_byteenable;    // mm_interconnect_0:new_sdram_controller_0_s1_byteenable -> new_sdram_controller_0:az_be_n
	wire         mm_interconnect_0_new_sdram_controller_0_s1_readdatavalid; // new_sdram_controller_0:za_valid -> mm_interconnect_0:new_sdram_controller_0_s1_readdatavalid
	wire         mm_interconnect_0_new_sdram_controller_0_s1_write;         // mm_interconnect_0:new_sdram_controller_0_s1_write -> new_sdram_controller_0:az_wr_n
	wire  [15:0] mm_interconnect_0_new_sdram_controller_0_s1_writedata;     // mm_interconnect_0:new_sdram_controller_0_s1_writedata -> new_sdram_controller_0:az_data
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [altpll_0:reset, bridge_0:reset, mm_interconnect_0:bridge_0_reset_reset_bridge_in_reset_reset]
	wire         rst_controller_001_reset_out_reset;                        // rst_controller_001:reset_out -> [mm_interconnect_0:new_sdram_controller_0_reset_reset_bridge_in_reset_reset, new_sdram_controller_0:reset_n]

	mp3player_soc_interface_0_altpll_0 altpll_0 (
		.clk                (clk_clk),                                        //       inclk_interface.clk
		.reset              (rst_controller_reset_out_reset),                 // inclk_interface_reset.reset
		.read               (mm_interconnect_0_altpll_0_pll_slave_read),      //             pll_slave.read
		.write              (mm_interconnect_0_altpll_0_pll_slave_write),     //                      .write
		.address            (mm_interconnect_0_altpll_0_pll_slave_address),   //                      .address
		.readdata           (mm_interconnect_0_altpll_0_pll_slave_readdata),  //                      .readdata
		.writedata          (mm_interconnect_0_altpll_0_pll_slave_writedata), //                      .writedata
		.c0                 (altpll_0_c0_clk),                                //                    c0.clk
		.c1                 (),                                               //                    c1.clk
		.scandone           (),                                               //           (terminated)
		.scandataout        (),                                               //           (terminated)
		.c2                 (),                                               //           (terminated)
		.c3                 (),                                               //           (terminated)
		.c4                 (),                                               //           (terminated)
		.areset             (1'b0),                                           //           (terminated)
		.locked             (),                                               //           (terminated)
		.phasedone          (),                                               //           (terminated)
		.phasecounterselect (3'b000),                                         //           (terminated)
		.phaseupdown        (1'b0),                                           //           (terminated)
		.phasestep          (1'b0),                                           //           (terminated)
		.scanclk            (1'b0),                                           //           (terminated)
		.scanclkena         (1'b0),                                           //           (terminated)
		.scandata           (1'b0),                                           //           (terminated)
		.configupdate       (1'b0)                                            //           (terminated)
	);

	mp3player_soc_interface_0_bridge_0 bridge_0 (
		.clk                (clk_clk),                                 //                clk.clk
		.reset              (rst_controller_reset_out_reset),          //              reset.reset
		.avalon_readdata    (bridge_0_avalon_master_readdata),         //      avalon_master.readdata
		.avalon_waitrequest (bridge_0_avalon_master_waitrequest),      //                   .waitrequest
		.avalon_byteenable  (bridge_0_avalon_master_byteenable),       //                   .byteenable
		.avalon_read        (bridge_0_avalon_master_read),             //                   .read
		.avalon_write       (bridge_0_avalon_master_write),            //                   .write
		.avalon_writedata   (bridge_0_avalon_master_writedata),        //                   .writedata
		.avalon_address     (bridge_0_avalon_master_address),          //                   .address
		.address            (bridge_0_external_interface_address),     // external_interface.export
		.byte_enable        (bridge_0_external_interface_byte_enable), //                   .export
		.read               (bridge_0_external_interface_read),        //                   .export
		.write              (bridge_0_external_interface_write),       //                   .export
		.write_data         (bridge_0_external_interface_write_data),  //                   .export
		.acknowledge        (bridge_0_external_interface_acknowledge), //                   .export
		.read_data          (bridge_0_external_interface_read_data)    //                   .export
	);

	mp3player_soc_interface_0_new_sdram_controller_0 new_sdram_controller_0 (
		.clk            (altpll_0_c0_clk),                                           //   clk.clk
		.reset_n        (~rst_controller_001_reset_out_reset),                       // reset.reset_n
		.az_addr        (mm_interconnect_0_new_sdram_controller_0_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_new_sdram_controller_0_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_new_sdram_controller_0_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_new_sdram_controller_0_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_new_sdram_controller_0_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_new_sdram_controller_0_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_new_sdram_controller_0_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_new_sdram_controller_0_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_new_sdram_controller_0_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                                           //  wire.export
		.zs_ba          (sdram_wire_ba),                                             //      .export
		.zs_cas_n       (sdram_wire_cas_n),                                          //      .export
		.zs_cke         (sdram_wire_cke),                                            //      .export
		.zs_cs_n        (sdram_wire_cs_n),                                           //      .export
		.zs_dq          (sdram_wire_dq),                                             //      .export
		.zs_dqm         (sdram_wire_dqm),                                            //      .export
		.zs_ras_n       (sdram_wire_ras_n),                                          //      .export
		.zs_we_n        (sdram_wire_we_n)                                            //      .export
	);

	mp3player_soc_interface_0_mm_interconnect_0 mm_interconnect_0 (
		.altpll_0_c0_clk                                          (altpll_0_c0_clk),                                           //                                        altpll_0_c0.clk
		.clk_0_clk_clk                                            (clk_clk),                                                   //                                          clk_0_clk.clk
		.bridge_0_reset_reset_bridge_in_reset_reset               (rst_controller_reset_out_reset),                            //               bridge_0_reset_reset_bridge_in_reset.reset
		.new_sdram_controller_0_reset_reset_bridge_in_reset_reset (rst_controller_001_reset_out_reset),                        // new_sdram_controller_0_reset_reset_bridge_in_reset.reset
		.bridge_0_avalon_master_address                           (bridge_0_avalon_master_address),                            //                             bridge_0_avalon_master.address
		.bridge_0_avalon_master_waitrequest                       (bridge_0_avalon_master_waitrequest),                        //                                                   .waitrequest
		.bridge_0_avalon_master_byteenable                        (bridge_0_avalon_master_byteenable),                         //                                                   .byteenable
		.bridge_0_avalon_master_read                              (bridge_0_avalon_master_read),                               //                                                   .read
		.bridge_0_avalon_master_readdata                          (bridge_0_avalon_master_readdata),                           //                                                   .readdata
		.bridge_0_avalon_master_write                             (bridge_0_avalon_master_write),                              //                                                   .write
		.bridge_0_avalon_master_writedata                         (bridge_0_avalon_master_writedata),                          //                                                   .writedata
		.altpll_0_pll_slave_address                               (mm_interconnect_0_altpll_0_pll_slave_address),              //                                 altpll_0_pll_slave.address
		.altpll_0_pll_slave_write                                 (mm_interconnect_0_altpll_0_pll_slave_write),                //                                                   .write
		.altpll_0_pll_slave_read                                  (mm_interconnect_0_altpll_0_pll_slave_read),                 //                                                   .read
		.altpll_0_pll_slave_readdata                              (mm_interconnect_0_altpll_0_pll_slave_readdata),             //                                                   .readdata
		.altpll_0_pll_slave_writedata                             (mm_interconnect_0_altpll_0_pll_slave_writedata),            //                                                   .writedata
		.new_sdram_controller_0_s1_address                        (mm_interconnect_0_new_sdram_controller_0_s1_address),       //                          new_sdram_controller_0_s1.address
		.new_sdram_controller_0_s1_write                          (mm_interconnect_0_new_sdram_controller_0_s1_write),         //                                                   .write
		.new_sdram_controller_0_s1_read                           (mm_interconnect_0_new_sdram_controller_0_s1_read),          //                                                   .read
		.new_sdram_controller_0_s1_readdata                       (mm_interconnect_0_new_sdram_controller_0_s1_readdata),      //                                                   .readdata
		.new_sdram_controller_0_s1_writedata                      (mm_interconnect_0_new_sdram_controller_0_s1_writedata),     //                                                   .writedata
		.new_sdram_controller_0_s1_byteenable                     (mm_interconnect_0_new_sdram_controller_0_s1_byteenable),    //                                                   .byteenable
		.new_sdram_controller_0_s1_readdatavalid                  (mm_interconnect_0_new_sdram_controller_0_s1_readdatavalid), //                                                   .readdatavalid
		.new_sdram_controller_0_s1_waitrequest                    (mm_interconnect_0_new_sdram_controller_0_s1_waitrequest),   //                                                   .waitrequest
		.new_sdram_controller_0_s1_chipselect                     (mm_interconnect_0_new_sdram_controller_0_s1_chipselect)     //                                                   .chipselect
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (altpll_0_c0_clk),                    //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
