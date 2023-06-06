`include "instruction_memory.v"

module instruction_memory_tb;
    reg [31:0] read_address;
    wire [31:0] instruction_code;

    instruction_memory i_m(
        .read_address (read_address),
        .instruction_code (instruction_code)
    );

    initial begin
        
            $dumpfile("instruction_memory.vcd");
            $dumpvars(0,instruction_memory_tb);

            read_address = 32'b0;
            #1
            read_address = 32'd4;
            #1
            read_address = 32'b8;
            #1
            $finish;
    end
endmodule