`timescale 1ns/1ps
`include "mux_2a1.v"
`include "mux_4a1.v"

module tb_mux;

    reg [7:0] in0, in1, in2, in3;
    reg sel2;           // Selección para mux 2:1
    reg [1:0] sel4;     // Selección para mux 4:1

    wire [7:0] out2;
    wire [7:0] out4;

    // Instanciación de los multiplexores
    mux2to1_8bit mux2 (
        .in0(in0),
        .in1(in1),
        .sel(sel2),
        .out(out2)
    );

    mux4to1_8bit mux4 (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel4),
        .out(out4)
    );

    initial begin
        $dumpfile("mux_test.vcd");  // Archivo VCD para GTKWave
        $dumpvars(0, tb_mux);

        // Inicializar entradas
        in0 = 8'hAA;  // 1010_1010
        in1 = 8'h55;  // 0101_0101
        in2 = 8'hFF;  // 1111_1111
        in3 = 8'h00;  // 0000_0000

        // Probar mux 2:1
        sel2 = 0;
        #10;
        sel2 = 1;
        #10;

        // Probar mux 4:1
        sel4 = 2'b00;
        #10;
        sel4 = 2'b01;
        #10;
        sel4 = 2'b10;
        #10;
        sel4 = 2'b11;
        #10;

        $finish;
    end

endmodule
