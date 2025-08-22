`timescale 1ns / 1ps
`include "ram.v"

module tb_ram_simple;
  reg clk, we;
  reg [6:0] addr;
  reg [7:0] data_in;
  wire [7:0] data_out;

  ram_simple ram_inst(
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
  );

  initial begin
    $dumpfile("ram_simple.vcd");
    $dumpvars(0, tb_ram_simple);

    clk = 0; we = 0; addr = 0; data_in = 0;
    #5 we = 1; addr = 7'd10; data_in = 8'hAA;  // Escribir 0xAA en dirección 10
    #10 addr = 7'd20; data_in = 8'h55;        // Escribir 0x55 en dirección 20
    #10 we = 0; addr = 7'd10;                 // Leer dirección 10
    #10 addr = 7'd20;                         // Leer dirección 20
    #15 $finish;
  end

  always #5 clk = ~clk;  // Reloj con periodo 10

endmodule
