module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

  logic [DATA_WIDTH-1:0] largest_r;
  logic [DATA_WIDTH-1:0] second_largest_r;
  always_ff @(posedge clk) begin
    if(~resetn) begin
      largest_r <= '0;
      second_largest_r <= '0;
    end
    else begin
      if(din > largest_r) begin
        largest_r <= din;
        second_largest_r <= largest_r;
      end
      else if(din > second_largest_r) second_largest_r <= din;
    end
  end

  assign dout = second_largest_r;
endmodule