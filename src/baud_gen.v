module baud_gen (
    input wire clk,
    input wire reset,
    output reg baud_tick
);

    parameter DIV = 5208;
    reg [12:0] count;

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            baud_tick <=0;
        end
        else if (count == DIV-1) begin
            count <= 0;
            baud_tick <= 1;
        end
        else begin
            count <= count + 1;
            baud_tick <= 0;
        end
    end
endmodule
