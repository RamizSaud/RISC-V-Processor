module imm_gen (instruction_code,clk,imm_out);
    input [31:0] instruction_code;
    input clk;
    output reg [31:0] imm_out;

    // instruction_code

    always @(posedge clk or instruction_code) begin
        case (instruction_code[6:0])
            7'b1100011: imm_out = {instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[7],instruction_code[30:25],instruction_code[11:8],1'b0};
            7'b0100011: imm_out = {instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31:25],instruction_code[11:7]};
            7'b0000011: imm_out = {instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31:20]};
            7'b0010011: imm_out = {instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31:20]};
            7'b1100111: imm_out = {instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31:20]};
            7'b1101111: imm_out = {instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[31],instruction_code[19:12],instruction_code[20],instruction_code[30:21],1'b0};
            default: imm_out = 32'b0;
        endcase
    end
endmodule