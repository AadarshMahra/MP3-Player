// top level 

/*---------------------------------------------------------------------------
  --      lab61.sv                                                          --
  --      Christine Chen                                                   --
  --      10/23/2013                                                       --
  --      modified by Zuofu Cheng                                          --
  --      For use with ECE 385                                             --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
// Top-level module that integrates the Nios II system with the rest of the hardware
	


module mp3player(  	 	  input	        MAX10_CLK1_50, 
					  input  [1:0]  KEY,
					  input [7:0] SW, 
					  output [7:0]  LEDR,
					  output [12:0] DRAM_ADDR,
					  output [1:0]  DRAM_BA,
					  output        DRAM_CAS_N,
					  output	    DRAM_CKE,
					  output	    DRAM_CS_N,
					  inout  [15:0] DRAM_DQ,
					  output		DRAM_LDQM,
					  output 		DRAM_UDQM,
					  output	    DRAM_RAS_N,
					  output	    DRAM_WE_N,
					  output	    DRAM_CLK,
					  inout [15:0] ARDUINO_IO
				  
				  );
					logic [1:0] aud_mclk_ctr;
					logic SCL_IN, SCL, SDA_IN, SDA, SDA_OE, SCL_OE;    	
					
					
					assign ARDUINO_IO[2] = ARDUINO_IO[1];
					 
					assign LRCLK = ARDUINO_IO[4]; 
					assign SCLK = ARDUINO_IO[5]; 
					
					
					/* set the master clock (Arduino) pin */
				   assign ARDUINO_IO[3] = aud_mclk_ctr[1]; 

					always_ff @(posedge MAX10_CLK1_50) begin
						aud_mclk_ctr <= aud_mclk_ctr + 1;
					end
					
					/*  */ 
					assign SCL_IN = ARDUINO_IO[15]; 
					assign ARDUINO_IO[15] = SCL_OE ? 1'b0 : 1'bz; 
					
					assign SDA_IN = ARDUINO_IO[14]; 
					assign ARDUINO_IO[14] = SDA_OE ? 1'b0 : 1'bz;
					
					/* SPI PIN Assignments & wire declarations */
					logic SPI0_CS_N, SPI0_SCLK, SPI0_MOSI, SPI0_MISO; 
					assign ARDUINO_IO[10] = SPI0_CS_N;
					assign ARDUINO_IO[13] = SPI0_SCLK;
					assign ARDUINO_IO[11] = SPI0_MOSI;
					assign ARDUINO_IO[12] = 1'bZ;
					assign SPI0_MISO = ARDUINO_IO[12];
					
					/* Avalon Bridge Wire Declarations */ 
					logic [25:0] BRIDGE_ADDR; 
					logic [1:0] BRIDGE_BYTE_EN; 
					logic BRIDGE_RE, BRIDGE_WR; 
					logic [15:0] BRIDGE_WR_DATA; 
					logic BRIDGE_ACK; 
					logic [15:0] BRIDGE_READ_DATA; 
					
					/* set BRIDGE ADDRESS based on read/write */ 
					always_comb
					begin
						if (LOAD_MEM)
							BRIDGE_ADDR = LOAD_ADDRESS;
						else 
							BRIDGE_ADDR = address; 
					end
					
				 /* We need SDRAM interface pins to use the SD Card Initializer. 
				    This requires creating a controller to do the interfacing. */
				  mp3player_soc soc (.clk_clk(MAX10_CLK1_50),
											 .reset_reset_n(SW[0]), 
											 .keys_export(KEY),
											 // Avalon Bridge, interface into SDRAM  
											 .bridge_address(BRIDGE_ADDR), 
											 .bridge_byte_enable(2'b11), 
											 .bridge_read(PLAY),
											 .bridge_write(LOAD_MEM & WE),
											 .bridge_write_data(RAM_DATA),
											 .bridge_acknowledge(BRIDGE_ACK), //output 
											 .bridge_read_data(BRIDGE_READ_DATA),	//output
											 // I2C
											 .i2c0_sda_in(SDA_IN),
											 .i2c0_scl_in(SCL_IN), 
											 .i2c0_sda_oe(SDA_OE), 
											 .i2c0_scl_oe(SCL_OE),
											/* 
											//SDRAM
											.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
											.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
											.sdram_wire_ba(DRAM_BA),                             //.ba
											.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
											.sdram_wire_cke(DRAM_CKE),                           //.cke
											.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
											.sdram_wire_dq(DRAM_DQ),                             //.dq
											.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
											.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
											.sdram_wire_we_n(DRAM_WE_N),                          //.we_n
											*/
											// SPI 
											.spi0_MISO(SPI0_MISO), //only input
											.spi0_MOSI(SPI0_MOSI), 
											.spi0_SCLK(SPI0_SCLK), 
											.spi0_SS_n(SPI0_CS_N)
											
											 );
											 
				
				
				/* wire declarations for control logic and SDCard Initialization */	
				logic LOAD_MEM,PLAY; 
				logic [24:0] LOAD_ADDRESS; 
				logic [15:0] RAM_DATA; 
				logic RAM_OP_BEGUN, RAM_INIT_ERROR, RAM_INIT_DONE, SCLK_O, CS_BO, MOSI_O, WE; 
				Control ISDU(.Clk(MAX10_CLK1_50), .Reset(~SW[0]), .RAM_INIT_DONE(RAM_INIT_DONE), .LOAD_MEM(LOAD_MEM), .PLAY(PLAY)); 
				 
				
				/* create SD Card Initializer */
				sdcard_init sdci(
				.clk50(MAX10_CLK1_50),			 
				.reset(~SW[0]),     
				.ram_op_begun(BRIDGE_ACK), // acknowledgement from RAM to move on to next word
				.miso_i(SPI0_MISO), 		 // last input
				.ram_we(WE), 		 // RAM interface pins
				.ram_address(LOAD_ADDRESS), 
				.ram_data(RAM_DATA), 	 
				.ram_init_done(RAM_INIT_DONE),
				.ram_init_error(RAM_INIT_ERROR), // not tied after this point
				.cs_bo(CS_BO), 		//SD card pins (also make sure to disable USB CS if using DE10-Lite)
				.sclk_o(SCLK_O), //not tied
				.mosi_o(MOSI_O) //not tied
				); 
				
	
											 
				//Instantiate additional FPGA fabric modules as needed	
				logic [15:0] register; //9 bits to account for dummy bit
				logic [26:0] address;
				//harmony_rom hrom (.clk(MAX10_CLK1_50), .addr(2'b11), .q(register));
				//cat_flat_rom crom (.clk(MAX10_CLK1_50), .addr(address), .q(register));
				
				logic[31:0] full_register, LR_ctr; 
				logic [2:0] div_clk;
				
				// fill register from SDRAM 
				assign register = BRIDGE_READ_DATA; 
				assign full_register = {2'b00,register,14'b0};
				
				//at each positive edge of the LRCLK, we want the next 8-bit sample
				always_ff @(posedge ARDUINO_IO[5]) begin
					if(ARDUINO_IO[4])
					begin
						LR_ctr <= 5'h1F;
						LR_ctr <= LR_ctr - 1;
						ARDUINO_IO[1] <= full_register[LR_ctr];
					end
					else
					begin
						LR_ctr <= 5'h1F;
						LR_ctr <= LR_ctr - 1;
						ARDUINO_IO[1] <= full_register[LR_ctr];
					end
				end
				
				always_ff @(posedge div_clk[1]) begin
					address <= address + PLAY;
					
				end
				always_ff @(posedge ARDUINO_IO[4]) begin
					div_clk <= div_clk + 1;
				end

				
endmodule
