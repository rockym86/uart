module devider #(parameter WIDTH = 16)
(
    input  wire             clk_50MHz,
    input  wire [WIDTH-1:0] devider,
    input  wire             rst,
    output reg              CE
);

    reg [WIDTH-1:0] cnt;

    initial begin
        cnt = 0;
        CE  = 0;
    end

    always @(posedge clk_50MHz) begin
        if (rst) begin
            cnt <= 0;
            CE  <= 0;
        end
        else if (cnt == devider) begin
            cnt <= 0;
            CE  <= 1'b1;
        end
        else begin
            cnt <= cnt + 1'b1;
            CE  <= 1'b0;
        end
    end

endmodule