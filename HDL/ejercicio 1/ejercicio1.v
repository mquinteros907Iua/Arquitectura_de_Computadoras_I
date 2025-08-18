//Diseñe un módulo en Verilog que implemente un sumador completo de un bit con entradas a,b y
//cin(carry in), y salidas sum y cout (carry out). Describir y simular con Icarus Verilog 
module ejercicio1 ( input a , input b , input cin , output sum , output co ) ;
assign sum = a ^ b ^ cin ;
assign co = ( a & b ) | cin & ( a ^ b ) ;
endmodule