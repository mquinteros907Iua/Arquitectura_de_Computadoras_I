`timescale 1ns / 1ps
`include "fulladder4.v"

module fulladder4_tb;

  reg  [3:0] a;
  reg  [3:0] b;
  reg        ci;
  wire [3:0] s;
  wire       co;

  // Instancia del sumador de 4 bits
  fulladder4 uut (
    .a(a),
    .b(b),
    .ci(ci),
    .s(s),
    .co(co)
  );

   initial begin
    // Configuración para archivo de dump y variables para GTKWave
    $dumpfile("fulladder4.vcd");
    $dumpvars(0, fulladder4_tb);
  
    // Mostrar resultados al cambiar las señales
    $monitor("time=%0t: a=%b b=%b ci=%b -> s=%b co=%b", $time, a, b, ci, s, co);


    // Casos de prueba
    a = 4'd0; b = 4'd0; ci = 0; #10;
    a = 4'd1; b = 4'd1; ci = 0; #10;
    a = 4'd8; b = 4'd7; ci = 0; #10;
    a = 4'd15; b = 4'd15; ci = 1; #10;


    $finish;  // Finaliza simulación
  end

endmodule
