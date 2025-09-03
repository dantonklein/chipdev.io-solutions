module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);
  logic[DATA_WIDTH-1:0] shift_register;
  logic[DATA_WIDTH-1:0] zeroes;
  assign zeroes = '0;
  assign dout = shift_register;
  always_ff @(posedge clk) begin
    if(~resetn) shift_register <= 0;
    else shift_register <= (shift_register << 1) | (zeroes | din);
  end
endmodule