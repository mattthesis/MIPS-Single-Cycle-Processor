`timescale 1ns / 1ps

module mux_testbench;

reg sel;
reg [31:0] in1;
reg [31:0] in2;
wire [31:0] out;

mux uut(.sel(sel), .in1(in1), .in2(in2), .out(out));

initial begin
    
    $monitor(sel, in1, in2, out);
    
    //go through both cases for mux
    in1=32'd64;
    in2=32'd32;
    
    //case 1: select in1
    sel=0;
    #5
    //case 2: select in2
    sel=1;
    #5
    $finish;
end
endmodule
