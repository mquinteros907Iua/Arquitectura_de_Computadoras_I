module clock_reset_gen (
    input wire clk_in,          // Reloj externo (rápido)
    input wire async_reset_n,   // Reset asíncrono activo bajo
    output reg clk_out,         // Reloj interno (dividido)
    output reg sync_reset       // Reset síncrono activo alto
);

    reg [3:0] counter;          // Contador de división

    // División de frecuencia de clk_in por 16 (ejemplo)
    always @(posedge clk_in or negedge async_reset_n) begin
        if (!async_reset_n) begin
            counter <= 0;
            clk_out <= 0;
            sync_reset <= 1;   // Reset síncrono activo en reset asíncrono
        end else begin
            counter <= counter + 1;

            // Generar clk_out con periodo 16 ciclos clk_in
            if (counter == 8) begin
                clk_out <= ~clk_out;
                sync_reset <= 0;  // Salir de reset síncrono después de comenzar
            end
        end
    end

endmodule
