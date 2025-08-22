`timescale 1ns/1ps
`include "io_interface.v"

module tb_io_interface;

    reg clk;
    reg [7:0] switches;
    reg uart_start;
    reg [7:0] uart_data;
    wire [7:0] leds;
    wire uart_tx;

    io_interface uut (
        .clk(clk),
        .switches(switches),
        .leds(leds),
        .uart_start(uart_start),
        .uart_data(uart_data),
        .uart_tx(uart_tx)
    );

    initial clk = 0;
    always #1 clk = ~clk;   // Reloj ~1.8432 MHz (aprox, para UART)

    initial begin
        $dumpfile("io_interface.vcd");
        $dumpvars(0, tb_io_interface);

        switches = 8'b00000000;
        uart_start = 0;
        uart_data = 8'h00;

        #10;
        switches = 8'b10101010; // Cambiar switches
        #20;
        switches = 8'b11001100;
        #20;

        // Enviar byte UART
        uart_data = 8'h55;
        uart_start = 1;
        #2;
        uart_start = 0;

        // Esperar suficiente tiempo para transmisión UART
        #4000;

        // Enviar otro byte UART
        uart_data = 8'hA7;
        uart_start = 1;
        #2;
        uart_start = 0;

        #4000;

        $finish;
    end

endmodule
