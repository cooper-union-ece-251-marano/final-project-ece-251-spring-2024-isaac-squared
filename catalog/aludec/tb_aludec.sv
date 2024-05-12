//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_aludec
//     Description: Test bench for simple behavioral ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALUDEC
`define TB_ALUDEC

`timescale 1ns/100ps
`include "aludec.sv"

module tb_aludec;
    parameter n = 32;
    reg [5:0] OpCode;    // Assuming a 6-bit opcode for the ALU decoder
    reg [5:0] Funct;     // Assuming a 6-bit function code specific to certain ALU operations
    wire [3:0] ALUOp;    // Output ALU operation code

    // Instantiate the ALU decoder
    aludec #(.n(n)) DUT (
        .OpCode(OpCode),
        .Funct(Funct),
        .ALUOp(ALUOp)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        OpCode = 6'b000000; 
        Funct = 6'b000000;

        // Apply test cases
        #10 OpCode = 6'b000000; Funct = 6'b100000; // Example: ADD operation
        #10 OpCode = 6'b000000; Funct = 6'b100010; // Example: SUB operation
        #10 OpCode = 6'b000000; Funct = 6'b100100; // Example: AND operation
        #10 OpCode = 6'b000000; Funct = 6'b100101; // Example: OR operation
        #10 OpCode = 6'b000000; Funct = 6'b101010; // Example: SLT operation (Set on Less Than)
        #10 OpCode = 6'b001000;                   // Example: ADDI (Immediate ADD, if applicable)

        // More test cases can be added here for different instructions

        // Complete testing
        #20 $finish;
    end

    // Optional: Display results
    initial begin
        $monitor("Time = %t, OpCode = %b, Funct = %b, ALUOp = %b",
                 $time, OpCode, Funct, ALUOp);
    end

endmodule

`endif // TB_ALUDEC
