`timescale 1ns / 1ps

module xor_gate(x, y, z);

input x, y;
output z;

assign z = x ^ y;

endmodule
