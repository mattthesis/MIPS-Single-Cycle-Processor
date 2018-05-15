`timescale 1ns / 1ps

module alu_testbench;

reg [31:0]x;
reg [31:0]y;
reg [3:0] alu_ctrl;
wire [31:0] result;
wire zero;

alu uut(.x(x), .y(y), .alu_ctrl(alu_ctrl), .result(result), .zero(zero));

initial begin
    $monitor(x, y, alu_ctrl, result, zero);
    
    //use these values for all operations
    x=32'd100;
    y=32'd20;
    
    //test AND
    alu_ctrl=4'b0000;
    #5
    //test OR
    alu_ctrl=4'b0001;
    #5
    //test addition
    alu_ctrl=4'b0010;
    #5
    //test subtraction
    alu_ctrl=4'b0110;
    #5
    //test multiplication
    alu_ctrl=4'b0011;
    #5
    //test division
    alu_ctrl=4'b1000;
    #5
    //test XOR
    alu_ctrl=4'b1001;
    #5
    //test SLT
    alu_ctrl=4'b0111;
    #5
    
//    //test zero condition
//    //x=32'd16;
//    y=32'd16;
//    alu_ctrl=4'b0110;
//    #5
    
    $finish;
    end
endmodule
