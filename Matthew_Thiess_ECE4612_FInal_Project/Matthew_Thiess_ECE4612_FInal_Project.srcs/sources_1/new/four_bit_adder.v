`timescale 1ns / 1ps

module four_bit_adder(x[3:0], y[3:0], c_in, sum[3:0], c_out);

input [3:0]x;
input [3:0]y;
input c_in;
output [3:0]sum;
output c_out;

wire co_1, co_2, co_3; //wires for carries between the full adders

full_adder add1(.x(x[0]), .y(y[0]), .c_in(c_in), .sum(sum[0]), .c_out(co_1));
full_adder add2(.x(x[1]), .y(y[1]), .c_in(co_1), .sum(sum[1]), .c_out(co_2));
full_adder add3(.x(x[2]), .y(y[2]), .c_in(co_2), .sum(sum[2]), .c_out(co_3));
full_adder add4(.x(x[3]), .y(y[3]), .c_in(co_3), .sum(sum[3]), .c_out(c_out));

endmodule
