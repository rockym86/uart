module CNTREGR (
	input clk,
	input L,
	input wire [10:0] d,
	output reg [10:0] q);
	
	initial begin
		q = 11'b00001111100;
	end
	
	
	always @(posedge clk)begin
		if(L)begin
			q <= d;
		end
	end




endmodule