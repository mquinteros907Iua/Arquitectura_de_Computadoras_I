module io_interface (
    input wire clk,
    input wire [7:0] switches,   // Entradas (switches)
    output wire [7:0] leds,      // Salidas (LEDs)
    input wire uart_start,       // Señal para enviar dato UART
    input wire [7:0] uart_data,  // Dato a enviar por UART
    output wire uart_tx          // Línea serial UART
);

    assign leds = switches;      // Mapeo directo switches a LEDs

    uart_tx_module uart (
        .clk(clk),
        .start(uart_start),
        .data(uart_data),
        .tx(uart_tx)
    );

endmodule

// Transmisor UART simple 9600bps (asumiendo clk 1.8432 MHz para facilidad)
module uart_tx_module (
    input wire clk,
    input wire start,
    input wire [7:0] data,
    output reg tx
);

    parameter CLKS_PER_BIT = 192; // Para 1.8432 MHz clk / 9600 baud ≈ 192 clocks por bit

    reg [7:0] data_reg;
    reg [3:0] bit_idx;
    reg [7:0] clk_count;
    reg sending;

    initial tx = 1'b1; // Línea en reposo alta

    always @(posedge clk) begin
        if (start && !sending) begin
            sending <= 1;
            clk_count <= 0;
            bit_idx <= 0;
            data_reg <= data;
            tx <= 0;  // bit de start (bajo)
        end else if (sending) begin
            if (clk_count == CLKS_PER_BIT - 1) begin
                clk_count <= 0;
                bit_idx <= bit_idx + 1;

                if (bit_idx < 8) begin
                    tx <= data_reg[bit_idx];
                end else if (bit_idx == 8) begin
                    tx <= 1;  // bit de stop (alto)
                end else begin
                    sending <= 0;  // final de transmisión
                    tx <= 1;
                end
            end else begin
                clk_count <= clk_count + 1;
            end
        end
    end

endmodule
