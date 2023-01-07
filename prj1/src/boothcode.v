module boothcode(
    input[31:0] A,
    input[2:0] code,
    output reg[32:0] product,
    output reg[1:0] h,
    output reg s
);
always@(code[2:0] or A[31:0] )
begin
    case(code[2:0])
    3'b000: product={33{1'b0}};
    3'b001: product={A[31],A[31:0]};
    3'b010: product={A[31],A[31:0]};
    3'b011: product={A[31:0],1'b0};
    3'b100: product={~A[31:0],1'b1};
    3'b101: product={~A[31],~A[31:0]};
    3'b110: product={~A[31],~A[31:0]};
    3'b111: product={33{1'b0}};
    endcase
end
always@(code[2:0] or A[31])
begin
    case(code[2:0])
    3'b000: s=1'b1;
    3'b001: s=~A[31];
    3'b010: s=~A[31];
    3'b011: s=~A[31];
    3'b100: s=A[31];
    3'b101: s=A[31];
    3'b110: s=A[31];
    3'b111: s=1'b1;
    endcase
end
always@(code[2:0])
begin
    case(code[2:0])
    3'b000: h=2'b00;
    3'b001: h=2'b00;
    3'b010: h=2'b00;
    3'b011: h=2'b00;
    3'b100: h=2'b01;
    3'b101: h=2'b01;
    3'b110: h=2'b01;
    3'b111: h=2'b00;
    endcase
end
endmodule