module C42(c1,c2,c3,c4,cin, cout,s,ca);


parameter  size=32 ;
wire[size-1:0] p1,p2,p3;
input[size-1:0] c1,c2,c3,c4,cin;
output[size-1:0] cout,s,ca;
assign p1=c1^c2;
assign p2=c3^c4;
assign p3=p1^p2;
assign s=p3^cin;
assign ca=p3&cin | (~p3)&c4;
assign cout=p1&c3 | (~p1)&c1;


endmodule