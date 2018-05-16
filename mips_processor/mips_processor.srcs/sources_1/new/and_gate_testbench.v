`timescale 1ns / 1ps

module and_gate_testbench;

reg x, y;
wire out;

and_gate uut(.x(x), .y(y), .z(out)); //unit under test

initial begin
    
    $dumpfile("and_gate.vcd");
    $dumpvars(0,and_gate_testbench);
    $monitor("At time %2t, x = %d y = %d out = %d", $time, x, y, out);
    
    //go through four cases for AND gate
    x=0; y=0;
    #5
    x=0; y=1;
    #5
    x=1; y=0;
    #5
    x=1; y=1;
    #5
    
    $finish; //end test    
end
endmodule
