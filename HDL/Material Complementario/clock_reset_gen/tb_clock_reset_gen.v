`timescale 1ns/1ps
`include "clock_reset_gen.v"

module tb_clock_reset_gen;

    reg clk_in;
    reg async_reset_n;
    wire clk_out;
    wire sync_reset;

    clock_reset_gen uut (
        .clk_in(clk_in),
        .async_reset_n(async_reset_n),
        .clk_out(clk_out),
        .sync_reset(sync_reset)
    );

    // Generador de clk_in: periodo 10 unidades
    initial clk_in = 0;
    always #5 clk_in = ~clk_in;

    initial begin
        $dumpfile("clock_reset_gen.vcd");
        $dumpvars(0, tb_clock_reset_gen);

        // Reset asíncrono activo (bajo)
        async_reset_n = 0;
        #20;
        async_reset_n = 1;

        // Simular por 200 unidades de tiempo
        #200;

        $finish;
    end

endmodule
