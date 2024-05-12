//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Isaac Schertz, Isaac Amar
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: simple behavioral adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

`timescale 1ns / 100ps

module adder
    #(parameter n = 32)(
        //
        // ---------------- PORT DEFINITIONS ----------------
        //
        input [(n-1):0] a, b,
        output reg [(n-1):0] c
    );
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @* begin
        c = a + b; // Using procedural assignment inside an always block
    end

endmodule

`endif // ADDER
