module Second_twos_comp (
    input  wire       sign_bit,
    input  wire [7:0] inp,
    output wire [8:0] out
);

    wire [8:0] positive_val;
    assign positive_val = {1'b0, inp};

    assign out = (sign_bit) ? (~positive_val + 1'b1) : positive_val;

endmodule