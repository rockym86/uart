module counter #(parameter WIDTH = 16)(
	input wire clk,
	input wire reset,
	
	output reg [WIDTH-1:0]Q);
	
	
	
	always @(posedge clk or posedge reset)begin
		if(reset)begin
			Q <= 0;
		
		end else begin
			Q <= Q + 1;
		end
	end

endmodule