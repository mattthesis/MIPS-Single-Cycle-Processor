`timescale 1ns / 1ps


module shift_left_2(in, shift);
parameter WIDTH_IN = 32;
parameter WIDTH_OUT = 32;

input[WIDTH_IN-1:0] in;
output[WIDTH_OUT-1:0] shift;

assign shift = in<<2;

endmodule
