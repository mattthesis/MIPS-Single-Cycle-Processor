`timescale 1ns / 1ps

module instruction_memory(addr[31:0], instruction[31:0]);

input [31:0]addr;
output [31:0]instruction;

reg [31:0] instruction_mem [0:255];

//load program into memory
initial begin
    $readmemb("program.mem", instruction_mem);
end

assign instruction = instruction_mem[addr[9:2]];

endmodule
