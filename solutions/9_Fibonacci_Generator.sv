module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);
logic[DATA_WIDTH-1:0] F_0, F_1;
assign out = F_0;
always_ff @(posedge clk) begin
  if(~resetn) begin
    F_0 <= 1;
    F_1 <= 1;
  end
  else begin
    F_0 <= F_1;
    F_1 <= F_0 + F_1;
  end
end

endmodule