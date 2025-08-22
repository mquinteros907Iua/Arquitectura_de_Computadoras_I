// Full adder de 1 bit
module fulladder(
  input a,
  input b,
  input ci,
  output s,
  output co
);
  assign s = a ^ b ^ ci;
  assign co = (a & b) | (a & ci) | (b & ci);
endmodule

// Sumador completo de 4 bits usando 4 full adders de 1 bit
module fulladder4(
  input [3:0] a,
  input [3:0] b,
  input ci,
  output [3:0] s,
  output co
);

  wire c1, c2, c3;

  fulladder fa0 (.a(a[0]), .b(b[0]), .ci(ci),  .s(s[0]), .co(c1));
  fulladder fa1 (.a(a[1]), .b(b[1]), .ci(c1),   .s(s[1]), .co(c2));
  fulladder fa2 (.a(a[2]), .b(b[2]), .ci(c2),   .s(s[2]), .co(c3));
  fulladder fa3 (.a(a[3]), .b(b[3]), .ci(c3),   .s(s[3]), .co(co));

endmodule
