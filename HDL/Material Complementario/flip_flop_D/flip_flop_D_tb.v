`timescale 1ns / 1ps
`include "flip_flop_D.v"

module tb_d_flipflop;
  reg clk, reset, d;
  wire q;

  d_flipflop uut(clk, reset, d, q);

  initial begin
    $dumpfile("d_flipflop.vcd");
    $dumpvars(0, tb_d_flipflop);

    clk = 0; reset = 1; d = 0;
    #10 reset = 0;
    #10 d = 1;
    #20 d = 0;
    #20 d = 1;
    #20 reset = 1;
    #10 reset = 0;
    #20 $finish;
  end

  always #5 clk = ~clk;
endmodule
