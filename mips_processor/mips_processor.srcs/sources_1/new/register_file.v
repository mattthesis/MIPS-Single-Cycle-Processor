`timescale 1ns / 1ps

module register_file(input clk, input [4:0] read_reg1, input [4:0] read_reg2, input [4:0] write_reg, input write_en,
                        input [31:0] write_data, output [31:0] read_data1, output [31:0] read_data2);
                    
    reg [31:0] registers [0:31]; //create 32 32-bit registers
    
//dummy addition values used to test addition
//    initial begin
//        registers[8]= 4;
//        registers[14]= 4;
//    end
    
    //if write_en is set, update data on the rising edge of the clock
    //
    always@(posedge clk) begin
        registers[0]=32'b0; //for MIPS, the first register holds a 0 value ($zero)
        if(write_en) registers[write_reg] = write_data;
    end
    
    //since we are using muliplexers to handle outputs of the register file, 
    //both read_data signals can be set using constant assignments
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

endmodule
