//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Isaac Schertz, Isaac Amar
// 
//     Create Date: 2023-02-07
//     Module Name: tb_alu
//     Description: Test bench for simple behavioral ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALU
`define TB_ALU

`timescale 1ns/100ps
`include "alu.sv"

module tb_alu;
    parameter n = 32;
    reg [n-1:0] A, B;
    reg [3:0] ALUOp;
    wire [n-1:0] Result;
    wire Zero;

    // Instantiate the ALU
    alu #(.n(n)) DUT (
        .A(A),
        .B(B),
        .ALUOp(ALUOp),
        .Result(Result),
        .Zero(Zero)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 0;
        B = 0;
        ALUOp = 0;

        // Apply test cases
        // Example operation codes might need to be adjusted based on actual ALU design
        #10 A = 32'hA5A5A5A5; B = 32'h5A5A5A5A; ALUOp = 4'b0000; // Example ADD operation
        #10 ALUOp = 4'b0001; // Example SUB operation
        #10 ALUOp = 4'b0010; // Example AND operation
        #10 ALUOp = 4'b0011; // Example OR operation
        #10 ALUOp = 4'b0100; // Example XOR operation
        #10 ALUOp = 4'b0101; // Example NOR operation
        #10 ALUOp = 4'b0110; // Example SLT operation (Set on Less Than)
        #10 ALUOp = 4'b0111; // Example SLL (Shift Left Logical)
        #10 ALUOp = 4'b1000; // Example SRL (Shift Right Logical)
        #10 ALUOp = 4'b1001; // Example SRA (Shift Right Arithmetic)
        #10 ALUOp = 4'b1010; // Additional operations as needed

        // Complete testing
        #10 $finish;
    end

    // Optional: Display results
    initial begin
        $monitor("Time = %t, A = %h, B = %h, ALUOp = %b, Result = %h, Zero = %b",
                  $time, A, B, ALUOp, Result, Zero);
    end

endmodule

`endif // TB_ALU
