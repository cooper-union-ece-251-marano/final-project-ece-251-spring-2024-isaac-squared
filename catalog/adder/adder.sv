//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

`timescale 1ns/100ps

module adder
    #(parameter n = 16)  
    (
        input [n-1:0] a,  // First operand
        input [n-1:0] b,  // Second operand
        output [n-1:0] sum  // Sum of a and b
    );

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //

    assign sum = a + b;  // Performs bit-wise addition of a and b

endmodule

`endif // ADDER
