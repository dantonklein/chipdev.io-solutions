//The sims were stupid for this question since you have to output the clocks at a specific phase.

module model (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);
logic div2_count;
logic [1:0] div4_count;
logic [2:0] div6_count;

always_ff @(posedge clk) begin
  if(~resetn) begin
    div2_count <= 0;
    div4_count <= 0;
    div6_count <= 0;
    div2 <= 0;
    div4 <= 0;
    div6 <= 0;
  end
  else begin
    div2 <= 1;
    div4 <= 1;
    div6 <= 1;

    if(div2_count) begin
      div2 <= 0;
      div2_count <= 0;
    end
    else div2_count <= 1;

    if(div4_count[1]) div4 <= 0;
    if(div4_count == 2'b11) begin
      div4_count = 0;
    end
    else div4_count <= div4_count + 1;

    if(div6_count > 3'b010) div6 <= 0;
    if(div6_count == 3'b101) begin
      div6_count = 0;
    end
    else div6_count <= div6_count + 1;

  end
end
endmodule