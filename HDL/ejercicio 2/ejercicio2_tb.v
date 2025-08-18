`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio2.v"

// Testbench
module ejercicio2_tb;

// Declaración de las señales de entrada y de salida
reg clk; // Entrada A
reg serial_in; // Entrada B
wire [3:0] q; // Salida

// Instanciación del módulo Shift_register
ejercicio2 uut (
    .clk(clk), // Conecta clk al módulo
    .serial_in(serial_in), // Conecta serial_in al módulo
    .q(q) // Conecta q al módulo
);


// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio2_tb.vcd");
    $dumpvars(0, ejercicio2_tb);

    // Mostrar Cabecera 
    $display ("Time | Serial_in | clk | Q");
    $display ("------------------------------");

    // Aplicación de las combinaciones
    serial_in = 0; clk = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 0; clk = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 1; clk = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 1; clk = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 0; clk = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 0; clk = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 1; clk = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 1; clk = 1; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);

    serial_in = 0; clk = 0; #10; // Espera 10 unidades de tiempo
    $display ("%0t  | %b | %b |  %b ", $time, serial_in, clk, q);
    

    $stop; // Detener la simulación
end
endmodule