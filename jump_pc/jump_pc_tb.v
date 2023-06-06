`include "jump_pc.v"

module jump_pc_tb;
    reg [31:0] old_pc;
    reg [31:0] label;
    wire [31:0] new_pc;

    jump_pc j_p(old_pc,label,new_pc);

    initial begin
        $dumpfile("jump_pc.vcd");
        $dumpvars(0,jump_pc_tb);

        old_pc = 32'd0;
        label = 32'd31;
        #1

        old_pc = 32'd12;
        label = 32'd10;
        #1
        $finish;
    end
endmodule