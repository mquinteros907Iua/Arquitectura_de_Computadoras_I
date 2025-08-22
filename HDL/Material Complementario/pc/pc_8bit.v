module pc_8bit (
    input wire clk,
    input wire reset,
    input wire jump,             // Señal para activar salto
    input wire [7:0] jump_addr,  // Dirección de salto
    output reg [7:0] pc          // Valor actual del contador
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 8'b0;  // Reinicia a 0
        end else if (jump) begin
            pc <= jump_addr;  // Salto a la nueva dirección
        end else begin
            pc <= pc + 1;      // Incremento secuencial
        end
    end

endmodule
