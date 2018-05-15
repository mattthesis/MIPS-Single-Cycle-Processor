`timescale 1ns / 1ps
//both mem_read and mem_write are active high
//
module data_memory(input wire clk, input wire [31:0] addr, input wire [31:0] write_data, 
                output reg [31:0] read_data, input wire mem_write, input wire mem_read);

//reg [31:0] data_mem [0:32'hFFFF_FFFF];
reg [31:0] data_mem [0:127]; //create 128 data memory locations of 1 word each

//initial begin
//    $readmemb("data.mem", data_mem);
//end

//assign read_data = mem_read ? data_mem[addr] : 32'bx;

always@(negedge clk) begin
    if(mem_read) read_data=data_mem[addr]; //if mem_read is high, access the memory location pointed to by addr and output
    if(mem_write) data_mem[addr]=write_data; //if mem_write is high, write the value in write_data to the specified address
end

endmodule