module model (
    input [7:0] din,
    output reg [255:0] dout
);
    logic[255:0] temp;
    //this solution is not optimal, this question is kind of hilarious to implement in hardware tho
    always_comb begin
        for(int i = 0; i < 256; i++) begin
            temp[i] = (i <= din);
        end
        dout = temp;
    end
endmodule