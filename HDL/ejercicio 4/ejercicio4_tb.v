`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio4.v"

// Testbench
module ejercicio4_tb;

// Declaración de las señales de entrada y de salida
reg clk;    
reg d;      
reg reset;  
wire q;  

// Instanciación del Multiplexor
ejercicio4 uut (
    .clk(clk), // Entrada de reloj
    .d(d), // Entrada d
    .reset(reset), // Entrada de reseteo
    .q(q) // Salida
);

// Generador de reloj
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Periodo de 10ns
end

// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio4_tb.vcd");
    $dumpvars(0, ejercicio4_tb);

    // Mostrar Cabecera 
    $display ("Time | clk | d | reset | q");
    $display ("--------------------------------");

    // Aplicación de las combinaciones
    //Caso 1
    clk = 0; d = 0; reset = 0; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 2
    clk = 0; d = 0; reset = 1; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 3
    clk = 0; d =1; reset = 0; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 4
    clk = 0; d = 1; reset = 1; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 5
    clk = 1; d = 0; reset = 0; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 6
    clk = 1; d = 0; reset = 1; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 7
    clk = 1; d = 1; reset = 0; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    //Caso 8
    clk = 1; d = 1; reset = 1; #10;  // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b | %b | %b", $time, clk, d, reset, q);

    $stop; // Detener la simulación
end
endmodule