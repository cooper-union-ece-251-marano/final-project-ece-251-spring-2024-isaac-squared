`ifndef instr_mem
`define instr_mem

module instr_mem (
    input [15:0] pc,
    output reg [15:0] instruction
);

// Enhanced instruction memory code
reg [15:0] rom[15:0];

// Initialize instruction memory with program code
initial begin
    rom[0] = 16'b1000000010000000;  // lw $1,0
    rom[1] = 16'b1110000100000001;  // addi $2, $0, 1
    rom[2] = 16'b0010101000100010;  // loop: slti $4,$1,21
    rom[3] = 16'b1101000001100111;  // beq $4,$0,break
    rom[4] = 16'b0000010100110000;  // add $3, $1, $2
    rom[5] = 16'b0000010000100000;  // add $2, $1, $0
    rom[6] = 16'b0000110000010000;  // add $1, $3, $0
    rom[7] = 16'b1010101010000000;  // sw $2
    rom[8] = 16'b1100000001111010;  // beq $0,$0,loop
    // Fill remaining addresses with no operation
    for (int i = 9; i < 16; i = i + 1) begin
        rom[i] = 16'b0000000000000000;
    end
end

// Output the instruction based on PC
always @(*) begin
    if (pc[15:0] < 16) begin
        instruction = rom[pc[4:1]];
    end else begin
        instruction = 16'd0;
    end
end

endmodule
`endif
