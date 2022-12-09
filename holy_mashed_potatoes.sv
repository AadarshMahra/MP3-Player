module holy_mashed_potatoes_rom (
input clk,
input [13:0] addr,
output logic [7:0] q
);

logic [7:0] rom [12032];
always_ff @(posedge clk) begin
	q <= rom[addr];
end
initial begin $readmemh("holy_mashed_potatoes.txt", rom); end
endmodule