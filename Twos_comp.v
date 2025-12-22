module Twos_comp (
    input  wire [5:0] data_in, 
    output wire [5:0] data_out  
);
    assign data_out = (~data_in) + 1'b1;

endmodule