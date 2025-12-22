module DDS_Data_Path (
    input clk , input rst , reg output [7:0] out
);

    Phase_Acc ACC(rst,clk, bit_count , sign , phase);
    mux2to1 Rom_Addr(6)(a,b,sel,y);
    mux2to1 Rom_Out(8)(a,b,sel,y);
    Twos_comp Twos_1(data_in,data_out);
    nor_reduction_6bit Nor(in,out);
    and_gate And(a,b,out);
    Twos_comp Twos_2(data_in,data_out);


endmodule