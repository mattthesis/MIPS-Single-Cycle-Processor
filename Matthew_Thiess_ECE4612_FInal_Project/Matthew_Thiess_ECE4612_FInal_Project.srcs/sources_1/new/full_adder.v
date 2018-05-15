`timescale 1ns / 1ps

module full_adder(x, y, c_in, sum, c_out);

input x, y, c_in;
output sum, c_out;
wire co_1, co_2; //wires for internal carry out
wire sum_internal; //wire for sum from first adder

half_adder half1(.x(x), .y(y), .sum(sum_internal), .carry(co_1)); //half adder 1
half_adder half2(.x(c_in), .y(sum_internal), .sum(sum), .carry(co_2)); //half adder 2
or_gate my_or(.x(co_1), .y(co_2), .z(c_out));

endmodule
