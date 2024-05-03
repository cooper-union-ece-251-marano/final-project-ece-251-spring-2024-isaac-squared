`timescale 1ns/1ps

module tb_instr_mem;

// Parameters
parameter WAIT_TIME = 10;

// Signals
reg [15:0] pc;
wire [15:0] instruction;

// Instantiate the instr_mem module
instr_mem uut (
    .pc(pc),
    .instruction(instruction)
);

// Stimulus
initial begin
    // Initialize PC
    pc = 0;

    // Display header
    $display("PC\tInstruction");

    // Loop through PC values and display corresponding instructions
    repeat (16) begin
        #WAIT_TIME;
        $display("%d\t%h", pc, instruction);
        pc = pc + 1;
    end

    // Finish simulation
    $finish;
end

endmodule
