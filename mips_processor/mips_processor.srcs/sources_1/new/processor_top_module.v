`timescale 1ns / 1ps

module processor_top_module(input wire clk, input wire reset);

wire [31:0] next_pc;
wire [31:0] pc;
wire [31:0] pc_plus_4;
wire [31:0] instruction;
wire [5:0] write_reg;
wire reg_dst, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
wire [1:0] alu_op;
wire [31:0] write_data_reg;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] read_data_mem;
wire [31:0] y; //second ALU operand
wire [31:0] alu_result; //ALU result
wire zero;
wire [31:0] extended;
wire [3:0] alu_ctrl;
wire [31:0] branch_shifted;
wire [31:0] branch_addr;
reg [31:0] four;
wire do_branch; //equal to 1 if performing beq
wire [31:0] non_jump_addr;
wire [27:0] jump_shifted;
wire [31:0] jump_addr;

parameter inc=4;
initial begin
    four=inc;
end

//PC and instruction memory
program_counter pc_reg(.clk(clk), .reset(reset), .next_pc(next_pc), .pc(pc));
instruction_memory i_mem(.clk(clk), .reset(reset), .pc(pc), .instruction(instruction));

//registers
register_file registers(.clk(clk), .read_reg1(instruction[25:21]), .read_reg2(instruction[20:16]), .write_reg(write_reg), 
                .write_en(reg_write), .write_data(write_data_reg), .read_data1(read_data1), .read_data2(read_data2));

//sign extension
sign_extension extend(.in(instruction[15:0]), .ext(extended));

//ALU and ALU control
alu_ctrl alu_control(.instr(instruction[5:0]), .alu_op(alu_op), .alu_ctrl(alu_ctrl));
alu my_alu(.x(read_data1), .y(y), .alu_ctrl(alu_ctrl), .result(alu_result), .zero(zero));

data_memory memory(.clk(clk), .addr(alu_result), .write_data(read_data2), .read_data(read_data_mem), 
                    .mem_write(mem_write), .mem_read(mem_read));

//control
control_unit main_control(.clk(clk), .instruction(instruction[31:26]), .reg_dst(reg_dst), .jump(jump), .branch(branch), .mem_read(mem_read), 
                            .mem_to_reg(mem_to_reg), .alu_op(alu_op), .mem_write(mem_write), .alu_src(alu_src), .reg_write(reg_write));

//increment PC
thirty_two_bit_adder add1(.x(pc), .y(four), .sum(pc_plus_4));

//branching
shift_left_2 branch_shift(.in(extended), .shift(branch_shifted));
thirty_two_bit_adder add2(.x(pc), .y(branch_shifted), .sum(branch_addr));
and_gate my_and_gate(.x(branch), .y(zero), .z(do_branch));


//jumping
shift_left_2 #(26,28) jump_shift(.in(instruction[25:0]), .shift(jump_shifted));
assign jump_addr = {pc_plus_4[31:28],jump_shifted}; //concatenate shifted jump addr with incremented PC to get full address

//muxes
mux #(5) mux1(.sel(reg_dst), .in1(instruction[20:16]), .in2(instruction[15:11]), .out(write_reg));
mux mux2(.sel(alu_src), .in1(read_data2), .in2(extended), .out(y));
mux mux3(.sel(mem_to_reg), .in1(alu_result), .in2(read_data_mem), .out(write_data_reg)); //selects where to write from
mux mux4(.sel(do_branch), .in1(pc_plus_4), .in2(branch_addr), .out(non_jump_addr));
mux mux5(.sel(jump), .in1(non_jump_addr), .in2(jump_addr), .out(next_pc));

endmodule
