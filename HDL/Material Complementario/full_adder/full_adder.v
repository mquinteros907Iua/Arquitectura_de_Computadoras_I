module full_adder(
  input a,
  input b,
  input cin,
  output sum,
  output carry
);

assign sum = a ^ b ^ cin;                         // suma: XOR de a, b y cin
assign carry = (a & b) | (b & cin) | (cin & a);  // carry: combinación de AND y OR

endmodule
