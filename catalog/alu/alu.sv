//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Isaac Schertz, Isaac Amar
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

`ifndef ALU
`define ALU

`timescale 1ns / 100ps

module alu
    #(parameter n = 32)(
    input logic clk,
    input logic rst, // Reset signal added
    input logic [2:0] alucontrol,
    input logic [(n-1):0] a, b,
    output logic [(n-1):0] result,
    output logic zero
);

    logic [(2*n-1):0] HILO;

    // Reset and result update block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 0;
            HILO <= 0;
        end else begin
            case (alucontrol)
                3'b000: result <= a & b; // AND
                3'b001: result <= a | b; // OR
                3'b010: result <= ~(a | b); // NOR
                3'b011: result <= a + b; // ADD
                3'b100: result <= a - b; // SUB
                3'b101: result <= HILO[(2*n-1):n]; // MFHI
                3'b110: result <= HILO[(n-1):0]; // MFLO
                3'b111: result <= (a < b) ? 1 : 0; // SLT
            endcase
        end
    end

    // Update HILO register for multiplication
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            HILO <= 0;
        end else if (alucontrol == 3'b101) begin
            HILO <= a * b;
        end
    end

    // Zero flag update
    always @(posedge clk) begin
        zero <= (result == 0);
    end

endmodule

`endif // ALU
