`include "imm_gen.v"

module imm_gen_tb;
    reg [31:0] instruction_code;
    wire [31:0] imm_out;

    imm_gen i_g(instruction_code,imm_out);

    initial begin
        $dumpfile("imm_gen.vcd");
        $dumpvars(0,imm_gen_tb);
        instruction_code = 32'b01010101101100100000010101100011;
        #1
        instruction_code = 32'b01010101101100100000010100100011;
        #1
        instruction_code = 32'b01010101101100100000010100100011;
        #1
        instruction_code = 32'h02a10093;
        #1
        instruction_code = 32'h014000ef;
        #1
        instruction_code = 32'h048000e7;
        #1
        $finish;
    end
endmodule