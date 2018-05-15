`timescale 1ns / 1ps

module alu_ctrl(input [5:0] instr, input [1:0] alu_op, output reg [3:0] alu_ctrl);

always@(alu_op or instr) begin
    if(alu_op==2'b00) alu_ctrl=4'b0010; //alu_ctrl signal for add (used for lw & sw)
    else if(alu_op==2'b01) alu_ctrl=4'b0110; //alu_ctrl signal for subtract (used for beq)
    else if(alu_op==2'b10) begin //for all R-type instructions
        case(instr)
            6'b100000: alu_ctrl=4'b0010; //add
            6'b100010: alu_ctrl=4'b0110; //subtract
            6'b100100: alu_ctrl=4'b0000; //AND
            6'b100101: alu_ctrl=4'b0001; //OR
            6'b101010: alu_ctrl=4'b0111; //slt
            6'b100110: alu_ctrl=4'b1001; //XOR
            6'b011000: alu_ctrl=4'b0011; //multiply
            6'b011010: alu_ctrl=4'b1000; //divide
            default: alu_ctrl=4'b0010; //default to add
        endcase
    end
end
endmodule
