module reg_8 (input  logic Clk, Load, Shift_En,
              input  logic [8:0]  D,
              output logic [8:0]  Data_Out,
				  output logic Shift_Out);

    always_ff @ (posedge Clk)
    begin
		 if (Load)
			  Data_Out <= D;
		 else if (Shift_En)
		 begin
			  //concatenate shifted in data to the previous left-most 3 bits
			  //note this works because we are in always_ff procedure block
			  Data_Out <= { Data_Out[7:0], 1'b0 }; 
	    end
    end
	 assign Shift_Out = Data_Out[8];

endmodule