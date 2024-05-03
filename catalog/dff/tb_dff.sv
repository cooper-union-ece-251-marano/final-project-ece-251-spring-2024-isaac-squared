`timescale 1ns/1ps

module tb_d_ff;

// Parameters
parameter PERIOD = 10; // Clock period
parameter HALF_PERIOD = PERIOD / 2;

// Signals
reg d, clk, rst_n;
wire q;

// Instantiate the D_FF module
D_FF uut (
    .q(q),
    .d(d),
    .rst_n(rst_n),
    .clk(clk)
);

// Clock generation
initial begin
    clk = 0;
    forever #HALF_PERIOD clk = ~clk;
end

// Reset generation
initial begin
    rst_n = 0;
    #100;
    rst_n = 1;
end

// Stimulus
initial begin
    // Test case 1: d = 0
    d = 1'b0;
    #PERIOD;
    // Test case 2: d = 1
    d = 1'b1;
    #PERIOD;
    // Test case 3: d = 0
    d = 1'b0;
    #PERIOD;
    // Test case 4: d = 1
    d = 1'b1;
    #PERIOD;
    // End simulation
    $finish;
end

endmodule
