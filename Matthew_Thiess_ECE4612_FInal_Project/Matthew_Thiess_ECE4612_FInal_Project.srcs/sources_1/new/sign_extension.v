`timescale 1ns / 1ps

module sign_extension(in, ext);

input[15:0] in;
output[31:0] ext;

assign ext = {{16{in[15]}},in};

endmodule
