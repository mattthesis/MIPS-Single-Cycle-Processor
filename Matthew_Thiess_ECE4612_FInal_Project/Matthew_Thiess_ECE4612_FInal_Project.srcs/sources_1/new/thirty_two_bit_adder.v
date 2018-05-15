`timescale 1ns / 1ps

module thirty_two_bit_adder(input wire [31:0] x, input wire [31:0] y, input wire c_in, output wire [31:0] sum, output wire c_out);

//input [31:0]x;
//input [31:0]y;
//input c_in;
//output [31:0]sum;
//output c_out;

wire carry; //a wire for the carry bewteen sixteen bit adders

sixteen_bit_adder add1(.x(x[15:0]), .y(y[15:0]), .c_in(c_in), .sum(sum[15:0]), .c_out(carry));
sixteen_bit_adder add2(.x(x[31:16]), .y(y[31:16]), .c_in(carry), .sum(sum[31:16]), .c_out(c_out));

endmodule