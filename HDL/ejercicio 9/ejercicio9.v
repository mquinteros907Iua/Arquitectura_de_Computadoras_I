//Diseña una memoria ROM de 16 palabras de 8 bits cada una, que entrega el dato en la dirección
//addr. La memoria debe inicializarse con valores predefinidos en el bloque initial.
module ejercicio9 (
    input  [3:0] addr,  // Dirección de 4 bits (16 posiciones)
    output reg [7:0] data_out // Dato de salida de 8 bits
);

    // Memoria ROM de 16 palabras de 8 bits
    reg [7:0] mem [0:15];

    // Inicialización con valores predefinidos
    initial begin
        mem[0]  = 8'hAA;
        mem[1]  = 8'hBB;
        mem[2]  = 8'hCC;
        mem[3]  = 8'hDD;
        mem[4]  = 8'hEE;
        mem[5]  = 8'hFF;
        mem[6]  = 8'h11;
        mem[7]  = 8'h22;
        mem[8]  = 8'h33;
        mem[9]  = 8'h44;
        mem[10] = 8'h55;
        mem[11] = 8'h66;
        mem[12] = 8'h77;
        mem[13] = 8'h88;
        mem[14] = 8'h99;
        mem[15] = 8'h00;
    end

    // Lectura combinacional (ROM → salida)
    always @(*) begin
        data_out = mem[addr];
    end

endmodule
