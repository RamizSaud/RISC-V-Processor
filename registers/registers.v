module registers (read_register1,read_register2,write_register,write_data,reg_write,read_data1,read_data2);
    input [4:0] read_register1, read_register2, write_register;
    input [31:0] write_data;
    input reg_write;
    output [31:0] read_data1, read_data2;

    reg [31:0] registers [31:0];

    assign read_data1 = registers[read_register1];
    assign read_data2 = registers[read_register2];

    always @(reg_write or write_register or write_data) begin
        if (reg_write) begin
            registers[write_register] = write_data;
            registers[0] = 32'd0;
        end
    end

    initial
    begin
         registers[0] = 32'd0;
         registers[1] = 32'd1;
         registers[2] = 32'd2;
         registers[3] = 32'd3;
         registers[4] = 32'd4;
         registers[5] = 32'd5;
         registers[6] = 32'd6;
         registers[7] = 32'd7;
         registers[8] = 32'd9;
         registers[9] = 32'd8;
         registers[10] = 32'd10;
         registers[11] = 32'd11;
         registers[12] = 32'd12;
         registers[13] = 32'd13;
         registers[14] = 32'd14;
         registers[15] = 32'd15;
         registers[16] = 32'd16;
         registers[17] = 32'd17;
         registers[18] = 32'd18;
         registers[19] = 32'd19;
         registers[20] = 32'd20;
         registers[21] = 32'd21;
         registers[22] = 32'd22;
         registers[23] = 32'd23;
         registers[24] = 32'd24;
         registers[25] = 32'd25;
		 registers[26] = 32'd26;
         registers[27] = 32'd27;
         registers[28] = 32'd28;
         registers[29] = 32'd29;
         registers[30] = 32'd30;
         registers[31] = 32'd31;
    end
endmodule