`include "mem_read_data.v"

module mem_read_data_tb;
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [31:0] read_data;
    wire [31:0] return_data;

    mem_read_data m22(read_data, opcode, funct3, return_data);

    initial begin
        $dumpfile("mem_read_data.vcd");
        $dumpvars(0,mem_read_data_tb);

        read_data = 32'b01011100001111010101010001100111;
        opcode = 7'b0000011;
        funct3 = 3'b000;
        #1
        funct3 = 3'b010;
        #1
        $finish;
    end
endmodule