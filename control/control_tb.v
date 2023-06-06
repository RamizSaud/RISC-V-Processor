`include "control.v"

module control_tb;
    reg [6:0] opcode;
    wire alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch,alu_op1,alu_op2;

    control c(opcode,alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch,alu_op1,alu_op2);

    initial begin
        $dumpfile("control.vcd");
        $dumpvars(0,control_tb);

        opcode = 7'b0110011;
        #1
        opcode = 7'b0000011;
        #1
        opcode = 7'b0100011;
        #1
        opcode = 7'b1100011;
        #1
        opcode = 7'b0010011;
        #1
        opcode = 7'b1100111;
        #1
        opcode = 7'b1101111;
        #1
        $finish;
    end
endmodule