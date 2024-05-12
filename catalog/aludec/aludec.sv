//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Isaac Schertz, Isaac Amar
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

`timescale 1ns / 100ps

module aludec
    #(parameter n = 32, r = 6)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [(r-1):0] funct,
    input logic [1:0] aluop,
    output reg [2:0] alucontrol
    );
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @* begin // Combinatorial logic block
        case(aluop)
            2'b00: alucontrol = 3'b010; // addi
            2'b01: alucontrol = 3'b110; // subi
            default: case(funct)
                6'b100000: alucontrol = 3'b011; // add
                6'b100010: alucontrol = 3'b100; // sub
                6'b100100: alucontrol = 3'b000; // and
                6'b100101: alucontrol = 3'b001; // or
                6'b100111: alucontrol = 3'b010; // nor
                6'b011000: alucontrol = 3'b101; // mult
                6'b010010: alucontrol = 3'b101; // move hi (updated funct code)
                6'b010001: alucontrol = 3'b110; // move lo (updated funct code)
                6'b101010: alucontrol = 3'b111; // slt
                default:   alucontrol = 3'b111; // Illegal function, mapping to a default operation
            endcase
        endcase
    end

endmodule

`endif // ALUDEC
