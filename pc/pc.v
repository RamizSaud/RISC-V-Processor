module pc (old_pc,reset,clk,new_pc);
    input [31:0] old_pc;
    input reset, clk;
    output reg [31:0] new_pc;

    // reset or old_pc

    always @(posedge clk) begin
        if (reset)
            new_pc = 32'b0;
        else
            new_pc = old_pc;
    end
endmodule