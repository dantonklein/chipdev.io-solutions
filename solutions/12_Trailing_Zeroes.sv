module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
logic[$clog2(DATA_WIDTH):0] temp;
logic one_detected;
  always_comb begin
    temp = 0;
    one_detected = 0;
    for(int i = 0; i < DATA_WIDTH; i++) begin
      if(~one_detected) begin
        one_detected = din[i];
        temp += !din[i];
      end
    end
    dout = temp;
  end
endmodule