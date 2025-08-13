/*Diseña un mini procesador simple con módulos integrados:
 Unidad Aritmético Lógica (ALU) de 4 bits (sumar, restar, AND, OR).
 Banco de registros con 4 registros de 4 bits.
 Unidad de control que tome instrucciones simples codificadas (ej. 2 bits opcode + registros).
 Ciclo básico de fetch-decode-execute simulado.
 Proporciona un banco de pruebas que simule una secuencia simple de instrucciones (ejemplo: cargar
 datos, operar y almacenar)*/
 module ejercicio7(
    input wire clk,
    input wire reset,
    input wire [1:0] opcode, // Código de operación
    input wire [3:0] reg_a, // Registro A
    input wire [3:0] reg_b, // Registro B
    output reg [3:0] result, // Resultado de la ALU
    output reg zero_flag // Flag de cero
 );
 