`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio5.v"

// Testbench
module ejercicio5_tb;

// Declaración de las señales de entrada y de salida
reg clk;
reg reset;
wire [6:0] seg;    // Bus de 7 bits
wire [3:0] count;  // Bus de 4 bits

// Instanciación del módulo ejercicio5
ejercicio5 uut (
    .clk(clk), // Entrada de reloj
    .reset(reset), // Entrada de reseteo
    .seg(seg), // Salida
    .count(count)
);

// Generador de reloj
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Periodo de 10ns
end

// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio5_tb.vcd");
    $dumpvars(0, ejercicio5_tb);

    // Cabecera
    $display("Time | clk | reset | count | seg");
    $display("----------------------------------");

    // Aplicación de las combinaciones
    // Caso 1: Reset activo
    reset = 1; #10;
    $display ("%0t  | %b | %b | %b  | %b", $time, clk, count, reset, count);

    // Caso 2: Reset inactivo, conteo comienza
    reset = 0; #10;
    $display ("%0t  | %b | %b | %b  | %b", $time, clk, count, reset, count);

    // Caso 3: Conteo avanza
    #10;
    $display ("%0t  | %b | %b | %b  | %b", $time, clk, count, reset, count);

    // Caso 4: Conteo avanza
    #10;
    $display ("%0t  | %b | %b | %b  | %b", $time, clk, count, reset, count);
   
    $stop; // Detener la simulación
end
endmodule