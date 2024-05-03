`ifndef D_FF
`define D_FF
module D_FF (
    output reg q,
    input d, rst_n, clk
);  
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            q <= 1'b0; // Reset: q = 0
        end
        else begin
            q <= d; // Set q to d on clock edge
        end
    end
endmodule
`endif // D_FF
