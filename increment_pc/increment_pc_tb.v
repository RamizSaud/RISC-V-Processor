`include "increment_pc.v"

module increment_pc_tb;
    reg [31:0] old_pc;
    reg clk;
    wire [31:0] new_pc;

    increment_pc in_pc(
        .old_pc (old_pc),
        .clk (clk),
        .new_pc (new_pc)
    );

    initial begin
        $dumpfile("increment_pc.vcd");
        $dumpvars(0,increment_pc_tb);

        old_pc = 32'd4;
        #1
        $finish;
    end
endmodule