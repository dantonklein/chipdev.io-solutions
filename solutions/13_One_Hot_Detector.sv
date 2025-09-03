module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
  logic [$clog2(DATA_WIDTH)-1:0] count;
  always_comb begin
    count = 0;
    for(int i = 0; i < DATA_WIDTH; i++) begin
      count += din[i];
    end
    onehot = (count == 1);
  end
endmodule