module nor_reduction_6bit (
    input  wire [5:0] in,  // The 6-bit address input
    output wire out        // 1 if input is 000000, else 0
);

    // Logic: Bitwise OR all bits together, then NOT the result.
    assign out = ~(|in); 

endmodule