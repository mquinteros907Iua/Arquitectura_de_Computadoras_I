`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio6.v"

// Testbench
module ejercicio6_tb;

// Declaración de las señales de entrada y de salida
reg [3:0] a;
reg [3:0] b;
reg [1:0] opcode;
wire [3:0] result; // Salida
wire zero;  // Flag de cero

// Instanciación del módulo ejercicio6
ejercicio6 uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result),
    .zero(zero)
);

// Generaciòn de combinaciones para las entradas
initial begin
    $dumpfile("ejercicio6_tb.vcd");
    $dumpvars(0, ejercicio6_tb);

    $display("Time |   a   |   b   | opcode | result | zero");
    $display("-----------------------------------------------");

    // Aplicación de combinaciones
    a = 4'b0000; b = 4'b0000; opcode = 2'b00; #10; $display("%4dns | %b | %b |  %b   | %b    | %b", $time, a, b, opcode, result, zero);
    a = 4'b0011; b = 4'b0011; opcode = 2'b01; #10; $display("%4dns | %b | %b |  %b   | %b    | %b", $time, a, b, opcode, result, zero);
    a = 4'b0101; b = 4'b0011; opcode = 2'b00; #10; $display("%4dns | %b | %b |  %b   | %b    | %b", $time, a, b, opcode, result, zero);
    a = 4'b1100; b = 4'b1010; opcode = 2'b10; #10; $display("%4dns | %b | %b |  %b   | %b    | %b", $time, a, b, opcode, result, zero);
    a = 4'b1111; b = 4'b0000; opcode = 2'b11; #10; $display("%4dns | %b | %b |  %b   | %b    | %b", $time, a, b, opcode, result, zero);
    
    $stop; // Detener la simulación
end
endmodule