`timescale 1ns / 1ps

module sixteen_bit_adder(input wire [15:0] x, input wire [15:0] y, input wire c_in, output wire [15:0] sum, output wire c_out);

//input [15:0]x;
//input [15:0]y;
//input c_in;
//output [15:0]sum;
//output c_out;

wire co_1, co_2, co_3; //wires for carries between the full adders

four_bit_adder add1(.x(x[3:0]), .y(y[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(co_1));
four_bit_adder add2(.x(x[7:4]), .y(y[7:4]), .c_in(co_1), .sum(sum[7:4]), .c_out(co_2));
four_bit_adder add3(.x(x[11:8]), .y(y[11:8]), .c_in(co_2), .sum(sum[11:8]), .c_out(co_3));
four_bit_adder add4(.x(x[15:12]), .y(y[15:12]), .c_in(co_3), .sum(sum[15:12]), .c_out(c_out));

endmodule