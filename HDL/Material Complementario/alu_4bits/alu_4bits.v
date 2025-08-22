module alu_4bit(
  input [3:0] a,
  input [3:0] b,
  input [1:0] opcode,
  output reg [3:0] result,
  output zero
);

  always @(*) begin
    case (opcode)
      2'b00: result = a + b;         // Suma
      2'b01: result = a - b;         // Resta
      2'b10: result = a & b;         // AND
      2'b11: result = a | b;         // OR
      default: result = 4'b0000;
    endcase
  end

  assign zero = (result == 4'b0000);

endmodule
