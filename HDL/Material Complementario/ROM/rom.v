module rom_256x8 (
    input wire [7:0] addr,
    output reg [7:0] data
);

    reg [7:0] rom_mem [0:255];
    integer i;  // Aquí declaro la variable

    initial begin
        rom_mem[0] = 8'hA0;
        rom_mem[1] = 8'hB1;
        rom_mem[2] = 8'hC2;
        rom_mem[3] = 8'hD3;
        rom_mem[4] = 8'hE4;
        rom_mem[5] = 8'hF5;
        for (i = 6; i < 256; i = i + 1) begin
            rom_mem[i] = 8'h00;
        end
    end

    always @(*) begin
        data = rom_mem[addr];
    end

endmodule
