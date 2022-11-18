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
				logic [24:0] aud_mclk_ctr;
				logic SCL_IN, SCL, SDA_IN, SDA, SDA_OE, SCL_OE;    	
					
					
					
				   assign ARDUINO_IO[3] = aud_mclk_ctr[1]; 

					always_ff @(posedge MAX10_CLK1_50) begin
						aud_mclk_ctr <= aud_mclk_ctr + 1;
					end
					
		
					assign SCL_IN = SCL; 
					assign SCL = SCL_OE ? 1'b0 : 1'bz; 
					
					assign SDA_IN = SDA; 
					assign SDA = SDA_OE ? 1'b0 : 1'bz;
					
					assign ARDUINO_IO[15] = SCL;
					assign ARDUINO_IO[14] = SDA;
				  // You need to make sure that the port names here are identical to the port names at 
				  // the interface in lab61_soc.v
				  mp3player_soc soc (.clk_clk(MAX10_CLK1_50),
											 .reset_reset_n(KEY[0]), 
											 // I2C
											 .i2c0_sda_in(SDA_IN),
											 .i2c0_scl_in(SCL_IN), 
											 .i2c0_sda_oe(SDA_OE), 
											 .i2c0_scl_oe(SCL_OE), 
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
											.sdram_wire_we_n(DRAM_WE_N)                          //.we_n
											 );
	
											 
				//Instantiate additional FPGA fabric modules as needed		  
endmodule