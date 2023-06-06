`include "alu.v"

module alu_tb;
    reg [31:0] read_data1, read_data2;
    reg [3:0] control_signal;
    reg clk;
    wire [31:0] result;
    wire zero_bit;

    alu a (read_data1,read_data2,control_signal,clk,result,zero_bit);

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0,alu_tb);

        read_data1 = 32'd12;
        read_data2 = 32'd12;

        control_signal = 4'b0000;
        #1

        control_signal = 4'b0001;
        #1

        control_signal = 4'b0010;
        #1

        control_signal = 4'b0110;
        #1

        control_signal = 4'b0100;
        #1

        control_signal = 4'b0101;
        #1

        $finish;
    end
endmodule