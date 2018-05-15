`timescale 1ns / 1ps

module clock(output reg clk);

    //generate clock signal
    always begin
        clk=0;
        #10;
        clk=1;
        #10;
    end

endmodule
