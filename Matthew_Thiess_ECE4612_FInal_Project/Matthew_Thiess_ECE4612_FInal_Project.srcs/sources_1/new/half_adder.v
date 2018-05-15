`timescale 1ns / 1ps

module half_adder(x, y, sum, carry);

input x, y;
output sum, carry;

xor_gate my_xor(.x(x), .y(y), .z(sum));
and_gate my_and(.x(x), .y(y), .z(carry));

endmodule
