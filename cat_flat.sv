module cat_flat_rom (
input clk,
input [15:0] addr,
output logic [7:0] q
);

logic [7:0] rom [38970];
always_ff @(posedge clk) begin
	q <= rom[addr];
end
initial begin $readmemh("cat_flat.txt", rom); end
endmodule