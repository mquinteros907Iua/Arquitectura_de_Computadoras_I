`timescale 1ns / 1ps
`include "alu_4bits.v"

module tb_alu_4bit;
  reg [3:0] a, b;
  reg [1:0] opcode;
  wire [3:0] result;
  wire zero;

  alu_4bit uut(a, b, opcode, result, zero);

  initial begin
    $dumpfile("alu_4bit.vcd");
    $dumpvars(0, tb_alu_4bit);

    a = 4'b0101; b = 4'b0011; opcode = 2'b00; #10; // suma
    opcode = 2'b01; #10; // resta
    opcode = 2'b10; #10; // AND
    opcode = 2'b11; #10; // OR

    a = 4'b0001; b = 4'b0001; opcode = 2'b01; #10; // resta que da cero

    $finish;
  end
endmodule
