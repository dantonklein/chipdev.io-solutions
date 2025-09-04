module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
typedef enum logic[1:0] {
  init,
  divisible_by_3,
  one_more_than_divisible_by_3,
  one_less_than_divisible_by_3
} state_t;
state_t state_r;
logic dout_r;
assign dout = dout_r;
always_ff @(posedge clk) begin
  if(~resetn) begin
    state_r <= init;
    dout_r <= 0;
  end else begin
    case(state_r)
      init: begin
        if(din) begin 
          dout_r <= 0;
          state_r <= one_more_than_divisible_by_3;
        end
        else begin 
          dout_r <= 1;
          state_r <= divisible_by_3;
        end
      end
      divisible_by_3: begin
        if(din) begin 
          dout_r <= 0;
          state_r <= one_more_than_divisible_by_3;
        end
        else begin 
          dout_r <= 1;
          state_r <= divisible_by_3;
        end
      end
      one_more_than_divisible_by_3: begin
        if(din) begin 
          dout_r <= 1;
          state_r <= divisible_by_3;
        end
        else begin 
          dout_r <= 0;
          state_r <= one_less_than_divisible_by_3;
        end
      end
      one_less_than_divisible_by_3: begin
        if(din) begin 
          dout_r <= 0;
          state_r <= one_less_than_divisible_by_3;
        end
        else begin 
          dout_r <= 0;
          state_r <= one_more_than_divisible_by_3;
        end
      end
    endcase
  end
end

endmodule