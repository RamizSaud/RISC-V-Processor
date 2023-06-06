module mem_read_data (read_data,opcode,funct3,return_data);
    input [31:0] read_data;
    input [6:0] opcode;
    input [2:0] funct3;
    output reg [31:0] return_data;
    always @(funct3 or opcode or read_data) begin
        if (opcode==7'b0000011) begin
            if (funct3==3'b010)
                return_data = read_data;
            else if (funct3==3'b000)
                return_data = {24'b0,read_data[7:0]};
        end
    end
endmodule