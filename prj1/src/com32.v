module C32(c0,c1,c2,s,ca);

parameter size =32 ;
input[size-1:0] c0,c1,c2;
output[size-1:0]s,ca;
  
  assign s=c0^c1^c2;
  assign ca=c0&c1 | (c0 | c1)&c2;

endmodule