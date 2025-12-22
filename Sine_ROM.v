module Sine_ROM (
    input  wire       clk,      // Clock is required for FPGA memory blocks
    input  wire [5:0] addr,     // This is your "pointer" (0 to 63)
    output reg  [7:0] data_out  // The 8-bit data extracted from the file
);

    (* romstyle = "M9K" *) 
    reg [7:0] rom_memory [0:63];

    // 2. Initialize Memory from File
    // This block runs once at the start of the simulation to load your file.
    initial begin
        // "sine.mem" must be in the same folder as your simulation
        $readmemb("sine.mem", rom_memory);
    end

    // 3. Extraction Logic (Synchronous Read)
    // On every clock edge, the output updates to match the data at the "pointer"
    always @(posedge clk) begin
        data_out <= rom_memory[addr];
    end

endmodule