`timescale 1ns / 1ps

module program_counter(input wire clk, input wire reset, input wire [31:0] next_pc, output reg [31:0] pc);

//initialize the program counter to 0
initial begin
    pc = 32'b0;
end

//update the program counter on each rising clock edge
always@(posedge clk) begin
    if(reset==1'b1) pc = 32'b0;
    else pc = next_pc;
end
endmodule
