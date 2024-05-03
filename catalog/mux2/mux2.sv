//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: mux2
//     Description: 2 to 1 multiplexer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MUX2
`define MUX2

`timescale 1ns/100ps

module mux2 #(
    parameter WIDTH = 16  // Default to 16 bits
)(
    input wire [WIDTH-1:0] input0,  // Input 0
    input wire [WIDTH-1:0] input1,  // Input 1
    input wire select,              // Selection signal
    output wire [WIDTH-1:0] outputY // Output
);

    // Implement the multiplexer logic
    // Select input1 if select is high, otherwise input0
    assign outputY = select ? input1 : input0;

endmodule

`endif // MUX2
