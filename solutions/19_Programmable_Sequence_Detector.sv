//I think this questions simulation is incorrect on the website.

module model (
  input clk,
  input resetn,
  input [4:0] init,
  input din,
  output logic seen
);
logic [4:0] init_r, next_init_r;
logic [2:0] init_pointer, next_init_pointer;
logic next_seen;
always_ff @ (posedge clk) begin
  init_r <= next_init_r;
  init_pointer <= next_init_pointer;
  seen <= next_seen;
end

always_comb begin
  if(~resetn) begin
    next_init_r = init;
    next_init_pointer = 0;
    next_seen = seen;
  end else begin
    next_seen = 0;
    if(din == init_r[init_pointer])  begin
      if(init_pointer == 4) begin
        next_seen = 1;
        next_init_pointer = 0;
      end else begin
        next_init_pointer = init_pointer + 1;
      end
    end else begin
      if(init_pointer)
      next_init_pointer = 0;
    end
  end
end
endmodule