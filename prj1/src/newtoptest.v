`timescale 1ns / 1ps

`define CLK_PERIOD 3.60

`define HALF_CLK_PERIOD 1.80
`define INIT_TIME 3.60


module Multiplier_Wrapper_tb;

  reg clock = 0;
  reg reset = 1;

always #`HALF_CLK_PERIOD clock = ~clock;

initial begin
  $dumpfile("newtop.v");
  $dumpvars(0);
end


  wire signed [63:0] m;
  reg signed [31:0] a,b;
  wire signed [63:0] golden_model;

 // reg in_valid;
  //wire out_valid;

  reg signed [31:0] a_1p,b_1p,a_2p,b_2p,a_3p,b_3p,a_4p,b_4p;
  reg signed [63:0] golden_model_1p;
  reg signed [63:0] golden_model_2p;
   reg signed [63:0] golden_model_3p;
  reg signed [63:0] golden_model_4p;
  assign golden_model = $signed(a) *  $signed(b);

  always @ (posedge clock) begin
    if(!reset) begin
      golden_model_1p <= 1'b0;
      golden_model_2p <= 1'b0;
      golden_model_3p <= 1'b0;
      a_1p <= 'd0;
      a_2p <= 'd0;
      b_1p <= 'd0;
      b_2p <= 'd0;
     a_3p <= 'd0;
      b_3p <= 'd0; 
     a_4p <= 'd0;
     b_4p <= 'd0;
    end
    else begin
      golden_model_1p <= golden_model;
      golden_model_2p <= golden_model_1p;
           golden_model_3p <= golden_model_2p;
             golden_model_4p <= golden_model_3p;
      a_1p <= a; a_2p <= a_1p;a_3p <= a_2p; a_4p <= a_3p;
      b_1p <= b; b_2p <= b_1p;b_3p <= b_2p;b_4p <= b_3p;
    end
end

  top dut(
    .clk(clock),
    .rst_n(reset),
   // .in_valid(in_valid),
    .multiplier(a),
    .multiplicand(b),
    .product(m)
  //  .out_valid(out_valid)
  );

  parameter LIMIT = 32'h7fff_ffff;

  SVA #(.BEGINTIME(`CLK_PERIOD)) a0(
    .a(a),
    .b(b),
    .m(m),
    .golden_model(golden_model_2p)
 //   .valid(out_valid)
  );

  initial begin
    a=0; b=0;// in_valid = 0;
   // #`INIT_TIME reset = 1'b0;
    $display($time, " Starting the Simulation");
    #(10*`CLK_PERIOD) 
    repeat(100) begin
      #(1*`CLK_PERIOD) 
      a= $random; 
      b= $random;
      //in_valid = 1;
    end
    #(10*`CLK_PERIOD);
    $display("Simulation is successful!");
    #(1*`CLK_PERIOD);
    $finish;
end
 
  initial
    $monitor("A=%d, B=%d, M=%d, golden_model=%d",$signed(a_4p),$signed(b_4p),$signed(m),$signed(golden_model_4p));
  
endmodule

module SVA #(parameter BEGINTIME=10)
  (a, b, m, golden_model);
  input signed [63:0] m;
  input signed [31:0] a,b;
  input signed [63:0] golden_model;
 // input valid;

  wire test;
  assign test = m == golden_model;

  initial begin
    #BEGINTIME;
   // if(valid) begin
      //if (test !== 1) begin
        $display("SVAION FAILED in A=%d, B=%d, M=%d, golden_model=%d",a,b,m,golden_model);
        $finish;
  //    end      
   // end

  end
endmodule
