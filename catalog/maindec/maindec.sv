`ifndef DECODER
`define DECODER

module decoder(
    input reg_write, 
    input [4:0] write_register,
    output reg [31:0] write_en
);

wire [31:0] oe; // Output Enable
dec5to32 dec(oe, write_register);

assign write_en[0] = 1'b0; // Always 0 for write enable of register 0

assign write_en[1:31] = oe[1:31] & reg_write; // Enable write for registers 1 to 31 if reg_write is asserted

endmodule

module and5(
    output g,
    input a, b, c, d, e
);
assign g = a & b & c & d & e;
endmodule

module dec5to32(
    output reg [31:0] out,
    input [4:0] adr
);
integer i;
reg [4:0] not_adr;

always @(*) begin
    for (i = 0; i < 5; i = i + 1) begin
        not_adr[i] = ~adr[i];
    end
    out[0] = 1'b0; // Register 0 is always disabled
    out[1] = not_adr[4] & not_adr[3] & not_adr[2] & not_adr[1] & adr[0]; // Enable register 1
    out[2] = not_adr[4] & not_adr[3] & not_adr[2] & adr[1] & ~adr[0]; // Enable register 2
    // Similarly, enable registers 3 to 31 based on address lines
    // Add the corresponding logic here
end

endmodule

`endif // DECODER
