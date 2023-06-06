`include "alu_mux.v"

module alu_mux_tb;
    reg [31:0] register_input, imm_gen_input;
    reg alu_src;
    wire [31:0] choice;

    alu_mux a_m(register_input,imm_gen_input,alu_src,choice);

    initial begin
        $dumpfile("alu_mux.vcd");
        $dumpvars(0,alu_mux_tb);

        register_input = 32'd27;
        imm_gen_input = 32'd43;

        alu_src = 0;
        #1
        alu_src = 1;
        #1

        $finish;
    end
endmodule