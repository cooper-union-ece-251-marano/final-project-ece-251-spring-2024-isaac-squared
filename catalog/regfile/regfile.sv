`ifndef REGISTER_FILE
`define REGISTER_FILE

module register_file(
    input            clk,  
    input            rst,
    // Write port
    input            reg_write_en,
    input   [2:0]    reg_write_dest,
    input   [15:0]   reg_write_data,
    // Read port 1
    input   [2:0]    reg_read_addr_1,
    output reg [15:0] reg_read_data_1,
    // Read port 2
    input   [2:0]    reg_read_addr_2,
    output reg [15:0] reg_read_data_2
);
    // Array of 8 registers, each 16-bit wide
    reg [15:0] reg_array [7:0];

    // Reset and write logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to 0 using a loop
            integer i;
            for (i = 0; i < 8; i = i + 1) begin
                reg_array[i] <= 16'b0;
            end
        end
        else if (reg_write_en) begin
            // Write data to the register specified by reg_write_dest
            reg_array[reg_write_dest] <= reg_write_data;
        end
    end

    // Read logic with prevention of reading from register 0
    always @(*) begin
        reg_read_data_1 = (reg_read_addr_1 == 0) ? 16'b0 : reg_array[reg_read_addr_1];
        reg_read_data_2 = (reg_read_addr_2 == 0) ? 16'b0 : reg_array[reg_read_addr_2];
    end
endmodule

`endif // REGISTER_FILE
