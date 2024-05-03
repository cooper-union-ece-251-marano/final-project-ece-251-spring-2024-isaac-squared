`timescale 1ns / 100ps
`include "ALUControl.sv"

module tb_ALUControl;
    // Inputs to the ALUControl
    reg [1:0] ALUOp;
    reg [3:0] Function;

    // Output from the ALUControl
    wire [2:0] ALU_Control;

    // Instantiate the ALUControl
    ALUControl uut (
        .ALUOp(ALUOp),
        .Function(Function),
        .ALU_Control(ALU_Control)
    );

    // Test sequence
    initial begin
        // Initialize inputs
        ALUOp = 0; Function = 0;
        #100; // Wait for the initial reset

        // Test various combinations of ALUOp and Function
        ALUOp = 2'b11; Function = 4'bxxxx; // Test for ALUOp = 3'b11xx
        #10;
        ALUOp = 2'b10; Function = 4'bxxxx; // Test for ALUOp = 3'b10xx
        #10;
        ALUOp = 2'b01; Function = 4'bxxxx; // Test for ALUOp = 3'b01xx
        #10;
        ALUOp = 2'b00; Function = 4'b0000; // Test for Function = 4'b0000
        #10;
        ALUOp = 2'b00; Function = 4'b0001; // Test for Function = 4'b0001
        #10;
        ALUOp = 2'b00; Function = 4'b0010; // Test for Function = 4'b0010
        #10;
        ALUOp = 2'b00; Function = 4'b0011; // Test for Function = 4'b0011
        #10;
        ALUOp = 2'b00; Function = 4'b0100; // Test for Function = 4'b0100
        #10;
        ALUOp = 2'b00; Function = 4'b0101; // Additional test cases as needed
        #10;

        // End of testing
        $finish;
    end

    // Monitoring changes to inputs and output
    initial begin
        $monitor("At time %t, ALUOp = %b, Function = %b, ALU_Control = %b",
                 $time, ALUOp, Function, ALU_Control);
    end
endmodule
