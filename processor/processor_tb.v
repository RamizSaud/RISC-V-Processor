`include "processor.v"

module processor_tb;
    reg reset;
    reg clk;

    processor pr(reset,clk);

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0,processor_tb);

        reset = 1;
        clk = 1;
        #1
        reset = 0;
        #50
        $finish;
    end
    always #1 clk = ~clk;
endmodule