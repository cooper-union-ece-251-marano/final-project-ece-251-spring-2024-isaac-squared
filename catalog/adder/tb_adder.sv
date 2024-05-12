//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Isaac Schertz, Isaac Amar
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavioral adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER
`define TB_ADDER

`timescale 1ns / 100ps
`include "adder.sv"

module tb_adder;
    parameter n = 32;
    logic [(n-1):0] a, b, out;

    // Dump waveforms and monitor output
    initial begin
        $dumpfile("tb_adder.vcd");
        $dumpvars(0, tb_adder);
        $monitor("At time %t, a = 0x%0h, b = 0x%0h, out = 0x%0h", $time, a, b, out);
    end

    // Define test cases
    initial begin
        // Test case 1
        a = 32'h1B30FFF;
        b = 32'hFFA5FFFF;
        #10; // Wait for 10 ns to observe the output

        // Test case 2
        a = 32'h98765432;
        b = 32'h12345678;
        #10; // Wait for 10 ns to observe the output

        // Test case 3
        a = 32'h01000001;
        b = 32'h10101010;
        #10; // Wait for 10 ns

        $finish; // End simulation
    end

    // Instantiate the adder module
    adder uut(
        .a(a), 
        .b(b), 
        .c(out)
    );
endmodule

`endif // TB_ADDER
