`timescale 1ns / 1ps // 1 Nanosegundo / 1 Picosegundo
`include "ejercicio7.v"

// Testbench
module ejercicio7_tb;
reg clk;
reg reset;

// Instancia del procesador
ejercicio7 uut (
    .clk(clk),
    .reset(reset)
);

// Generador de reloj
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // reloj de 10ns
end

// Estímulos
initial begin
    $dumpfile("ejercicio7_tb.vcd");
    $dumpvars(0, ejercicio7_tb);

    reset = 1; #10;
    reset = 0;

    // Simular unos ciclos
    #100;

    $finish;
    end
endmodule