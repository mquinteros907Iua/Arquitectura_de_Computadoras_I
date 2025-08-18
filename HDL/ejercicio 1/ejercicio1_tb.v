`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio1.v"

// Testbench
module ejercicio1_tb;

// Declaración de las señales de entrada y de salida
reg a; // Entrada A
reg b; // Entrada B
reg cin;
wire sum; // Salida sum
wire co;

// Instanciación del módulo or_gate
ejercicio1 uut (
    .a(a), // Conecta A al módulo
    .b(b), // Conecta B al módulo
    .cin(cin), // Conecta cin al módulo
    .sum(sum),
    .co(co)
);

// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio1_tb.vcd");
    $dumpvars(0, ejercicio1_tb);

    // Mostrar Cabecera 
    $display ("Time | A | B | Cin | Sum | Co");
    $display ("------------------------------");

    // Aplicación de las combinaciones
    a = 0; b = 0; cin = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 0; b = 1; cin = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 1; b = 0; cin = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 1; b = 1; cin = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 0; b = 0; cin = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 0; b = 1; cin = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 1; b = 0; cin = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    a = 1; b = 1; cin = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b  |  %b  |  %b ", $time, a, b, cin, sum, co);

    $stop; // Detener la simulación
end
endmodule