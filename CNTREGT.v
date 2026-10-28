module CNTREGT (
	input clk,
	input L,
	input wire [10:0] d,
	(* preserve *) output  reg [10:0] q);
	
	
	
	initial begin
		q = 11'b11111001111;
	end
	
	
	always @(posedge clk)begin
		if(L)begin
			q <= d;
		end
	end




endmodule