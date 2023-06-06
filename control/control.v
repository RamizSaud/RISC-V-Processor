module control (opcode,alu_src,mem_to_reg1,mem_to_reg2,reg_write,mem_read,mem_write,branch1,branch2,alu_op1,alu_op2);
    input [6:0] opcode;
    output reg alu_src,mem_to_reg1,mem_to_reg2,reg_write,mem_read,mem_write,branch1,branch2,alu_op1,alu_op2;

    always @(opcode) begin
        if (opcode==7'b0110011) // add, sub, or, and
            begin
                alu_src = 1'b0;
                mem_to_reg1 = 1'b0;
                mem_to_reg2 = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch1 = 1'b0;
                branch2 = 1'bx;
                alu_op1 = 1'b0;
                alu_op2 = 1'b1;
            end
        else if (opcode==7'b0000011) // lb, lw
            begin
                alu_src = 1'b1;
                mem_to_reg1 = 1'b1;
                mem_to_reg2 = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                branch1 = 1'b0;
                branch2 = 1'bx;
                alu_op1 = 1'b0;
                alu_op2 = 1'b0;
            end
        else if (opcode==7'b0100011) // sb, sw
            begin
                alu_src = 1'b1;
                mem_to_reg1 = 1'bx;
                mem_to_reg2 = 1'bx;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                branch1 = 1'b0;
                branch2 = 1'bx;
                alu_op1 = 1'b0;
                alu_op2 = 1'b0;
            end
        else if (opcode==7'b1100011) // beq, blt, bge
            begin
                alu_src = 1'b0;
                mem_to_reg1 = 1'bx;
                mem_to_reg2 = 1'bx;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch1 = 1'b1;
                branch2 = 1'bx;
                alu_op1 = 1'b1;
                alu_op2 = 1'b0;
            end
        else if (opcode==7'b0010011) // addi
            begin
                alu_src = 1'b1;
                mem_to_reg1 = 1'b0;
                mem_to_reg2 = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch1 = 1'b0;
                branch2 = 1'bx;
                alu_op1 = 1'b0;
                alu_op2 = 1'b0;
            end
        else if (opcode==7'b1100111) // jalr
            begin
                alu_src = 1'b1;
                mem_to_reg1 = 1'b0;
                mem_to_reg2 = 1'b1;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch1 = 1'b0;
                branch2 = 1'b1;
                alu_op1 = 1'b0;
                alu_op2 = 1'b0;
            end
        else if (opcode==7'b1101111) // jal
            begin
                alu_src = 1'bx;
                mem_to_reg1 = 1'b0;
                mem_to_reg2 = 1'b1;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                branch1 = 1'b1;
                branch2 = 1'b0;
                alu_op1 = 1'bx;
                alu_op2 = 1'bx;
            end
    end
    
endmodule