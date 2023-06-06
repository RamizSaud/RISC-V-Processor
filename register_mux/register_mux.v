module register_mux (mem_data, alu_result, pc_increment, mem_to_reg1, mem_to_reg2, choice);
    input [31:0] mem_data, alu_result, pc_increment;
    input mem_to_reg1, mem_to_reg2;
    output reg [31:0] choice;

    always @(mem_to_reg1 or mem_to_reg2 or alu_result or mem_data) begin
        if ({mem_to_reg2,mem_to_reg1}==2'b01)
            choice = mem_data;
        else if ({mem_to_reg2,mem_to_reg1}==2'b00)
            choice = alu_result;
        else if ({mem_to_reg2,mem_to_reg1}==2'b10)
            choice = pc_increment;
    end
endmodule