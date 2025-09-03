module model (
  input clk,
  input resetn,
  input din,
  output dout
);

logic previous_din_r;
logic dout_r;
assign dout = dout_r;
always_ff @(posedge clk) begin
  if(~resetn) begin
    dout_r <= 0;
    previous_din_r <= 0;
  end
  else begin
    if(din) begin
      previous_din_r <= 1;
      if(~previous_din_r) dout_r <= 1;
      else dout_r <= 0;
    end else begin
      previous_din_r <= 0;
      dout_r <= 0;
    end
  end
end

endmodule