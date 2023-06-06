`include "../pc/pc.v"
`include "../instruction_memory/instruction_memory.v"
`include "../registers/registers.v"
`include "../control/control.v"
`include "../imm_gen/imm_gen.v"
`include "../alu_mux/alu_mux.v"
`include "../alu_control/alu_control.v"
`include "../alu/alu.v"
`include "../data_memory/data_memory.v"
`include "../register_mux/register_mux.v"
`include "../increment_pc/increment_pc.v"
`include "../jump_pc/jump_pc.v"
`include "../pc_mux/pc_mux.v"
`include "../mem_write_data/mem_write_data.v"
`include "../mem_read_data/mem_read_data.v"

module processor (reset,clk);
    input reset;
    input clk;

    wire [31:0] pc;
    wire [31:0] pc_;
    wire [31:0] instruction_code_;
    wire [31:0] read_data1_;
    wire [31:0] read_data2_;
    wire alu_src_,mem_to_reg1_,mem_to_reg2_,reg_write_,mem_read_,mem_write_,branch1_,branch2_,alu_op1_,alu_op2_;
    wire [31:0] imm_out_;
    wire [31:0] mux_to_alu_;
    wire [3:0] control_signal_;
    wire [31:0] alu_result_;
    wire zero_bit_;
    wire [31:0] read_data_mem_;
    wire [31:0] mux_to_register_;
    wire [31:0] pc_increment_;
    wire [31:0] pc_jump_;
    wire [31:0] mux_to_pc_;
    wire [31:0] mem_write_data_;
    wire [31:0] mem_read_data_;

    pc p (
        .old_pc (pc),
        .reset (reset),
        .clk (clk),
        .new_pc (pc_)
    );

    instruction_memory i_m (
        .read_address (pc_),
        .instruction_code (instruction_code_)
    );

    control c (
        .opcode (instruction_code_[6:0]),
        .alu_src (alu_src_),
        .mem_to_reg1 (mem_to_reg1_),
        .mem_to_reg2 (mem_to_reg2_),
        .reg_write (reg_write_),
        .mem_read (mem_read_),
        .mem_write (mem_write_),
        .branch1 (branch1_),
        .branch2 (branch2_),
        .alu_op1 (alu_op1_),
        .alu_op2 (alu_op2_)
    );

    registers r (
        .read_register1 (instruction_code_[19:15]),
        .read_register2 (instruction_code_[24:20]),
        .write_register (instruction_code_[11:7]),
        .write_data (mux_to_register_),
        .reg_write (reg_write_),
        .read_data1 (read_data1_),
        .read_data2 (read_data2_)
    );

    imm_gen i_g (
        .instruction_code (instruction_code_),
        .clk (clk),
        .imm_out (imm_out_)
    );

    alu_mux a_m (
        .register_input (read_data2_),
        .imm_gen_input (imm_out_),
        .alu_src (alu_src_),
        .choice (mux_to_alu_)
    );

    alu_control a_c (
        .funct3 (instruction_code_[14:12]),
        .funct7 (instruction_code_[30]),
        .alu_op1 (alu_op1_),
        .alu_op2 (alu_op2_),
        .control_signal (control_signal_)
    );

    alu a (
        .read_data1 (read_data1_),
        .read_data2 (mux_to_alu_),
        .control_signal (control_signal_),
        .clk (clk),
        .result (alu_result_),
        .zero_bit (zero_bit_)
    );

    mem_write_data m_w_d (
        .read_data (read_data2_),
        .opcode (instruction_code_[6:0]),
        .funct3 (instruction_code_[14:12]),
        .return_data (mem_write_data_)
    );

    data_memory d_m (
        .address (alu_result_),
        .write_data (mem_write_data_),
        .mem_write (mem_write_),
        .mem_read (mem_read_),
        .read_data (read_data_mem_)
    );

    mem_read_data m_r_d (
        .read_data (read_data_mem_),
        .opcode (instruction_code_[6:0]),
        .funct3 (instruction_code_[14:12]),
        .return_data (mem_read_data_)
    );

    register_mux r_m (
        .mem_data (mem_read_data_),
        .alu_result (alu_result_),
        .pc_increment (pc_increment_),
        .mem_to_reg1 (mem_to_reg1_),
        .mem_to_reg2 (mem_to_reg2_),
        .choice (mux_to_register_)
    );

    increment_pc i_p (
        .old_pc (pc_),
        .clk (clk),
        .new_pc (pc_increment_)
    );

    jump_pc j_p (
        .old_pc (pc_),
        .label (imm_out_),
        .new_pc (pc_jump_)
    );

    pc_mux p_m (
        .increment_pc (pc_increment_),
        .jump_pc (pc_jump_),
        .alu_result (alu_result_),
        .branch1 (branch1_),
        .branch2 (branch2_),
        .zero_bit (zero_bit_),
        .clk (clk),
        .choice (pc)
    );
endmodule