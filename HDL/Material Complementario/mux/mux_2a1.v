module mux2to1_8bit (
    input wire [7:0] in0,
    input wire [7:0] in1,
    input wire sel,
    output reg [7:0] out
);

    always @(*) begin
        if (sel)
            out = in1;
        else
            out = in0;
    end

endmodule
