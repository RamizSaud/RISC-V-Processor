module increment_pc (old_pc,clk,new_pc);
    input [31:0] old_pc;
    input clk;
    output [31:0] new_pc;

    // always @(posedge clk) begin
    //     new_pc = old_pc + 4;
    // end

    assign new_pc = old_pc + 4;
endmodule