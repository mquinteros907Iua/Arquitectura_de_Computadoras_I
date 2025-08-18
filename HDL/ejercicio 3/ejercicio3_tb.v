`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio3.v"

// Testbench
module ejercicio3_tb;

// Declaración de las señales de entrada y de salida
reg [7:0] data0;
reg [7:0] data1;
reg [7:0] data2;
reg [7:0] data3;
reg [1:0] sel; // Entrada de selección
wire [7:0] y; // Salida

// Instanciación del módulo Shift_register
ejercicio3 uut (
    .data0(data0),
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .sel(sel),
    .y(y)
);

// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio3_tb.vcd");
    $dumpvars(0, ejercicio3_tb);

    //Mostrar Cabecera
    $display ("Time | Data0 | Data1 | Data2 | Data3 | Sel | Y");
    $display ("---------------------------------------------");

    // Aplicación de las combinaciones
    // Caso 1
    data0 = 8'b00000001; data1 = 8'b00000010; data2 = 8'b00000100; data3 = 8'b00001000; sel = 2'b00; #10;
    $display ("%0t  | %b | %b | %b | %b | %b  | %b", $time, data0, data1, data2, data3, sel, y);

    // Caso 2
    sel = 2'b01; #10;
    $display ("%0t  | %b | %b | %b | %b | %b  | %b", $time, data0, data1, data2, data3, sel, y);

    // Caso 3
    sel = 2'b10; #10;
    $display ("%0t  | %b | %b | %b | %b | %b  | %b", $time, data0, data1, data2, data3, sel, y);

    // Caso 4
    sel = 2'b11; #10;
    $display ("%0t  | %b | %b | %b | %b | %b  | %b", $time, data0, data1, data2, data3, sel, y);

    $stop; // Detener la simulación
end
endmodule