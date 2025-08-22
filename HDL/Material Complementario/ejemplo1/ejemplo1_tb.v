`timescale 1ns / 1ps
`include "ejemplo1.v"

// Testbench
module ejemplo1_tb;

// declaracion de las señales de entrada y de salida
reg A; // entrada A
reg B; // entrada B
wire Y; // entrada Y

// Instanciación del módulo or_gate
or_gate uut (
    .A(A), // conecta A al modulo
    .B(B), // conecta B al modulo
    .Y(Y) // conecta Y al modulo
);

// Generación de combinaciones para las entradas
initial begin
  $dumpfile("ejemplo1_tb.vcd");
  $dumpvars(0,ejemplo1_tb);

  // Mostrar cabecera
  $display("Time | A | B | Y");
  $display("----------------");

  // Aplicación de las combinaciones
  A=0 ; B=0 ; #10; // Espera 10 unidades de tiempo
  $display("%0t     | %b | %b | %b", $time, A, B, Y);

  A=0 ; B=1 ; #10; // Espera 10 unidades de tiempo
  $display("%0t     | %b | %b | %b", $time, A, B, Y);

  A=1 ; B=0 ; #10; // Espera 10 unidades de tiempo
  $display("%0t     | %b | %b | %b", $time, A, B, Y);

  A=1 ; B=1 ; #10; // Espera 10 unidades de tiempo
  $display("%0t     | %b | %b | %b", $time, A, B, Y);

    // fin de la simulacion
    $stop;
end
endmodule
