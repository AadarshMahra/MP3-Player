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
					  input [9:0] SW, 
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
					
					
					//assign ARDUINO_IO[15] = SCL;
					//assign ARDUINO_IO[14] = SDA;
					
				  // You need to make sure that the port names here are identical to the port names at 
				  // the interface in lab61_soc.v
				  mp3player_soc soc (.clk_clk(MAX10_CLK1_50),
											 .reset_reset_n(SW[0]), 
											 .keys_export(KEY),
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
				logic [8:0] register; //9 bits to account for dummy bit
				logic [31:0] address;
				logic [8:0] register2;
				logic [31:0] address2;
				int index;
				//harmony_rom hrom (.clk(MAX10_CLK1_50), .addr(address2), .q(register2));
				holy_mashed_potatoes_rom hrom(.clk(MAX10_CLK1_50), .addr(address2), .q(register2));
				cat_flat_rom crom (.clk(MAX10_CLK1_50), .addr(address), .q(register));
				
				//implement shift register
				logic LD_EN, SH_EN, Data_Bit;
				logic[31:0] full_register;
				
				logic [31:0] LR_ctr;
				logic [7:0] LD_ctr;
				logic [2:0] div_clk;
				logic [7:0] new_reg;
				assign SH_EN = ARDUINO_IO[5];
				assign full_register = {2'b00,new_reg,22'b00};
				assign new_reg = SW[8] ? register2 : register;
				logic [31:0] LD_ctr2, LR_ctr2;
				logic [2:0] div_clk2;
				//assign full_register2 = {2'b00,register2,22'b0};
				//reg_8 shift_reg(.Clk(MAX10_CLK1_50), .Load(LD_EN), .Shift_En(1'b0), .D(register), .Data_Out(new_reg), .Shift_Out(Data_Bit));
				//at each positive edge of the LRCLK, we want the next 8-bit sample
				always_ff @(posedge ARDUINO_IO[5]) begin
				
					
					
					/*if(LD_ctr[4:0] == 5'b00000)
					begin
						address <= address + 1'b1;
					end*/
					
					if(ARDUINO_IO[4])
					begin
						LR_ctr <= 5'h1F;
						LR_ctr <= LR_ctr - 1;
						ARDUINO_IO[1] <= full_register[LR_ctr];
						if(full_register[LR_ctr] == 0)
							if(LD_ctr != 0)
								LD_ctr <= LD_ctr - 1;
							else
								LD_ctr <= LD_ctr;
						else
							LD_ctr <= LD_ctr + 1;
					end
					else
					begin
						LR_ctr <= 5'h1F;
						LR_ctr <= LR_ctr - 1;
						ARDUINO_IO[1] <= full_register[LR_ctr];
						if(full_register[LR_ctr] == 0)
							if(LD_ctr != 0)
								LD_ctr <= LD_ctr - 1;
							else
								LD_ctr <= LD_ctr;
						else
							LD_ctr <= LD_ctr + 1;
					end
				end
				always_ff @(posedge div_clk[1]) begin
					if(~SW[9] & ~SW[8] & ~SW[7])
						address <= address + 1;
					else if(~SW[9] & ~SW[8] & SW[7])
					begin
						if(address != 0)
							address <= address - 1;
					end
					if(~SW[9] & SW[8] & ~SW[7])
						address2 <= address2 + 1;
					else if(~SW[9] & SW[8] & SW[7])
					begin
						if(address != 0)
							address2 <= address2 - 1;
					end
				end
				always_ff @(posedge ARDUINO_IO[4]) begin
					div_clk <= div_clk + 1;
				end
			
				always_comb
				begin
					LEDR = LD_ctr;
				end
				
endmodule
