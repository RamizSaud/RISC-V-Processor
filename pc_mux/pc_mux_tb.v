`include "pc_mux.v"

module pc_mux_tb;
    reg [31:0] increment_pc, jump_pc;
    reg branch, zero_bit;
    wire [31:0] choice;

    pc_mux p_m(increment_pc, jump_pc, branch, zero_bit, choice);

    initial begin
        $dumpfile("pc_mux.vcd");
        $dumpvars(0,pc_mux_tb);

        increment_pc = 32'd23;
        jump_pc = 32'd25;

        branch = 1;
        zero_bit = 1;
        #1
        branch = 0;
        zero_bit = 1;
        $finish;
    end
endmodule