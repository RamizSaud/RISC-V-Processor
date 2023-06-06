module jump_pc (old_pc, label, new_pc);
    input [31:0] old_pc;
    input [31:0] label;
    output [31:0] new_pc;

    assign new_pc = old_pc + label;
endmodule