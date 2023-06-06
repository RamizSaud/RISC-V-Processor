module alu_control (funct3,funct7,alu_op1,alu_op2,control_signal);
    input [2:0] funct3;
    input funct7, alu_op1, alu_op2;
    output reg [3:0] control_signal;

    always @(funct3 or funct7 or alu_op1 or alu_op2) begin
        if ({alu_op2,alu_op1}==2'b10) begin // R-format
            case ({funct7,funct3})
                4'b0111: control_signal = 4'b0000;
                4'b0110: control_signal = 4'b0001;
                4'b0000: control_signal = 4'b0010;
                4'b1000: control_signal = 4'b0110;
            endcase
        end
        else if ({alu_op2,alu_op1}==2'b00) begin // I-format, J-format, S-format
            control_signal = 4'b0010;
        end
        else if ({alu_op2,alu_op1}==2'b01) begin // B-format
            case ({funct3})
                3'b000: control_signal = 4'b0110;
                3'b100: control_signal = 4'b0100;
                3'b101: control_signal = 4'b0101;
            endcase
        end
    end
endmodule