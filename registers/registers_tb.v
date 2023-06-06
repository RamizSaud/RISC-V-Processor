`include "registers.v"

module registers_tb;
    reg [4:0] read_register1, read_register2, write_register;
    reg [31:0] write_data;
    reg reg_write;
    wire [31:0] read_data1, read_data2;

    registers reg1(read_register1,read_register2,write_register,write_data,reg_write,read_data1,read_data2);

    initial begin
        $dumpfile("registers.vcd");
        $dumpvars(0,registers_tb);

        reg_write = 0;
        read_register1 = 5'b00000;
        read_register2 = 5'b00001;
        write_register = 5'b00010;
        write_data = 32'd24;

        #1

        reg_write = 1;

        $finish;
    end
endmodule