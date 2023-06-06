module pc_mux (increment_pc, jump_pc, alu_result, branch1, branch2, zero_bit, clk, choice);
    input [31:0] increment_pc, jump_pc, alu_result;
    input branch1, branch2, zero_bit, clk;
    output reg [31:0] choice;

    // branch1 or branch2 or zero_bit or increment_pc or jump_pc

    always @(branch1 or branch2 or zero_bit or increment_pc or jump_pc or alu_result) begin
        if ({branch2,branch1}==2'b10) begin
            choice <= alu_result;
        end
        else if ({branch2,branch1}==2'b01) begin
            choice <= jump_pc;
        end
        else begin
            if (branch1 & zero_bit)
                choice <= jump_pc;
            else
                choice <= increment_pc; 
        end
    end
endmodule