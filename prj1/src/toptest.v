`timescale  1ns / 1ps
//`include "newtop.v"


module tp_top;
initial begin
  $dumpfile("newtop.v");
  $dumpvars(0);
end
reg[31:0] multiplicand;
reg[31:0] multiplier;
reg rst_n,clk;
wire[63:0] out;

parameter delay=100;
top m1(clk,rst_n,multiplicand,multiplier,out);
always #(delay) clk=~clk;
initial 
begin
    rst_n=1;clk=0;
    multiplicand=32'b0;
    multiplier=32'b0;
   #delay multiplicand=32'b11001101011101011011001111010001;multiplier=32'b11001101011101011011001111010011;
    #delay multiplicand=32'b1;multiplier=32'b01001101011101011011001111010001;
    #delay multiplicand=32'b1;multiplier=32'b01001101011101011011001111011011;
    //#delay multiplicand=32'b1;multiplier=32'b01001101011101011011001111010111;
    //#delay code=3'b100;bcode=32'b11001101011101011011001111010011;
   // #delay code=3'b110;bcode=32'b11001101011101011011001111010011;
    #delay $finish;
end
initial $monitor($time,,,"out=%b ",out);
endmodule