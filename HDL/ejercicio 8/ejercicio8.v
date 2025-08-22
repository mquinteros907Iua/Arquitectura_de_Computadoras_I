// Diseña un módulo Verilog para una memoria RAM simple y síncrona con capacidad parametrizable.
//La memoria debe tener:
//Entradas: reloj (clk), habilitación escritura (we), dirección (addr), dato de entrada (data_in).
//Salida: dato almacenado en la dirección indicada (data_out).
//Debe funcionar escritura en flanco positivo del reloj solo si we está activo.
module ejercicio8 #(  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 7,
  parameter MEM_DEPTH = 128
)(
  input clk,
  input we,
  input [ADDR_WIDTH-1:0] addr,
  input [DATA_WIDTH-1:0] data_in,
  output reg [DATA_WIDTH-1:0] data_out
);

  // Memoria declarada como arreglo de registros
  reg [DATA_WIDTH-1:0] mem [0:MEM_DEPTH-1];

  always @(posedge clk) begin
    if (we)
        mem[addr] <= data_in;      // Escritura
    data_out <= mem[addr];       // Lectura asincrónica (simulada en salida)
  end

endmodule