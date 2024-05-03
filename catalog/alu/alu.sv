//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU

`timescale 1ns/100ps

module alu
    #(parameter n = 32)(
    )(
    input logic [n-1:0] a, b,        // 32-bit input operands
    input logic [3:0] ctrl,          // Control signals (4-bit to accommodate more functions)
    output logic [n-1:0] result,     // 32-bit result
    output logic zero                // Flag that is true if result is zero
);

// Flag for zero result
assign zero = (result == 0);

// Operation based on control signals
always_comb begin
    case (ctrl)
        `ALU_CTRL_AND: result = a & b;     // AND
        `ALU_CTRL_OR:  result = a | b;     // OR
        `ALU_CTRL_ADD: result = a + b;     // ADD
        `ALU_CTRL_SLL: result = a << b[4:0];  // Shift left logical (only use lower 5 bits of b)
        `ALU_CTRL_NOR: result = ~(a | b);  // NOR
        `ALU_CTRL_SRL: result = a >> b[4:0];  // Shift right logical (only use lower 5 bits of b)
        `ALU_CTRL_SUB: result = a - b;     // SUBTRACT
        `ALU_CTRL_SLT: begin               // Set on less than (signed)
            if (a < b)
                result = 1;
            else
                result = 0;
        end
        default: result = 0;  // Default case
    endcase
end

endmodule

`endif // ALU
