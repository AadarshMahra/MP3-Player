

module Control(
						input logic Clk, 
										Reset, 
						output logic readwrite, //1 for read
						output logic [15:0] addr
); 

/* internal state logic */
enum logic [2:0] {Write, Read1, Read2} state, next_state;


always_ff @ (posedge Clk)
begin
	if (Reset)
		state <= Write; 
	else
		state <= next_state; 
end


always_comb
begin
	readwrite = 1'b1;
	addr = 16'h0;
	
	unique case(state)
		Write: 
		begin
				readwrite = 1'b0;
				addr = 16'h0;
				next_state = state;
		end
			
		Read1:
		begin
			readwrite = 1'b1;
		   addr = 16'h0;
			next_state = Read1;
		end
		
		Read2:
		begin
			readwrite = 1'b1;
			addr = 16'h1;
			next_state = Read2;
		end
		default: 
			next_state = Write; 
		
	endcase 
end
endmodule 