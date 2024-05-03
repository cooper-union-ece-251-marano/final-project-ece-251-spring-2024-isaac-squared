`ifndef ALU
`define ALU

module alu(
    input [15:0] a,            // First input operand
    input [15:0] b,            // Second input operand
    input [2:0] alu_control,   // Control signal to determine operation
    output reg [15:0] result,  // Result of the ALU operation
    output zero                // Flag that is true when result is zero
);

    reg [31:0] temp_result;    // Temporary register to hold extended results

    // Perform ALU operations based on alu_control signal
    always @(*) begin
        case (alu_control)
            3'b000: result = a + b;                    // Addition
            3'b001: result = a - b;                    // Subtraction
            3'b010: temp_result = a * b;               // Multiplication
            3'b011: result = ~(a | b);                 // NOR
            3'b100: result = (a < b) ? 16'd1 : 16'd0;  // Set on less than
            3'b101: begin                             // Division and modulus
                     temp_result[15:0] = a / b;        // Division result in lower half
                     temp_result[31:16] = a % b;       // Modulus result in upper half
                    end
            3'b110: result = temp_result[31:16];       // High part of temp_result (e.g., from modulus)
            3'b111: result = temp_result[15:0];        // Low part of temp_result (e.g., from division)
            default: result = a + b;                   // Default to addition if unspecified
        endcase
    end

    // Set the zero output if the result is zero
    assign zero = (result == 16'd0);

endmodule 

`endif // ALU
