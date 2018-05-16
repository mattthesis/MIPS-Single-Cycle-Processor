`timescale 1ns / 1ps

module mux(sel, in1, in2, out);

//set width to 32 by default
parameter WIDTH = 32;

input sel;
input[WIDTH-1:0] in1;
input[WIDTH-1:0] in2;
output[WIDTH-1:0] out;

assign out = sel ? in2:in1; //select in1 if sel==0, in2 otherwise

endmodule
