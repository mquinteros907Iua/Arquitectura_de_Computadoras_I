`timescale 1ns/1ps
`include "control_unit.v"

module tb_instruction_cycle_fsm ();

    reg clk;
    reg reset;
    wire fetch;
    wire decode;
    wire execute;

    // Instancia del módulo FSM
    instruction_cycle_fsm uut (
        .clk(clk),
        .reset(reset),
        .fetch(fetch),
        .decode(decode),
        .execute(execute)
    );

    // Generador de reloj: 10ns periodo
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
    $dumpfile("control_unit_tb.vcd");
    $dumpvars(0, tb_instruction_cycle_fsm);
        // Inicialización
        reset = 1;
        #10;
        reset = 0;

        // Simular 20 ciclos de reloj para ver varias iteraciones de estados
        #200;

        // Finalizar simulación
        $stop;
    end

    // Monitoreo de señales
    initial begin
        $display("Time\t clk reset fetch decode execute");
        $monitor("%0t\t %b   %b     %b     %b      %b", $time, clk, reset, fetch, decode, execute);
    end

endmodule
