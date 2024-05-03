`timescale 1ns / 100ps
`include "alu.sv"

module tb_alu;
    // Inputs to the ALU
    reg [15:0] a;
    reg [15:0] b;
    reg [2:0] alu_control;

    // Outputs from the ALU
    wire [15:0] result;
    wire zero;

    // Instantiate the ALU
    alu uut (
        .a(a), 
        .b(b), 
        .alu_control(alu_control), 
        .result(result), 
        .zero(zero)
    );

    // Initialize all inputs
    initial begin
        a = 0; b = 0; alu_control = 0;
        #100; // Wait 100 ns for global reset

        // Test Addition
        a = 16'd15; b = 16'd10; alu_control = 3'b000;
        #10; // Perform the operation and wait

        // Test Subtraction
        a = 16'd20; b = 16'd10; alu_control = 3'b001;
        #10;

        // Test Multiplication
        a = 16'd4; b = 16'd5; alu_control = 3'b010;
        #10;

        // Test NOR
        a = 16'd0xFFFF; b = 16'd0xFFFF; alu_control = 3'b011;
        #10;

        // Test Set on Less Than
        a = 16'd5; b = 16'd10; alu_control = 3'b100;
        #10;

        // Test Division and Modulus
        a = 16'd10; b = 16'd3; alu_control = 3'b101;
        #10;

        // Check results from previous high temp_result
        alu_control = 3'b110;
        #10;

        // Check results from previous low temp_result
        alu_control = 3'b111;
        #10;

        // Complete the testing
        $finish;
    end

    // Monitor the results
    initial begin
        $monitor("Time = %t, a = %d, b = %d, Control = %b, Result = %d, Zero = %b", 
                 $time, a, b, alu_control, result, zero);
    end
endmodule
