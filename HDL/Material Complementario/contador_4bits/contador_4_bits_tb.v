`timescale 1ns/1ps
`include "contador_4bits.v"

module testbench;
    reg clk;
    reg reset_n;
    wire [6:0] seg;
    wire [3:0] count_value;

    top_module dut (
        .clk(clk),
        .reset_n(reset_n),
        .seg(seg)
    );

    // Para exponer el count para la simulación
    assign count_value = dut.contador.count;

    initial begin
        clk = 0;
        reset_n = 0;
        #10 reset_n = 1;  // Quitar reset luego de 10 unidades

        #200 $finish;     // Simular durante 200 unidades
    end

    // Generar reloj 50 MHz (20 ns periodo)
    always #10 clk = ~clk;

    // Monitor o dump para GTKWave
    initial begin
        $dumpfile("contador_4bit.vcd");
        $dumpvars(0, testbench);
    end

endmodule
