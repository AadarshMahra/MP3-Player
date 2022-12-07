

module Control(
						input logic Clk, 
										Reset, 
										RAM_INIT_DONE, 
						output logic LOAD_MEM, 
										 PLAY
); 

/* internal state logic */
enum logic {Halted, Play};  
logic state, next_state;  


always_ff @ (posedge Clk)
begin
	if (Reset)
		state <= Halted; 
	else
		state <= next_state; 
end


always_comb
begin
	LOAD_MEM = 1'b0; 
	PLAY = 1'b0; 
	
	unique case(state)
		Halted: 
			if (RAM_INIT_DONE)
			begin
				next_state = Play; 
				PLAY = 1; 
				LOAD_MEM = 0;  
			end
end