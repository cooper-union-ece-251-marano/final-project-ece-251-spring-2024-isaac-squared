`ifndef DATA_MEMORY
`define DATA_MEMORY

module data_memory (
    input clk,
    input [15:0] mem_access_addr,
    input [15:0] mem_write_data,
    input mem_write_en,
    input mem_read,
    output reg [15:0] mem_read_data
);

    // Declare memory array
    reg [15:0] ram [255:0];

    // Extract lower 8 bits of the memory address for indexing
    wire [7:0] ram_addr = mem_access_addr[7:0];

    // Initialize memory to zeros
    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1)
            ram[i] = 16'd0;
    end

    // Write to memory on positive edge of clock if mem_write_en is asserted
    always @(posedge clk) begin
        if (mem_write_en)
            ram[ram_addr] <= mem_write_data;
    end

    // Read from memory if mem_read is asserted
    always @* begin
        if (mem_read)
            mem_read_data = ram[ram_addr];
        else
            mem_read_data = 16'd0;
    end

endmodule

`endif // DATA_MEMORY
