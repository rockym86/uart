module CompareREG #(parameter WIDTH = 16)
(
    input  wire             clk_50MHz,
    input  wire             L,
    input  wire             rst,
    input  wire [WIDTH-1:0] D,
    output reg  [WIDTH-1:0] Q
);

    initial begin
        Q = 16'd5207;      
    end

    always @(posedge clk_50MHz) begin
        if (rst) begin
            Q <= 16'd5207;
        end
        else if (L) begin
            Q <= D;
        end
    end

endmodule