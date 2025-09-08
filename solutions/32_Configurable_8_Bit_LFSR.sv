module model (
    input clk,
    input resetn,
    input [7:0] din,
    input [7:0] tap,
    output [7:0] dout
);
logic[7:0] tap_r;
logic calculation;
logic[7:0] lfsr_r;

assign calculation = ^ (tap_r & lfsr_r);
assign dout = lfsr_r;
always_ff @(posedge clk) begin
    tap_r <= tap;
    if(~resetn) begin
        lfsr_r <= din;
    end
    else begin
        lfsr_r <= {lfsr_r[6:0], calculation};
    end
end

endmodule