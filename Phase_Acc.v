module Phase_Acc (
    input rst,input clk,output reg bit_count , output reg sign , output reg phase
);

    reg [1:0] iter;
    wire cout_bit;

    always @(posedge cout_bit) begin
        iter = iter + 2'd1;
    end

    always @(*) begin

        if (iter[1] == 1) begin
            sign = 1;
        end

        else begin
            sign = 0;
        end

        if (iter[0] == 0) begin
            phase = 0;
        end
        else if (iter[0] == 1) begin
            phase = 1;
        end
        
    end
    assign cout_bit = (bit_count == 6'd63);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_count <= 3'd0;
        end else if (clr_bit) begin
            bit_count <= 6'd0;
        end else if (en_bit) begin
            bit_count <= bit_count + 6'd1;
        end
    end
endmodule
