`ifndef TB_REGFILE
`define TB_REGFILE

`timescale 1ns/100ps
`include "register_file.sv"

module tb_regfile;
    parameter n = 32; // Width of the register and data

    // Inputs
    reg clk;
    reg rst;
    reg reg_write_en;
    reg [2:0] reg_write_dest;
    reg [15:0] reg_write_data;
    reg [2:0] reg_read_addr_1;
    reg [2:0] reg_read_addr_2;

    // Outputs
    wire [15:0] reg_read_data_1;
    wire [15:0] reg_read_data_2;

    // Instantiate the Register File
    register_file uut (
        .clk(clk),
        .rst(rst),
        .reg_write_en(reg_write_en),
        .reg_write_dest(reg_write_dest),
        .reg_write_data(reg_write_data),
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_read_data_2(reg_read_data_2)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate a clock with a period of 10ns

    // Test scenarios
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        reg_write_en = 0;
        reg_write_dest = 0;
        reg_write_data = 0;
        reg_read_addr_1 = 0;
        reg_read_addr_2 = 0;

        // Apply Reset
        #10;
        rst = 0;

        // Write to register 3
        #10;
        reg_write_en = 1;
        reg_write_dest = 3;
        reg_write_data = 16'hABCD;
        #10;
        reg_write_en = 0; // Disable write to hold the value

        // Read from register 3
        reg_read_addr_1 = 3;
        #10;

        // Write to another register while reading from register 3
        reg_write_en = 1;
        reg_write_dest = 2;
        reg_write_data = 16'h1234;
        #10;
        reg_write_en = 0;

        // Read from register 2
        reg_read_addr_2 = 2;
        #10;

        // Reset and observe zero on outputs
        rst = 1;
        #10;
        rst = 0;
        #10;

        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("At time %t, Read Data 1 = %h, Read Data 2 = %h", $time, reg_read_data_1, reg_read_data_2);
    end
endmodule

`endif // TB_REGFILE
