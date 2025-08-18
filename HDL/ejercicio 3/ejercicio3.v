// Realiza un módulo que implemente un multiplexor 4 a 1 con entradas de datos de 8 bits (data0 a
// data3), señal de selección sel de 2 bits y salida y de 8 bits, usando descripción en nivel comporta
//miento

module ejercicio3 (
    input wire [7:0] data0,
    input wire [7:0] data1,
    input wire [7:0] data2,
    input wire [7:0] data3,
    input wire [1:0] sel,
    output reg [7:0] y
);
    always @(*) begin
        case (sel)
            2'b00: y = data0;
            2'b01: y = data1;
            2'b10: y = data2;
            2'b11: y = data3;
            default: y = 8'b0;
        endcase
    end
endmodule
