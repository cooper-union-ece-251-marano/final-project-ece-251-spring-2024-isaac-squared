`timescale 1ns/1ps

module tb_decoder;

  // Parameters
  parameter ADDR_WIDTH = 5;
  
  // Signals
  reg reg_write;
  reg [ADDR_WIDTH-1:0] write_register;
  wire [31:0] write_en;

  // Instantiate the decoder
  decoder dut(
    .reg_write(reg_write),
    .write_register(write_register),
    .write_en(write_en)
  );

  // Stimulus
  initial begin
    $display("Testing Decoder");
    reg_write = 1'b0;
    write_register = 5'b00000;
    #10;
    reg_write = 1'b1;
    write_register = 5'b00001; // Enable register 1
    #10;
    write_register = 5'b01010; // Enable register 10
    #10;
    write_register = 5'b11111; // Enable register 31
    #10;
    $finish;
  end

  // Monitor
  always @* begin
    $display("reg_write = %b, write_register = %b, write_en = %b", reg_write, write_register, write_en);
  end

endmodule
