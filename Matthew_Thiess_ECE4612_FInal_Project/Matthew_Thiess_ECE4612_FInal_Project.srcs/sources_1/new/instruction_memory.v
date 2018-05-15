`timescale 1ns / 1ps

module instruction_memory(input wire clk, input wire [31:0] pc, output reg [31:0] instruction);

//input [31:0]addr;
//output [31:0]instruction;

reg [31:0] instruction_mem [0:255];

//initialize instruction memory with program
initial begin
    instruction_mem[0]=32'h8C090004; //lw $t1, 0x4($zero)
    instruction_mem[4]=32'h8C0A0010; //lw $t2, 0x10($zero)
    instruction_mem[8]=32'h8C0C0014; //lw $t4, 0x14($zero)
    instruction_mem[12]=32'h8C0D0018; //lw $t5, 0x18($zero)
    instruction_mem[16]=32'h8C0E001C; //lw $t6, 0x1C($zero)
    instruction_mem[20]=32'h8C0F0020; //lw $t7, 0x20($zero)
    instruction_mem[24]=32'h0149582A; //slt $t3, $t2, $t1
    instruction_mem[28]=32'h11600004; //beq $t3, $zero, less (offset=0x4)
    
    instruction_mem[32]=32'h018F4018; //mul $t0, $t4, $t7
    instruction_mem[36]=32'h010E4020; //add $t0, $t0, $t6
    instruction_mem[40]=32'h010D401A; //div $t0, $t0, $t5
    instruction_mem[44]=32'h0800000F; //j save (offset=0xF)
    
    //less
    instruction_mem[48]=32'h018D4018; //mul $t0, $t4, $t5
    instruction_mem[52]=32'h010E4022; //sub $t0, $t0, $t6
    instruction_mem[56]=32'h010F4022; //sub $t0, $t0, $t7
    
    //save
    instruction_mem[60]=32'hAC080020; //sw $t0, 0x20($zero)
end

//update the selected instruction each clock cycle
always@(posedge clk) begin
    instruction = instruction_mem[pc]; //program counter gives address of desired instruction
end


endmodule
