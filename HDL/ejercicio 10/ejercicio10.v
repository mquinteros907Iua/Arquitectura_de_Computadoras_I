//Diseña un módulo Verilog llamado io_decoder que reciba una dirección de 8 bits addr, una señal de
//lectura (rd) y escritura (wr), y active señales de chip select (cs) para 4 dispositivos de E/S mapeados
//estas direcciones:
    //Dispositivo 0: direcciones 0x00 a 0x0F
    //Dispositivo 1: direcciones 0x10 a 0x1F
    //Dispositivo 2: direcciones 0x20 a 0x2F
    //Dispositivo 3: direcciones 0x30 a 0x3F
//El módulo debe generar señales de selección cs0, cs1, cs2 y cs3 activas altas sólo cuando la señal rd
//o wr esté activa y la dirección esté en el rango correspondiente.
//Luego, crea un ejemplo de placa lab_board que integre este decodificador con:
//Módulos dummy simulados para cada dispositivo (simplemente un registro que puede leer se/escribirse).
//Señales de reloj y reset.
//Puertos para interactuar con las señales de E/S.

module io_decoder (
    input  [7:0] addr,   // Dirección de 8 bits
    input        rd,     // Señal de lectura
    input        wr,     // Señal de escritura
    output reg   cs0,    // Chip select dispositivo 0
    output reg   cs1,    // Chip select dispositivo 1
    output reg   cs2,    // Chip select dispositivo 2
    output reg   cs3     // Chip select dispositivo 3
);

always @(*) begin
    // Inicializar todos en 0
    cs0 = 0; 
    cs1 = 0; 
    cs2 = 0; 
    cs3 = 0;

    // Activar solo si rd o wr está activo
    if (rd || wr) begin
        case (addr[7:4])   // Tomamos los 4 bits altos de la dirección
            4'h0: cs0 = 1; // 0x00 a 0x0F
            4'h1: cs1 = 1; // 0x10 a 0x1F
            4'h2: cs2 = 1; // 0x20 a 0x2F
            4'h3: cs3 = 1; // 0x30 a 0x3F
            default: ;     // Ningún dispositivo seleccionado
        endcase
    end
end

endmodule
