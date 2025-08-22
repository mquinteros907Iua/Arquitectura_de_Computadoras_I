module register_bank (
    input wire clk,
    input wire we,                // Write enable
    input wire [2:0] read_addr,   // Dirección de lectura (3 bits)
    input wire [2:0] write_addr,  // Dirección de escritura (3 bits)
    input wire [7:0] write_data,  // Datos de escritura
    output reg [7:0] read_data    // Datos de lectura
);

    reg [7:0] registers [0:7];    // Banco de 8 registros de 8 bits

    // Escritura síncrona
    always @(posedge clk) begin
        if (we) begin
            registers[write_addr] <= write_data;
        end
    end

    // Lectura combinacional (puede ser asincrónica)
    always @(*) begin
        read_data = registers[read_addr];
    end

endmodule
