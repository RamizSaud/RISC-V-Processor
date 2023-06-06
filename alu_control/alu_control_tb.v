`include "alu_control.v"

module alu_control_tb;
    reg [2:0] funct3;
    reg funct7, alu_op1, alu_op2;
    wire [3:0] control_signal;

    alu_control a_c(funct3,funct7,alu_op1,alu_op2,control_signal);

    initial begin
        $dumpfile("alu_control.vcd");
        $dumpvars(0,alu_control_tb);

        alu_op2 = 1'b1;
        alu_op1 = 1'b0;

        funct3 = 3'b111;
        funct7 = 1'b0;
        #1

        funct3 = 3'b110;
        funct7 = 1'b0;
        #1

        funct3 = 3'b000;
        funct7 = 1'b0;
        #1

        funct3 = 3'b000;
        funct7 = 1'b1;
        #1

        alu_op2 = 1'b0;
        alu_op1 = 1'b0;
        #1

        alu_op2 = 1'b0;
        alu_op1 = 1'b1;
        #1

        $finish;

    end
endmodule