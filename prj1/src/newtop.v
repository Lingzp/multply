module top (
    input                  clk,
    input                  rst_n,
  //  input                  symbol_judge,
    input[31:0]            multiplicand,
    input[31:0]            multiplier   ,       
    output[63:0]      product
     
);
//wire symbol_judge;
//assign  symbol_judge =0;
wire[32:0] part_0,  part_1,  part_2,  part_3,  part_4,  part_5,
           part_6,  part_7,  part_8,  part_9,  part_10, part_11,
           part_12, part_13, part_14, part_15;
wire[30:0] part_16;
wire[1:0]  h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15;
wire[31:0] multiplicand_not;
wire[16:0] sign;
assign multiplicand_not=//(symbol_judge)
                       //?~multiplicand
                       multiplicand;

assign part_16[30:0] =// (symbol_judge) 
                           // ? multiplier[30:0]
                            31'b0;                 

boothcode boothcode0(.A(multiplicand_not),.code({multiplier[1:0],1'b0}),.h(h0),.s(sign[0]),.product(part_0));
boothcode boothcode1(.A(multiplicand_not),.code(multiplier[3:1]),.h(h1),.s(sign[1]),.product(part_1));
boothcode boothcode2(.A(multiplicand_not),.code(multiplier[5:3]),.h(h2),.s(sign[2]),.product(part_2));
boothcode boothcode3(.A(multiplicand_not),.code(multiplier[7:5]),.h(h3),.s(sign[3]),.product(part_3));
boothcode boothcode4(.A(multiplicand_not),.code(multiplier[9:7]),.h(h4),.s(sign[4]),.product(part_4));
boothcode boothcode5(.A(multiplicand_not),.code(multiplier[11:9]),.h(h5),.s(sign[5]),.product(part_5));
boothcode boothcode6(.A(multiplicand_not),.code(multiplier[13:11]),.h(h6),.s(sign[6]),.product(part_6));
boothcode boothcode7(.A(multiplicand_not),.code(multiplier[15:13]),.h(h7),.s(sign[7]),.product(part_7));
boothcode boothcode8(.A(multiplicand_not),.code(multiplier[17:15]),.h(h8),.s(sign[8]),.product(part_8));
boothcode boothcode9(.A(multiplicand_not),.code(multiplier[19:17]),.h(h9),.s(sign[9]),.product(part_9));
boothcode boothcode10(.A(multiplicand_not),.code(multiplier[21:19]),.h(h10),.s(sign[10]),.product(part_10));
boothcode boothcode11(.A(multiplicand_not),.code(multiplier[23:21]),.h(h11),.s(sign[11]),.product(part_11));
boothcode boothcode12(.A(multiplicand_not),.code(multiplier[25:23]),.h(h12),.s(sign[12]),.product(part_12));
boothcode boothcode13(.A(multiplicand_not),.code(multiplier[27:25]),.h(h13),.s(sign[13]),.product(part_13));
boothcode boothcode14(.A(multiplicand_not),.code(multiplier[29:27]),.h(h14),.s(sign[14]),.product(part_14));
boothcode boothcode15(.A(multiplicand_not),.code(multiplier[31:29]),.h(h15),.s(sign[15]),.product(part_15));

wire[35:0] l1_1_0, l1_1_1, l1_1_2,  l1_1_cin, l1_1_cout, l1_1_s, l1_1_ca;
wire[39:0] l1_2_0, l1_2_1, l1_2_2,  l1_2_cin, l1_2_cout, l1_2_s, l1_2_ca;
wire[39:0] l1_3_0, l1_3_1, l1_3_2,  l1_3_cin, l1_3_cout, l1_3_s, l1_3_ca;
wire[39:0] l1_4_0, l1_4_1, l1_4_2,  l1_4_cin, l1_4_cout, l1_4_s, l1_4_ca;
wire[39:0] l1_5_0, l1_5_1, l1_5_2,  l1_5_cin, l1_5_cout, l1_5_s, l1_5_ca;
wire[37:0] l1_6_0, l1_6_1, l1_6_2,  l1_6_cin, l1_6_cout, l1_6_s, l1_6_ca;

assign l1_1_0[35:0] = {5'b0,part_16[30:0]};
assign l1_1_1[35:0] ={sign[0],{2{!sign[0]}},part_0[32:0]};
assign l1_1_2[35:0] ={sign[1],part_1[32:0],h0[1:0]};


assign l1_2_0[39:0] = {4'b0,sign[2],part_2[32:0],h1[1:0]};
assign l1_2_1[39:0] ={2'b0,sign[3],part_3[32:0],h2[1:0],2'b0};
assign l1_2_2[39:0] ={sign[4],part_4[32:0],h3[1:0],4'b0};


assign l1_3_0[39:0] = {4'b0,sign[5],part_5[32:0],h4[1:0]};
assign l1_3_1[39:0] ={2'b0,sign[6],part_6[32:0],h5[1:0],2'b0};
assign l1_3_2[39:0] ={sign[7],part_7[32:0],h6[1:0],4'b0};


assign l1_4_0[39:0] = {4'b0,sign[8],part_8[32:0],h7[1:0]};
assign l1_4_1[39:0] ={2'b0,sign[9],part_9[32:0],h8[1:0],2'b0};
assign l1_4_2[39:0] ={sign[10],part_10[32:0],h9[1:0],4'b0};

assign l1_5_0[39:0] = {4'b0,sign[11],part_11[32:0],h10[1:0]};
assign l1_5_1[39:0] ={2'b0,sign[12],part_12[32:0],h11[1:0],2'b0};
assign l1_5_2[39:0] ={sign[13],part_13[32:0],h12[1:0],4'b0};

assign l1_6_0[37:0] = {2'b0,sign[14],part_14[32:0],h13[1:0]};
assign l1_6_1[37:0] ={sign[15],part_15[32:0],h14[1:0],2'b0};
assign l1_6_2[37:0] ={{14{2'b01}},4'b0,h15[1:0],4'b0};




C32 #(36) l1_1(.c0(l1_1_0), .c1(l1_1_1), .c2(l1_1_2),  .s(l1_1_s), .ca(l1_1_ca));
C32 #(40) l1_2(.c0(l1_2_0), .c1(l1_2_1), .c2(l1_2_2),  .s(l1_2_s), .ca(l1_2_ca));
C32 #(40) l1_3(.c0(l1_3_0), .c1(l1_3_1), .c2(l1_3_2),  .s(l1_3_s), .ca(l1_3_ca));
C32 #(40) l1_4(.c0(l1_4_0), .c1(l1_4_1), .c2(l1_4_2),  .s(l1_4_s), .ca(l1_4_ca));
C32 #(40) l1_5(.c0(l1_5_0), .c1(l1_5_1), .c2(l1_5_2),  .s(l1_5_s), .ca(l1_5_ca));
C32 #(38) l1_6(.c0(l1_6_0), .c1(l1_6_1), .c2(l1_6_2),  .s(l1_6_s), .ca(l1_6_ca));


reg[35:0] l1_s1_reg,l1_c1_reg;
reg[39:0] l1_s2_reg,l1_c2_reg;
reg[39:0] l1_s3_reg,l1_c3_reg;
reg[39:0] l1_s4_reg,l1_c4_reg;
reg[39:0] l1_s5_reg,l1_c5_reg;
reg[37:0] l1_s6_reg,l1_c6_reg;

always@(posedge clk or posedge rst_n)
begin
    if(!rst_n)
    begin
        l1_s1_reg <= 36'b0;
        l1_c1_reg <= 36'b0;
        l1_s2_reg <= 40'b0;
        l1_c2_reg <= 40'b0;
        l1_s3_reg <= 40'b0;
        l1_c3_reg <= 40'b0;
        l1_s4_reg <= 40'b0;
        l1_c4_reg <= 40'b0;
        l1_s5_reg <= 40'b0;
        l1_c5_reg <= 40'b0;
        l1_s6_reg <= 38'b0;
        l1_c6_reg <= 38'b0;  
    end
    else
    begin
        l1_s1_reg <= l1_1_s;
        l1_c1_reg <= l1_1_ca;
        l1_s2_reg <= l1_2_s;
        l1_c2_reg <= l1_2_ca;
        l1_s3_reg <= l1_3_s;
        l1_c3_reg <= l1_3_ca;
        l1_s4_reg <= l1_4_s;
        l1_c4_reg <= l1_4_ca;
        l1_s5_reg <= l1_5_s;
        l1_c5_reg <= l1_5_ca;
        l1_s6_reg <= l1_6_s;
        l1_c6_reg <= l1_6_ca;
    end
end

wire[42:0] l2_1_0, l2_1_1, l2_1_2, l2_1_3, l2_1_cin, l2_1_cout, l2_1_s, l2_1_ca;
wire[46:0] l2_2_0, l2_2_1, l2_2_2, l2_2_3, l2_2_cin, l2_2_cout, l2_2_s, l2_2_ca;
wire[43:0] l2_3_0, l2_3_1, l2_3_2, l2_3_3, l2_3_cin, l2_3_cout, l2_3_s, l2_3_ca;

assign l2_1_0[42:0] = {7'b0,l1_s1_reg[35:0]};
assign l2_1_1[42:0] ={6'b0,l1_c1_reg[35:0],1'b0};
assign l2_1_2[42:0] ={1'b0,l1_s2_reg[39:0],2'b0};
assign l2_1_3[42:0] ={l1_c2_reg[39:0],3'b0};
assign l2_1_cin[42:0]={l2_1_cout[41:0],1'b0};

assign l2_2_0[46:0] = {7'b0,l1_s3_reg[39:0]};
assign l2_2_1[46:0] ={6'b0,l1_c3_reg[39:0],1'b0};
assign l2_2_2[46:0] ={1'b0,l1_s4_reg[39:0],6'b0};
assign l2_2_3[46:0] ={l1_c4_reg[39:0],7'b0};
assign l2_2_cin[46:0]={l2_2_cout[45:0],1'b0};

assign l2_3_0[43:0] = {4'b0,l1_s5_reg[39:0]};
assign l2_3_1[43:0] ={3'b0,l1_c5_reg[39:0],1'b0};
assign l2_3_2[43:0] ={l1_s6_reg[37:0],6'b0};
assign l2_3_3[43:0] ={l1_c6_reg[36:0],7'b0};
assign l2_3_cin[43:0]={l2_3_cout[42:0],1'b0};

C42 #(43) l2_1(.c1(l2_1_0), .c2(l2_1_1), .c3(l2_1_2), .c4(l2_1_3), .cin(l2_1_cin), .cout(l2_1_cout), .s(l2_1_s), .ca(l2_1_ca));
C42 #(47) l2_2(.c1(l2_2_0), .c2(l2_2_1), .c3(l2_2_2), .c4(l2_2_3), .cin(l2_2_cin), .cout(l2_2_cout), .s(l2_2_s), .ca(l2_2_ca));
C42 #(44) l2_3(.c1(l2_3_0), .c2(l2_3_1), .c3(l2_3_2), .c4(l2_3_3), .cin(l2_3_cin), .cout(l2_3_cout), .s(l2_3_s), .ca(l2_3_ca));

reg[42:0] l2_s1_reg,l2_c1_reg;
reg[46:0] l2_s2_reg,l2_c2_reg;
reg[43:0] l2_s3_reg,l2_c3_reg;

always@(posedge clk or posedge rst_n)
begin
    if(!rst_n)
    begin
        l2_s1_reg <= 43'b0;
        l2_c1_reg <= 43'b0;
        l2_s2_reg <= 47'b0;
        l2_c2_reg <= 47'b0;
        l2_s3_reg <= 44'b0;
        l2_c3_reg <= 44'b0;
    
    end
    else
    begin
        l2_s1_reg <= l2_1_s;
        l2_c1_reg <= l2_1_ca;
        l2_s2_reg <= l2_2_s;
        l2_c2_reg <= l2_2_ca;
        l2_s3_reg <= l2_3_s;
        l2_c3_reg <= l2_3_ca;
    end
end

wire[54:0] l3_1_0,l3_1_1,l3_1_2,l3_1_s,l3_1_ca;
wire[54:0] l3_2_0,l3_2_1,l3_2_2,l3_2_s,l3_2_ca;

assign l3_1_0 ={12'b0,l2_s1_reg[42:0]};
assign l3_1_1 ={11'b0,l2_c1_reg[42:0],1'b0};
assign l3_1_2 ={l2_s2_reg[46:0],8'b0};

assign l3_2_0 ={8'b0,l2_c2_reg[46:0]} ;
assign l3_2_1 ={l2_s3_reg[43:0],11'b0};
assign l3_2_2 ={l2_c3_reg[42:0],12'b0} ;

C32 #(55) l3_1(.c0(l3_1_0), .c1(l3_1_1), .c2(l3_1_2), .s(l3_1_s), .ca(l3_1_ca));
C32 #(55) l3_2(.c0(l3_2_0), .c1(l3_2_1), .c2(l3_2_2), .s(l3_2_s), .ca(l3_2_ca));

reg[54:0] l3_s1_reg,l3_c1_reg;
reg[54:0] l3_s2_reg,l3_c2_reg;
 
always@(posedge clk or posedge rst_n)
begin
    if(!rst_n)
    begin
        l3_s1_reg <= 55'b0;
        l3_c1_reg <= 55'b0;
        l3_s2_reg <= 55'b0;
        l3_c2_reg <= 55'b0;
        
    end
    else
    begin
        l3_s1_reg <= l3_1_s;
        l3_c1_reg <= l3_1_ca;
        l3_s2_reg <= l3_2_s;
        l3_c2_reg <= l3_2_ca;
        
    end
end

wire[63:0] l4_1_0,l4_1_1,l4_1_2,l4_1_3,l4_1_s,l4_1_ca,l4_1_cin,l4_1_cout;

assign l4_1_0 ={9'b0,l3_s1_reg[54:0]};
assign l4_1_1 ={8'b0,l3_c1_reg[54:0],1'b0};
assign l4_1_2 ={l3_s2_reg[54:0],9'b0};
assign l4_1_3={l3_c2_reg[53:0],10'b0};
assign l4_1_cin ={l4_1_cout[62:0],1'b0} ;

C42 #(64) l4(.c1(l4_1_0), .c2(l4_1_1), .c3(l4_1_2), .c4(l4_1_3), .cin(l4_1_cin), .cout(l4_1_cout), .s(l4_1_s), .ca(l4_1_ca));

reg[63:0] s,c;
always@(posedge clk or posedge rst_n)
begin
    if(!rst_n)
    begin
       s <= 64'b0;
        c <= 64'b0;    
    end
    else
    begin
        s <= l4_1_s;
        c <= l4_1_ca;
    end
end
assign  product =s[63:0]+{c[62:0],1'b0} ;
endmodule