`timescale 1ns / 1ps

module half_adder(input wire x, input wire y, output wire sum, output wire carry);

//input x, y;
//output sum, carry;

xor_gate my_xor(.x(x), .y(y), .z(sum));
and_gate my_and(.x(x), .y(y), .z(carry));

endmodule
