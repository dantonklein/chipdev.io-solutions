module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);
logic [DATA_WIDTH-1:0] count_r;
//I found this algorithm for converting binary counting to gray code count online. Did not come up with it myself.
assign out = count_r ^ (count_r >> 1);
always_ff @(posedge clk) begin
  if(~resetn) begin
    count_r <= '0;
  end
  else begin 
    count_r <= count_r + 1;
  end

end
endmodule