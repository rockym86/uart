module baudgen #(
    parameter WIDTH = 11            // 11 бит хватает для делителя до 2047
)(
    input  wire             clk,     // 19.2 МГц от PLL
    input  wire             rst_n,   // активный низкий сброс
    input  wire             enable,  // глобальное разрешение (можно на VCC)
    input  wire [WIDTH-1:0] divisor, // значение перезагрузки = период - 1
    output reg              ce       // импульс длительностью 1 такт
);

    reg [WIDTH-1:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= {WIDTH{1'b0}};
            ce      <= 1'b0;
        end
        else if (enable) begin
            if (counter == {WIDTH{1'b0}}) begin
                counter <= divisor;   // загрузка делителя
                ce      <= 1'b1;      // CE = 1 ровно один такт
            end
            else begin
                counter <= counter - 1'b1; // декремент
                ce      <= 1'b0;
            end
        end
    end

endmodule