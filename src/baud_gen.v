<<<<<<< HEAD
=======
// Generates a single-cycle baud_tick every DIV clock cycle
>>>>>>> 5cbdfcb0a240e15d70a0bdd8342630b65ca4e685
module baud_gen (
    input wire clk,
    input wire reset,
    output reg baud_tick
);
<<<<<<< HEAD

    paramter DIV = 5208;
    reg [12:0] count;

=======
// Value for clock divider
// In this case for a 50MHz clock assuming a 9600 baud - 50,000,000 / 9600
    paramter DIV = 5208;
    reg [12:0] count;
>>>>>>> 5cbdfcb0a240e15d70a0bdd8342630b65ca4e685
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
end module
