`timescale 1ns / 1ps

module alu(input signed [31:0] x, input signed [31:0] y, input [3:0] alu_ctrl, output reg signed [31:0] result, output reg zero);
    
    //wire [31:0] sum; //create a reg for sum if addition is selected
    
    //thirty_two_bit_adder adder(.x(x), .y(y), .sum(sum)); //instantiate 32-bit adder
    
    always @ (alu_ctrl or x or y)
    begin
        case(alu_ctrl)
            4'b0000: result = x & y;
            4'b0001: result = x | y;
            4'b0010: result = x + y;
            4'b0110: result = x - y;
            4'b0011: result = x * y;
            4'b1000: result = x / y;
            4'b1001: result = x ^ y;
            4'b0111: if(x<y) result=1; else result = 0;        
            default: result = 32'bx; //output if no valid operation is chosen
        endcase 
        
        if(result==32'b0) zero=1; else zero=0;   
    end
endmodule
