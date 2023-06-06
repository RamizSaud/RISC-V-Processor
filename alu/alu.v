module alu (read_data1,read_data2,control_signal,clk,result,zero_bit);
    input [31:0] read_data1, read_data2;
    input [3:0] control_signal;
    input clk;
    output reg [31:0] result;
    output reg zero_bit;

    // control_signal or read_data1 or read_data2

    always @(posedge clk or control_signal or read_data1 or read_data2) begin
        case (control_signal)
            4'b0000: result = read_data1 & read_data2;
            4'b0001: result = read_data1 | read_data2;
            4'b0010: result = read_data1 + read_data2;
            4'b0110: result = read_data1 - read_data2;
            4'b0100: begin
                if (read_data1 < read_data2)
                    result = 32'b0;
            end
            4'b0101: begin
                if (read_data1 > read_data2)
                    result = 32'b0;
            end
        endcase
        if (result==32'b0)
            zero_bit = 1;
        else
            zero_bit = 0;
    end
endmodule