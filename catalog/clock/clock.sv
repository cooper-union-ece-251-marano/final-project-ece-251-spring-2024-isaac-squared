//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: clock
//     Description: Clock generator; duty cycle = 50%
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef CLOCK
`define CLOCK

`timescale 1ns/100ps

// Clock generator module that creates a clock signal with a configurable frequency
module clock
    #(parameter ticks = 10)  // Number of time units for a complete cycle
    (
    input ENABLE,            // Enable input to start or stop the clock
    output reg CLOCK         // Clock output
    );

    // Variables for clock control
    reg start_clock;
    real clock_on = ticks / 2.0;  // Time the clock signal is high
    real clock_off = ticks / 2.0; // Time the clock signal is low

    // Initialize variables
    initial begin
      CLOCK <= 0;              // Start with CLOCK in low state
      start_clock <= 0;        // Clock is not started initially
    end

    // Handle enable signal to start or stop the clock
    always @(posedge ENABLE or negedge ENABLE) begin
        if (ENABLE) begin
            start_clock <= 1;  // Start clock when ENABLE is high
        end
        else begin
            start_clock <= 0;  // Stop clock when ENABLE is low
        end
    end

    // Generate the clock signal when started
    always @(start_clock) begin
        if (start_clock) begin
            forever begin
                #(clock_off) CLOCK = 1;  // Clock high
                #(clock_on) CLOCK = 0;   // Clock low
            end
        end else begin
            CLOCK = 0;  // Ensure the CLOCK is held low when not started
        end
    end

endmodule

`endif // CLOCK
