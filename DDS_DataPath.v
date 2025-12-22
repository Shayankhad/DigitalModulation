module DDS_Data_Path (
    input clk , input rst , reg output [8:0] out
);
    wire [5:0] rom_in;
    wire [7:0] rom_out;
    wire sign;
    wire phase;
    wire [5:0] bit_count;
    wire [5:0] bit_count_tows;
    wire Rom_out_sel;
    wire [7:0] rom_out_selected;
    wire bit_count_nor;

    Sine_ROM ROM (
        .clk(clk),      
        .addr(rom_in),     
        .data_out(rom_out)  
    );

    Phase_Acc ACC(rst,clk, bit_count , sign , phase);
    mux2to1 Rom_Addr(6)(bit_count,bit_count_tows,phase,rom_in);
    mux2to1 Rom_Out(8)(rom_out,8'd255,Rom_out_sel,rom_out_selected);
    Twos_comp Twos_1(bit_count,bit_count_tows);
    nor_reduction_6bit Nor(bit_count,bit_count_nor);
    And_gate and_gate_mod (bit_count_nor,phase,Rom_out_sel);
    Twos_comp Twos_2(rom_out_selected,out);


endmodule