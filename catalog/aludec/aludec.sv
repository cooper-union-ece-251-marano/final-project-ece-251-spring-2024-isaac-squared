`ifndef ALU_CONTROL
`define ALU_CONTROL

module ALUControl(
    input [1:0] ALUOp,  
    input [3:0] Function,  
    output reg [2:0] ALU_Control
);
    // Combine ALUOp and Function into a single 6-bit input
    wire [5:0] ALUControlIn = {ALUOp, Function};  
    
    // Determine the ALU control signal based on ALUOp and Function
    always @(*) begin
        casex (ALUControlIn)
            6'b11xxxx: ALU_Control = 3'b000;  // Example operation
            6'b10xxxx: ALU_Control = 3'b100;  // Set less than
            6'b01xxxx: ALU_Control = 3'b001;  // Subtract
            6'b000000: ALU_Control = 3'b000;  // Addition
            6'b000001: ALU_Control = 3'b001;  // Subtraction
            6'b000010: ALU_Control = 3'b010;  // Multiply
            6'b000011: ALU_Control = 3'b011;  // NOR
            6'b000100: ALU_Control = 3'b100;  // SLT
            default:   ALU_Control = 3'b000;  // Default to addition
        endcase  
    end
endmodule  



// Verilog code for JR control unit
module JR_Control(
    input [1:0] alu_op,
    input [3:0] funct,
    output JRControl
);
    // Detect specific function code for Jump Register (JR) instruction
    assign JRControl = ({alu_op, funct} == 6'b001000) ? 1'b1 : 1'b0;
endmodule

`endif // JR_CONTROL
