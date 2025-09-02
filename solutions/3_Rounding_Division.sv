module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);
logic[IN_WIDTH-1:0] full_size_dout;
assign full_size_dout = (din >> DIV_LOG2) + din[DIV_LOG2-1];
assign dout = (full_size_dout > (2 ** OUT_WIDTH - 1)) ? '1 : full_size_dout;
endmodule