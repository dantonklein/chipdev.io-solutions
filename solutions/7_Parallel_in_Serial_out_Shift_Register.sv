module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);
logic[DATA_WIDTH-1:0] shift_register;
assign dout = shift_register[0];
always_ff @(posedge clk) begin
  if(~resetn) begin
    shift_register <= 0;
  end
  else begin
    if(din_en) shift_register <= din;
    else shift_register <= shift_register >> 1;
  end
end

endmodule