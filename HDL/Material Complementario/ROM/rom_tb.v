`timescale 1ns/1ps
`include "rom.v"

module tb_rom_256x8;

    reg [7:0] addr;
    wire [7:0] data;

    // Instanciar ROM
    rom_256x8 rom_inst (
        .addr(addr),
        .data(data)
    );

    // Generar archivo VCD para GTKWave
    initial begin
        $dumpfile("rom_256x8.vcd");
        $dumpvars(0, tb_rom_256x8);
    end

    integer i;

    initial begin
        // Probamos leyendo varias direcciones
        for (i = 0; i < 10; i = i + 1) begin
            addr = i;
            #10;  // Esperar 10 unidades de tiempo
            $display("Direccion: %d, Dato leido: %h", addr, data);
        end

        #10;
        $finish;  // Terminar simulacion
    end

endmodule
