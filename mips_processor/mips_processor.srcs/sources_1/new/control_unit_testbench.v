`timescale 1ns / 1ps

module control_unit_testbench;

wire clk;
reg [5:0] instruction;
wire reg_dst, jump, branch, mem_read, mem_write, mem_to_reg, alu_src, reg_write;
wire [1:0] alu_op;

clock my_clock(.clk(clk));
control_unit uut(.clk(clk), .instruction(instruction), .reg_dst(reg_dst), .jump(jump), .branch(branch), .mem_read(mem_read), 
                .mem_to_reg(mem_to_reg), .alu_op(alu_op), .mem_write(mem_write), .alu_src(alu_src), .reg_write(reg_write));

initial begin
    $monitor(clk, instruction, reg_dst, jump, branch, mem_read, mem_write, mem_to_reg, alu_src, reg_write, alu_op);
    
    //r-type
    instruction=6'b000000;
    #20
    //lw
    instruction=6'b100011;
    #20
    //sw
    instruction=6'b101011;
    #20    
    //beq
    instruction=6'b000100;
    #20    
    //jump
    instruction=6'b000010;
    #20    
    $finish;
end
endmodule
