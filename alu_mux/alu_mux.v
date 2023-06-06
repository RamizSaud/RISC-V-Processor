module alu_mux (register_input,imm_gen_input,alu_src,choice);
    input [31:0] register_input, imm_gen_input;
    input alu_src;
    output reg [31:0] choice;

    always @(alu_src or register_input or imm_gen_input) begin
        if (alu_src)
            choice = imm_gen_input;
        else
            choice = register_input;
    end
endmodule