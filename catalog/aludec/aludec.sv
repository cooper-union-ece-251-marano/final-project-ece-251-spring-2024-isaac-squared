//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: aludec
//     Description: 32-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aludec(
    input logic [5:0] funct,      // Function field from the instruction
    output logic [3:0] alu_ctrl   // ALU control signals output
);

    // Define the function codes for ALU operations
    localparam ALU_ADD = 6'b100000;
    localparam ALU_SUB = 6'b100010;
    localparam ALU_AND = 6'b100100;
    localparam ALU_OR  = 6'b100101;
    localparam ALU_NOR = 6'b100111;
    localparam ALU_SLL = 6'b000000;
    localparam ALU_SRL = 6'b000010;
    localparam ALU_SLT = 6'b101010;

    // Decode the function field to generate ALU control signals
    always_comb begin
        case (funct)
            ALU_ADD: alu_ctrl = 4'b0010; // ADD
            ALU_SUB: alu_ctrl = 4'b0110; // SUBTRACT
            ALU_AND: alu_ctrl = 4'b0000; // AND
            ALU_OR:  alu_ctrl = 4'b0001; // OR
            ALU_NOR: alu_ctrl = 4'b0100; // NOR
            ALU_SLL: alu_ctrl = 4'b0011; // SHIFT LEFT LOGICAL
            ALU_SRL: alu_ctrl = 4'b0101; // SHIFT RIGHT LOGICAL
            ALU_SLT: alu_ctrl = 4'b0111; // SET LESS THAN
            default: alu_ctrl = 4'bxxxx; // INVALID CODE
        endcase
    end

endmodule

`endif // ALUDEC
