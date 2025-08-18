`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio8.v"

// Testbench
module ejercicio8_tb;

// Declaración de las señales de entrada y de salida
reg clk, we;
reg [6:0] addr;
reg [7:0] data_in;
wire [7:0] data_out;

// Instanciación del Multiplexor
ejercicio8 uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

// Generador de reloj
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Periodo de 10ns
end

// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio8_tb.vcd");
    $dumpvars(0, ejercicio8_tb);

    clk = 0; we = 0; addr = 0; data_in = 0;
    #5 we = 1; addr = 7'd10; data_in = 8'hAA;  // Escribir 0xAA en dirección 10
    #10 addr = 7'd20; data_in = 8'h55;        // Escribir 0x55 en dirección 20
    #10 we = 0; addr = 7'd10;                 // Leer dirección 10
    #10 addr = 7'd20;                         // Leer dirección 20
    #15 $stop; // Detener la simulación
end
endmodule