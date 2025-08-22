`timescale 1ns/1ps
`include "pc_8bit.v"

module tb_pc_8bit;

    reg clk;
    reg reset;
    reg jump;
    reg [7:0] jump_addr;
    wire [7:0] pc;

    // Instancia del PC
    pc_8bit uut (
        .clk(clk),
        .reset(reset),
        .jump(jump),
        .jump_addr(jump_addr),
        .pc(pc)
    );

    // Generador de reloj (periodo 10)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_pc_8bit.vcd");
        $dumpvars(0, tb_pc_8bit);

        // Escenario de simulación
        reset = 1; jump = 0; jump_addr = 8'b0;
        #10;
        reset = 0;

        // Incremento secuencial por 10 ciclos
        repeat (10) @(posedge clk);

        // Salto a la dirección 0xA5
        jump = 1; jump_addr = 8'hA5;
        @(posedge clk);
        jump = 0;

        // Incremento secuencial por 5 ciclos después del salto
        repeat (5) @(posedge clk);

        // Reset
        reset = 1;
        @(posedge clk);
        reset = 0;

        // Incremento secuencial final 5 ciclos
        repeat (5) @(posedge clk);

        $finish;
    end

endmodule
