`include "data_memory.v"

module data_memory_tb;
    reg [31:0] address, write_data;
    reg mem_write, mem_read;
    wire [31:0] read_data;

    data_memory d (address,write_data,mem_write,mem_read,read_data);

    initial begin
        $dumpfile("data_memory.vcd");
        $dumpvars(0,data_memory_tb);

        address = 32'd4;
        mem_read = 1;
        mem_write = 0;
        write_data = 32'd23;

        #1
        mem_write = 1;
        mem_read = 0;

        #1
        mem_read = 1;
        mem_write = 0;
        $finish;
    end
endmodule