`timescale 1ns / 1ps

module sign_extension_testbench;

reg [15:0]in;
wire [31:0]ext;

sign_extension uut(.in(in), .ext(ext));

initial begin

    $monitor(in, ext);
    
    //go through two cases for sign extension
    in=16'b1000_0000_0000_0000;
    #5
    in=16'b0100_0000_0000_0000;
    #5
    $finish;
    
end
endmodule
