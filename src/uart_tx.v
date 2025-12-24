module uart_tx (
    input wire clk,
    input wire reset,
    input wire baud_tick,
    input wire start,
    input wire [7:0] data,
    output reg tx,
    output reg busy
);

    reg [3:0] bit_index;
    reg [9:0] shift_reg;

    always @(posedge clk) begin
        if (reset) begin
            tx <= 1'b1;
            busy <= 1'b0;
            bit_index <= 4'd0;
        end
        else begin
            if ( start && !busy) begin
            shift_reg <= {1'b1, data, 1'b0};
            busy <= 1'b1;
            bit_index <= 4'd0;
            end
        
            else if (busy && baud_tick) begin
            tx <= shift_reg[bit_index];
            bit_index <= bit_index + 1;
                if (bit_index == 4'd9) begin
                    busy <= 1'b0;
                    tx <= 1'b1;
                end
            end
        end
    end
endmodule
