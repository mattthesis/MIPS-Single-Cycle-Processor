`timescale 1ns / 1ps

module instruction_memory(input wire clk, input wire [31:0] pc, output reg [31:0] instruction);

//input [31:0]addr;
//output [31:0]instruction;

reg [31:0] instruction_mem [0:255];

//load program into memory
//initial begin
//    $readmemb("program.mem", instruction_mem);
//end

//assign instruction = instruction_mem[addr[9:2]];

always@(posedge clk) begin




end
endmodule
