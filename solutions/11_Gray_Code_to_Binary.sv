module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);
//This algorithm was found online, and I adapted it into SV
logic [DATA_WIDTH-1:0] temp;
always_comb begin
  temp = gray;
  for(int i = $clog2(DATA_WIDTH); i > 0; i--) begin
      temp ^= (temp >> 2 ** (i - 1));
  end
  bin = temp;
end
endmodule