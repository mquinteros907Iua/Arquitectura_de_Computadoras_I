module contador_4bit(
    input clk,            // Reloj síncrono
    input reset_n,        // Reset asíncrono activo en bajo
    output reg [3:0] count
);
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= 4'b0000;
        else begin
            if (count == 4'b1111)
                count <= 4'b0000;
            else
                count <= count + 1;
        end
    end
endmodule

module bin2seg7(
    input [3:0] bin,
    output reg [6:0] seg  // Display de 7 segmentos (abcdefg)
);
    always @(*) begin
        case(bin)
            4'd0: seg = 7'b1000000; // 0
            4'd1: seg = 7'b1111001; // 1
            4'd2: seg = 7'b0100100; // 2
            4'd3: seg = 7'b0110000; // 3
            4'd4: seg = 7'b0011001; // 4
            4'd5: seg = 7'b0010010; // 5
            4'd6: seg = 7'b0000010; // 6
            4'd7: seg = 7'b1111000; // 7
            4'd8: seg = 7'b0000000; // 8
            4'd9: seg = 7'b0010000; // 9
            4'd10: seg = 7'b0001000; // A
            4'd11: seg = 7'b0000011; // b
            4'd12: seg = 7'b1000110; // C
            4'd13: seg = 7'b0100001; // d
            4'd14: seg = 7'b0000110; // E
            4'd15: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // apagado
        endcase
    end
endmodule

// Módulo top que integra contador y display
module top_module(
    input clk,
    input reset_n,
    output [6:0] seg
);
    wire [3:0] count_value;

    contador_4bit contador(
        .clk(clk),
        .reset_n(reset_n),
        .count(count_value)
    );

    bin2seg7 display(
        .bin(count_value),
        .seg(seg)
    );
endmodule
