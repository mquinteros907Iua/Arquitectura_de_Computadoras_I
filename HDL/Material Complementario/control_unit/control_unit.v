module instruction_cycle_fsm (
    input clk,
    input reset,
    output reg fetch,
    output reg decode,
    output reg execute
);

    // Definición de estados como parámetros
    parameter FETCH = 2'b00;
    parameter DECODE = 2'b01;
    parameter EXECUTE = 2'b10;

    reg [1:0] current_state, next_state;

    // Registro de estado
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= FETCH;
        else
            current_state <= next_state;
    end

    // Lógica de próximo estado
    always @(*) begin
        case (current_state)
            FETCH: next_state = DECODE;
            DECODE: next_state = EXECUTE;
            EXECUTE: next_state = FETCH;
            default: next_state = FETCH;
        endcase
    end

    // Señales de salida para controlar las etapas
    always @(*) begin
        fetch = 0;
        decode = 0;
        execute = 0;

        case (current_state)
            FETCH: fetch = 1;
            DECODE: decode = 1;
            EXECUTE: execute = 1;
        endcase
    end

endmodule
