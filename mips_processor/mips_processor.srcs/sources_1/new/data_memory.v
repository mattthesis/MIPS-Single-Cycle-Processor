`timescale 1ns / 1ps
//both mem_read and mem_write are active high
//
module data_memory(input wire clk, input wire [31:0] addr, input wire signed [31:0] write_data, 
                output reg signed [31:0] read_data, input wire mem_write, input wire mem_read);

//reg [31:0] data_mem [0:32'hFFFF_FFFF];
reg [31:0] data_mem [0:127]; //create 128 data memory locations of 1 word each

//initialize memory
initial begin
    //case 1
//    data_mem[4]= -10; //i
//    data_mem[16]= 10; //j
    //case 2
    data_mem[4]= 20;
    data_mem[16]= 10;
    data_mem[20]= 200; //a
    data_mem[24]= 250; //b
    data_mem[28]= 350; //c
    data_mem[32]= 450; //d    
end

//assign read_data = mem_read ? data_mem[addr] : 32'bx;

always@(negedge clk) begin
    if(mem_read) read_data=data_mem[addr]; //if mem_read is high, access the memory location pointed to by addr and output
    if(mem_write) data_mem[addr]=write_data; //if mem_write is high, write the value in write_data to the specified address
end

endmodule