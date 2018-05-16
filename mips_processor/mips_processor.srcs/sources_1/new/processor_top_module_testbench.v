`timescale 1ns / 1ps

module processor_top_module_testbench;

wire clk;
reg reset;

clock my_clock(.clk(clk));
processor_top_module uut(.clk(clk), .reset(reset));

initial begin
    reset=1'b1;
    #5
    reset=1'b0;
    #400 //wait 315 ns for processor to finish program
    $finish;
end
endmodule
