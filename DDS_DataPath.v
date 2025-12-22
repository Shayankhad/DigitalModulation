module DDS_Data_Path (
    input clk , input rst , reg output [7:0] out
);

    Phase_Acc ACC(rst,clk, bit_count , sign , phase);
    mux2to1 Rom_Addr(6)(bit_count,bit_count_tows,phase,rom_in);
    mux2to1 Rom_Out(8)(rom_out,8'd255,Rom_out_sel,rom_out_selected);
    Twos_comp Twos_1(bit_count,bit_count_tows);
    nor_reduction_6bit Nor(bit_count,bit_count_nor);
    and_gate And(bit_count_nor,phase,Rom_out_sel);
    Twos_comp Twos_2(rom_out_selected,out);


endmodule