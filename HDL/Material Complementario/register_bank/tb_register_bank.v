`timescale 1ns/1ps
`include "register_bank.v"

module tb_register_bank;

    reg clk;
    reg we;
    reg [2:0] read_addr;
    reg [2:0] write_addr;
    reg [7:0] write_data;
    wire [7:0] read_data;

    register_bank uut (
        .clk(clk),
        .we(we),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Generador de reloj período 10
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_bank.vcd");
        $dumpvars(0, tb_register_bank);

        we = 0; write_addr = 0; write_data = 8'b0; read_addr = 0;

        #10;
        // Escribir 0xAA en registro 3
        we = 1; write_addr = 3; write_data = 8'hAA;
        #10;   // Ciclo reloj
        we = 0;
        #10;

        // Leer registro 3
        read_addr = 3;
        #10;

        // Escribir 0x55 en registro 5
        we = 1; write_addr = 5; write_data = 8'h55;
        #10;
        we = 0;
        #10;

        // Leer registro 5
        read_addr = 5;
        #10;

        // Leer registro 0, que debe ser 0
        read_addr = 0;
        #10;

        // Escribir 0xFF en registro 0
        we = 1; write_addr = 0; write_data = 8'hFF;
        #10;
        we = 0;
        #10;

        // Leer registro 0
        read_addr = 0;
        #10;

        $finish;
    end
endmodule
