//Diseña un flip-flop tipo D con reloj síncrono y señal de reset asíncrono activo alto. El flip-flop debe
//almacenar el valor de la entrada D en el flanco positivo del reloj.
module ejercicio4(input wire clk, input wire d, input wire reset, output reg q);
    always @(posedge clk or posedge reset) begin
        if (reset) 
            begin
                q <= 1'b0;      // reset asíncrono: Q -> 0
            end 
        else begin
            q <= d;         // en flanco positivo de clk: capturar D
        end
    end
endmodule 