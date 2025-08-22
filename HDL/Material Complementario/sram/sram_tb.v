`timescale 1ns / 1ps
`include "sram.v"

module tb_sram;
  reg clk, we;
  reg [7:0] addr;
  reg [7:0] data_in;
  wire [7:0] data_out;

  sram ram_inst(
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
  );

  initial begin
    $dumpfile("sram.vcd");
    $dumpvars(0, tb_sram);

    clk = 0; we = 0; addr = 0; data_in = 0;
    #10;

    we = 1; addr = 8'h0A; data_in = 8'hF0;  // Escritura
    #10;

    addr = 8'h0A; we = 0;                   // Lectura
    #20;

    we = 1; addr = 8'h1F; data_in = 8'h55; // Otra escritura
    #10;

    addr = 8'h1F; we = 0;                   // Lectura
    #20;

    $finish;
  end

  always #5 clk = ~clk;

endmodule
