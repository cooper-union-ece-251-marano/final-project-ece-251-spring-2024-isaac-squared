// Control module for defining operation signals based on opcode
module control(
    input [2:0] opcode,  // Opcode to determine the control signals
    input reset,         // Reset signal to initialize the control signals
    output reg [1:0] reg_dst, mem_to_reg, alu_op,  // Control outputs for different ALU and memory operations
    output reg jump, branch, mem_read, mem_write, alu_src, reg_write, sign_or_zero // Additional control signals
);

always @(*) begin
    if (reset) begin
        // Reset all control signals
        reg_dst = 2'b00;
        mem_to_reg = 2'b00;
        alu_op = 2'b00;
        jump = 1'b0;
        branch = 1'b0;
        mem_read = 1'b0;
        mem_write = 1'b0;
        alu_src = 1'b0;
        reg_write = 1'b0;
        sign_or_zero = 1'b1; // Assuming default reset state for sign_or_zero is 1
    end else begin
        case (opcode)
        3'b000: begin // ADD
            reg_dst = 2'b01;
            mem_to_reg = 2'b00;
            alu_op = 2'b00;
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
            sign_or_zero = 1'b1;
        end
        3'b001: begin // SLI (Shift Left Immediate?)
            reg_dst = 2'b00;
            mem_to_reg = 2'b00;
            alu_op = 2'b10;
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b1;
            reg_write = 1'b1;
            sign_or_zero = 1'b0;
        end
        3'b010: begin // JUMP
            reg_dst = 2'b00;
            mem_to_reg = 2'b00;
            alu_op = 2'b00;
            jump = 1'b1;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b0;
            sign_or_zero = 1'b1;
        end
        3'b011: begin // JAL (Jump and Link)
            reg_dst = 2'b10;
            mem_to_reg = 2'b10;
            alu_op = 2'b00;
            jump = 1'b1;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
            sign_or_zero = 1'b1;
        end
        3'b100: begin // LOAD WORD
            reg_dst = 2'b00;
            mem_to_reg = 2'b01;
            alu_op = 2'b11;
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b1;
            mem_write = 1'b0;
            alu_src = 1'b1;
            reg_write = 1'b1;
            sign_or_zero = 1'b1;
        end
        3'b101: begin // STORE WORD
            reg_dst = 2'b00;
            mem_to_reg = 2'b00;
            alu_op = 2'b11;
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            alu_src = 1'b1;
            reg_write = 1'b0;
            sign_or_zero = 1'b1;
        end
        3'b110: begin // BRANCH EQUAL
            reg_dst = 2'b00;
            mem_to_reg = 2'b00;
            alu_op = 2'b01;
            jump = 1'b0;
            branch = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b0;
            sign_or_zero = 1'b1;
        end
        3'b111: begin // ADD IMMEDIATE (ADDI)
            reg_dst = 2'b00; // Use Rt as the destination register
            mem_to_reg = 2'b00;
            alu_op = 2'b00; // ALU set to addition
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b1; // Use immediate as second operand
            reg_write = 1'b1;
            sign_or_zero = 1'b1; // Assume sign extension for the immediate
        end
        3'b100: begin // JUMP (J)
            reg_dst = 2'b00;
            mem_to_reg = 2'b00;
            alu_op = 2'b00;
            jump = 1'b1;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b0;
            sign_or_zero = 1'b0;
        end
        3'b101: begin // JUMP AND LINK (JAL)
            reg_dst = 2'b10; // Destination register is special, typically the link register
            mem_to_reg = 2'b10;
            alu_op = 2'b00;
            jump = 1'b1;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1; // Write to link register
            sign_or_zero = 1'b0;
        end
        3'b011: begin // SET LESS THAN IMMEDIATE (SLTI)
            reg_dst = 2'b00; // Result goes to Rt
            mem_to_reg = 2'b00;
            alu_op = 2'b01; // ALU performs a set less than operation
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            alu_src = 1'b1; // Use immediate as second operand
            reg_write = 1'b1;
            sign_or_zero = 1'b1; // Immediate is sign-extended
        end
    endcase
end
endmodule
