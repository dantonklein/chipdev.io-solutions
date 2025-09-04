module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);
logic temp;
if (DATA_WIDTH % 2 == 1) begin
  always_comb begin
    temp = 1;
    for(int i = 0; i < (DATA_WIDTH / 2) + 1; i++) begin
      temp = temp & (din[i] == din[DATA_WIDTH-i - 1]);
    end
    dout = temp;
  end
end else begin
  always_comb begin
    temp = 1;
    for(int i = 0; i < (DATA_WIDTH / 2); i++) begin
      temp = temp & (din[i] == din[DATA_WIDTH-i - 1]);
    end
    dout = temp;
  end
end

endmodule