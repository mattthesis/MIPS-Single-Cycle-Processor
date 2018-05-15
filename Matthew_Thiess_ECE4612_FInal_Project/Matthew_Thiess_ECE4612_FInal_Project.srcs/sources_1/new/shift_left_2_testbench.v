`timescale 1ns / 1ps

module shift_left_2_testbench;

reg [31:0] in;
wire [31:0] shift;

shift_left_2 uut(.in(in), .shift(shift));

initial begin
    $monitor(in, shift);
    
    //test 2 cases
    in=32'b1111;
    #5
    in=32'b0011;
    #5

    $finish;
end
endmodule
