module data_memory (address,write_data,mem_write,mem_read,read_data);
    input [31:0] address, write_data;
    input mem_write, mem_read;
    output reg [31:0] read_data;

    reg [31:0] data_memory [1023:0];

    initial begin
        data_memory[0] = 32'd45;
        data_memory[1] = 32'd34;
        data_memory[2] = 32'd98;
        data_memory[3] = 32'd12;
        data_memory[4] = 32'd10;
        data_memory[5] = 32'd3;
        data_memory[6] = 32'd58;
    end

    always @(mem_write or mem_read or write_data or address) begin
        if (mem_write)
            data_memory[address] = write_data;
        if (mem_read)
            read_data = data_memory[address];
        else
            read_data = 32'b0;
    end
endmodule