`ifndef COUNTER
`define COUNTER

module counter(
    input wire enable,    // Enable signal for the counter
    input wire clk,       // Clock signal
    input wire rst_n,     // Active low reset signal
    output reg [3:0] count_out // 4-bit output for the counter value
);  
    // Sensitivity list triggering on positive clock edge or negative reset edge
    always @(posedge clk or negedge rst_n) begin  
        if (~rst_n) begin
            // Reset the counter to zero when reset is asserted
            count_out <= 4'b0000;  
        end else if (enable) begin
            // Increment the counter if enabled
            count_out <= count_out + 4'b0001;  
        end
    end  
endmodule  

`endif // COUNTER
