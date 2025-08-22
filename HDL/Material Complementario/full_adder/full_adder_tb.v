`timescale 1ns / 1ps
`include "full_adder.v"

// Testbench
module full_adder_tb;

// declaracion de las señales de entrada y de salida
  reg a, b, cin;
  wire sum, carry;

// Instanciación del módulo full_adder
  full_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );

// Generación de combinaciones para las entradas
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_tb);

    $monitor("At time %0t: a=%b, b=%b, cin=%b -> sum=%b, carry=%b", $time, a, b, cin, sum, carry);

    // Probar todas las combinaciones posibles de entradas
    a = 0; b = 0; cin = 0; #10;
    a = 0; b = 0; cin = 1; #10;
    a = 0; b = 1; cin = 0; #10;
    a = 0; b = 1; cin = 1; #10;
    a = 1; b = 0; cin = 0; #10;
    a = 1; b = 0; cin = 1; #10;
    a = 1; b = 1; cin = 0; #10;
    a = 1; b = 1; cin = 1; #10;

    $finish;  // Finaliza la simulación
  end
endmodule
