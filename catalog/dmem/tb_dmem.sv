`timescale 1ns/1ps

module tb_data_memory;

    // Parameters
    parameter MEM_DEPTH = 256;

    // Signals
    reg clk;
    reg [15:0] mem_access_addr;
    reg [15:0] mem_write_data;
    reg mem_write_en;
    reg mem_read;
    wire [15:0] mem_read_data;

    // Instantiate the data_memory module
    data_memory dut (
        .clk(clk),
        .mem_access_addr(mem_access_addr),
        .mem_write_data(mem_write_data),
        .mem_write_en(mem_write_en),
        .mem_read(mem_read),
        .mem_read_data(mem_read_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        $display("Testing Data Memory");
        clk = 0;
        mem_access_addr = 16'd0;
        mem_write_data = 16'd1234;
        mem_write_en = 1'b0;
        mem_read = 1'b0;

        // Write data to memory
        #10;
        mem_write_en = 1'b1;
        #10;
        mem_write_en = 1'b0;
        #10;

        // Read data from memory
        mem_read = 1'b1;
        mem_access_addr = 16'd0;
        #10;
        mem_access_addr = 16'd1;
        #10;
        mem_read = 1'b0;

        $finish;
    end

    // Monitor
    always @* begin
        $display("Time=%t, clk=%b, mem_access_addr=%d, mem_write_data=%d, mem_write_en=%b, mem_read=%b, mem_read_data=%d",
                 $time, clk, mem_access_addr, mem_write_data, mem_write_en, mem_read, mem_read_data);
    end

endmodule
