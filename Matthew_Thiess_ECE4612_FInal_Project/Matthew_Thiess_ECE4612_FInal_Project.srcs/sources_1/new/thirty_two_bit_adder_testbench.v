`timescale 1ns / 1ps

module thirty_two_bit_adder_testbench;

reg [31:0]x;
reg [31:0]y;
reg c_in;
wire [31:0]sum, c_out;

thirty_two_bit_adder uut(.x(x), .y(y), .c_in(c_in), .sum(sum), .c_out(c_out));

initial begin
    
    $dumpfile("thirty_two_bit_adder.vcd");
    $dumpvars(0,thirty_two_bit_adder_testbench);
    $monitor(x, y, c_in, sum, c_out);
    
    //no carry in because we are interested in testing this independently
    c_in=0;
    
    //check 1: 45,000 + 160,000 = 205,000
    //
    //x=32'b0000_0000_0000_0000_1010_1111_1100_1000; //45,000
    //y=32'b0000_0000_0000_0010_0111_0001_0000_0000; //160,000
    x=32'd45000;
    y=32'd160000;
    #5
    if(sum!==32'd205000) $display("First check failed.");
    else $display("First check successful");
    //check 2: 75,000 + 475,005 = 550,005
    //
    x=32'd75000;
    y=32'd475005;
    #5
    if(sum!==32'd550005) $display("Second check failed.");
    else $display("Second check successful");


    $finish;
end
endmodule
