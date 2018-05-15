`timescale 1ns / 1ps
//both mem_read and mem_write are active high
//
module data_memory(addr[31:0], write_data[31:0], read_data[31:0], mem_write, mem_read);

input [31:0]addr;
input [31:0]write_data;
input mem_write, mem_read;
output [31:0]read_data;
reg [31:0] data_mem [0:32'hFFFF_FFFF];

initial begin
    $readmemb("data.mem", data_mem);
end

assign read_data = mem_read ? data_mem[addr] : 32'bx;

always@(posedge mem_write)
begin
    data_mem[addr] = write_data;
end

endmodule