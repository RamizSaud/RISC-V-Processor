`include "register_mux.v"

module register_mux_tb;
    reg [31:0] mem_data, alu_result;
    reg mem_to_reg;
    wire [31:0] choice;

    register_mux r_m(mem_data, alu_result, mem_to_reg, choice);

    initial begin
        $dumpfile("register_mux.vcd");
        $dumpvars(0,register_mux_tb);

        mem_data = 32'd43;
        alu_result = 32'd23;
        mem_to_reg = 1;

        #1
        mem_to_reg = 0;

        $finish;
    end
endmodule