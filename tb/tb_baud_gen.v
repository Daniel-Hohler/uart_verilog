`timescale 1ns/1ps

module tb_baud_gen;
    reg clk = 0;
    reg reset = 1;
    wire baud_tick;

    baud_gen #(.DIV(10)) uut (
        .clk(clk),
        .reset(reset),
        .baud_tick(baud_tick)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("baud_gen.vcd");
        $dumpvars(0, tb_baud_gen);

        #20;
        reset = 0;
        #300;
        $finish;
    end
endmodule 
