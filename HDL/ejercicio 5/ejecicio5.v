//Diseña un sistema digital que integre un contador binario de 4 bits y un módulo convertidor binario
//a display de 7 segmentos para mostrar el conteo. El sistema debe contar de 0 a 15 con reloj síncrono y
//reset asíncrono. El display debe actualizarse con el valor actual del contador. Simula la funcionalidad
// completa mostrando señales internas y la salida para el display en GTKWave.

// Módulo principal que conecta contador y display
module ejercicio5 (input clk, input reset, output [6:0] seg, output [3:0] count);
    wire [3:0] q;
    contador4b u1(.clk(clk), .reset(reset), .q(q));
    bin7seg   u2(.bin(q), .seg(seg));
    assign count = q;
endmodule

// Módulo contador de 4 bits con reset asíncrono
module contador4b(input clk, input reset, output reg [3:0] q);
always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else
        q <= q + 1;
end
endmodule

// Módulo convertidor binario a display de 7 segmentos (común ánodo)
module bin7seg(input [3:0] bin, output reg [6:0] seg);
always @(*) begin
    case (bin)
        4'h0: seg = 7'b1111110;
        4'h1: seg = 7'b0110000;
        4'h2: seg = 7'b1101101;
        4'h3: seg = 7'b1111001;
        4'h4: seg = 7'b0110011;
        4'h5: seg = 7'b1011011;
        4'h6: seg = 7'b1011111;
        4'h7: seg = 7'b1110000;
        4'h8: seg = 7'b1111111;
        4'h9: seg = 7'b1111011;
        4'hA: seg = 7'b1110111;
        4'hB: seg = 7'b0011111;
        4'hC: seg = 7'b1001110;
        4'hD: seg = 7'b0111101;
        4'hE: seg = 7'b1001111;
        4'hF: seg = 7'b1000111;
        default: seg = 7'b0000000;
    endcase
end
endmodule

