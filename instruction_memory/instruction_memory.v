module instruction_memory (read_address,instruction_code);
    input [31:0] read_address;
    output [31:0] instruction_code;

    reg [7:0] instruction_memory [1023:0];

    assign instruction_code = {instruction_memory[read_address+3],instruction_memory[read_address+2],instruction_memory[read_address+1],instruction_memory[read_address]};

    initial
        begin
            // Setting 32-bit instruction: add x1, x2, x3 
            instruction_memory[3] = 8'h00;
            instruction_memory[2] = 8'h31;
            instruction_memory[1] = 8'h00;
            instruction_memory[0] = 8'hb3;
            // Setting 32-bit instruction: sub x1, x2, x3
            instruction_memory[7] = 8'h40;
            instruction_memory[6] = 8'h31;
            instruction_memory[5] = 8'h00;
            instruction_memory[4] = 8'hb3;
            // Setting 32-bit instruction: and x1, x2, x3
            instruction_memory[11] = 8'h00;
            instruction_memory[10] = 8'h31;
            instruction_memory[9] = 8'h70;
            instruction_memory[8] = 8'hb3;
            // Setting 32-bit instruction: or x1, x2, x3
            instruction_memory[15] = 8'h00;
            instruction_memory[14] = 8'h31;
            instruction_memory[13] = 8'h60;
            instruction_memory[12] = 8'hb3;
            // Setting 32-bit instruction: addi x1, x2, 42
            instruction_memory[19] = 8'h02;
            instruction_memory[18] = 8'ha1;
            instruction_memory[17] = 8'h00;
            instruction_memory[16] = 8'h93;
            // Setting 32-bit instruction: lw x1, 1(x2)
            instruction_memory[23] = 8'h00;
            instruction_memory[22] = 8'h11;
            instruction_memory[21] = 8'h20;
            instruction_memory[20] = 8'h83;
            // Setting 32-bit instruction: sw x1, 1(x2)
            instruction_memory[27] = 8'h00;
            instruction_memory[26] = 8'h11;
            instruction_memory[25] = 8'h20;
            instruction_memory[24] = 8'ha3;
            // Setting 32-bit instruction: lb x1, 1(x2)
            instruction_memory[31] = 8'h00;
            instruction_memory[30] = 8'h11;
            instruction_memory[29] = 8'h00;
            instruction_memory[28] = 8'h83;
            // Setting 32-bit instruction: sb x1, 1(x2)
            instruction_memory[35] = 8'h00;
            instruction_memory[34] = 8'h11;
            instruction_memory[33] = 8'h00;
            instruction_memory[32] = 8'ha3;
            // Setting 32-bit instruction: beq x1, x2, 20
            instruction_memory[39] = 8'h00;
            instruction_memory[38] = 8'h20;
            instruction_memory[37] = 8'h8a;
            instruction_memory[36] = 8'h63;
            // Setting 32-bit instruction: blt x1, x2, 20
            instruction_memory[43] = 8'h00;
            instruction_memory[42] = 8'h20;
            instruction_memory[41] = 8'hca;
            instruction_memory[40] = 8'h63;
            // Setting 32-bit instruction: bge x1, x2, 20
            instruction_memory[47] = 8'h00;
            instruction_memory[46] = 8'h20;
            instruction_memory[45] = 8'hda;
            instruction_memory[44] = 8'h63;
            // Setting 32-bit instruction: jal x1, 20
            instruction_memory[51] = 8'h01;
            instruction_memory[50] = 8'h40;
            instruction_memory[49] = 8'h00;
            instruction_memory[48] = 8'hef;
            // Setting 32-bit instruction: jalr x1, x0, 72
            instruction_memory[55] = 8'h04;
            instruction_memory[54] = 8'h80;
            instruction_memory[53] = 8'h00;
            instruction_memory[52] = 8'he7;
            // Setting 32-bit instruction: beq x0, x0, -16
            instruction_memory[59] = 8'hfe;
            instruction_memory[58] = 8'h00;
            instruction_memory[57] = 8'h08;
            instruction_memory[56] = 8'he3;
            // Setting 32-bit instruction: beq x0, x0, -16
            instruction_memory[63] = 8'hfe;
            instruction_memory[62] = 8'h00;
            instruction_memory[61] = 8'h08;
            instruction_memory[60] = 8'he3;
            // Setting 32-bit instruction: beq x0, x0, -16
            instruction_memory[67] = 8'hfe;
            instruction_memory[66] = 8'h00;
            instruction_memory[65] = 8'h08;
            instruction_memory[64] = 8'he3;
            // Setting 32-bit instruction: beq x0, x0, -16
            instruction_memory[71] = 8'hfe;
            instruction_memory[70] = 8'h00;
            instruction_memory[69] = 8'h08;
            instruction_memory[68] = 8'he3;
        end
endmodule