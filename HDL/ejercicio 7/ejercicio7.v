/*Diseña un mini procesador simple con módulos integrados:
 Unidad Aritmético Lógica (ALU) de 4 bits (sumar, restar, AND, OR).
 Banco de registros con 4 registros de 4 bits.
 Unidad de control que tome instrucciones simples codificadas (ej. 2 bits opcode + registros).
 Ciclo básico de fetch-decode-execute simulado.
 Proporciona un banco de pruebas que simule una secuencia simple de instrucciones (ejemplo: cargar
 datos, operar y almacenar)*/
 module ejercicio7(input wire clk, input wire reset
);
    // -----------------------------
    // Definición de la memoria de instrucciones (4 bits por instrucción)
    // Formato: [7:6]=opcode, [5:4]=reg_dest, [3:2]=reg_src1, [1:0]=reg_src2
    // -----------------------------
    reg [7:0] instr_mem [0:7]; 
    reg [2:0] pc;               // Program counter
    reg [7:0] instr;            // instrucción actual

    // -----------------------------
    // Banco de registros (4 registros de 4 bits)
    // -----------------------------
    reg [3:0] regs [0:3];

    // -----------------------------
    // Señales de control
    // -----------------------------
    reg [1:0] opcode;
    reg [1:0] rd, rs1, rs2;
    wire [3:0] alu_result;

    // -----------------------------
    // ALU
    // opcode:
    // 00 = SUMA
    // 01 = RESTA
    // 10 = AND
    // 11 = OR
    // -----------------------------
    alu4 alu_unit(
        .a(regs[rs1]),
        .b(regs[rs2]),
        .op(opcode),
        .y(alu_result)
    );

    // -----------------------------
    // Ciclo Fetch-Decode-Execute
    // -----------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;
            regs[0] <= 0; regs[1] <= 0; regs[2] <= 0; regs[3] <= 0;
        end else begin
            // Fetch
            instr <= instr_mem[pc];

            // Decode
            opcode <= instr[7:6];
            rd     <= instr[5:4];
            rs1    <= instr[3:2];
            rs2    <= instr[1:0];

            // Execute
            regs[rd] <= alu_result;

            // Incrementa PC
            pc <= pc + 1;
        end
    end

    // -----------------------------
    // Inicialización de instrucciones
    // -----------------------------
    initial begin
        // Formato: {opcode, rd, rs1, rs2}
        // Cargar en registros iniciales (para simular "carga de datos")
        regs[0] = 4'd3;  // R0 = 3
        regs[1] = 4'd5;  // R1 = 5
        regs[2] = 4'd7;  // R2 = 7
        regs[3] = 4'd0;  // R3 = 0

        // Instrucciones:
        // R3 = R0 + R1
        instr_mem[0] = {2'b00, 2'b11, 2'b00, 2'b01};  
        // R3 = R3 - R2
        instr_mem[1] = {2'b01, 2'b11, 2'b11, 2'b10};  
        // R0 = R1 AND R2
        instr_mem[2] = {2'b10, 2'b00, 2'b01, 2'b10};  
        // R1 = R0 OR R3
        instr_mem[3] = {2'b11, 2'b01, 2'b00, 2'b11};  
        // Fin de programa (relleno)
        instr_mem[4] = 8'b0;
        instr_mem[5] = 8'b0;
        instr_mem[6] = 8'b0;
        instr_mem[7] = 8'b0;
    end
endmodule

// ========================================
// Módulo ALU 4 bits
// ========================================
module alu4(
    input [3:0] a,
    input [3:0] b,
    input [1:0] op,
    output reg [3:0] y
);
    always @(*) begin
        case(op)
            2'b00: y = a + b;   // SUMA
            2'b01: y = a - b;   // RESTA
            2'b10: y = a & b;   // AND
            2'b11: y = a | b;   // OR
            default: y = 4'b0000;
        endcase
    end
endmodule