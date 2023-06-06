`include "pc.v"

module pc_tb;
    reg [31:0] old_pc;
    reg clk,reset;
    wire [31:0] new_pc;

    pc pc(
        .old_pc (old_pc),
        .reset (reset),
        .clk (clk),
        .new_pc (new_pc)
    );

    initial begin
        $dumpfile("pc.vcd");
        $dumpvars(0,pc_tb);

        reset = 1;
        #1
        reset = 0;
        #20
        $finish;
    end  
    always #1 clk = ~clk;
endmodule