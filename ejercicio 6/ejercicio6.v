//Diseña una ALU de 4 bits que realice las operaciones básicas: suma, resta, AND, OR entre dos
//operandos de 4 bits (a y b), seleccionando la operación mediante una señal de 2 bits opcode. Salida
//result y flag de cero zero.

module ejercicio6 (input wire [3:0] a, input wire [3:0] b, input wire [1:0] opcode, output reg[3:0]result, output reg zero);
always @(*)begin
    case (opcode)
        2'b00: result = a + b; // Suma
        2'b01: result = a - b; // Resta
        2'b10: result = a & b; // AND
        2'b11: result = a | b; // OR
        default: result = 4'b0000; // Valor por defecto
    endcase
    
    // Actualizar el flag de cero
    zero = (result == 4'b0000); //si result es cero -> zero = 1, si result != 0 -> zero = 0
end
endmodule