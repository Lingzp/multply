`timescale  1ns / 1ps
`include "boothcode.v"
module tp_boothcode;
reg[2:0] code;
reg[31:0] bcode;
reg clr,clk;
wire[32:0] out;
wire[1:0] h;
wire s;
parameter delay=100;
boothcode m1(bcode,code,out,h,s);
always #(delay) clk=~clk;
initial 
begin
    clr=1;clk=0;
    code=3'b0;
    bcode=32'b0;
    #delay code=3'b001;bcode=32'b11001101011101011011001111010011;
    #delay code=3'b011;bcode=32'b11001101011101011011001111010011;
    #delay code=3'b101;bcode=32'b11001101011101011011001111010011;
    #delay code=3'b010;bcode=32'b11001101011101011011001111010011;
    #delay code=3'b100;bcode=32'b11001101011101011011001111010011;
    #delay code=3'b110;bcode=32'b11001101011101011011001111010011;
    #delay $finish;
end
initial $monitor($time,,,"out=%b h=%b s=%b",out,h,s);
endmodule