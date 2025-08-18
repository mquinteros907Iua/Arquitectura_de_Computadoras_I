`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio9.v"

// Testbench
module ejercicio9_tb;

    reg [3:0] addr;
    wire [7:0] data_out;

    ejercicio9 uut(
        addr,
        data_out
    );

  initial begin
    $dumpfile("ejercicio9_tb.vcd");
    $dumpvars(0, ejercicio9_tb);

    addr = 0; #10;
    addr = 1; #10;
    addr = 2; #10;
    addr = 3; #10;
    addr = 4; #10;
    addr = 5; #10;
    addr = 6; #10;
    addr = 7; #10;

    $finish;
  end

endmodule