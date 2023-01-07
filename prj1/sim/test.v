`timescale  1ns / 1ps

module tb_top;

// top Parameters
parameter PERIOD  = 10;


// top Inputs
reg   clk;
reg   rst_n;

// top Outputs
wire  [3:0]  led                           ;


always #(PERIOD/2)  clk=~clk;


initial
begin
    clk = 0;
    rst_n = 0;
    #(PERIOD*2) rst_n  =  1;
end

top  u_top (
    .clk                     ( clk          ),
    .rst_n                   ( rst_n        ),

    .led                     ( led    [3:0] )
);

initial
begin
    #100000000;
    $finish;
end

endmodule