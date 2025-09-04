module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
typedef enum logic[2:0] {
  init,
  divisible,
  mod1,
  mod2,
  mod3,
  mod4
} state_t;
state_t state_r;
logic dout_r;
assign dout = dout_r;
always_ff @(posedge clk) begin
  if(~resetn) begin
    state_r <= init;
    dout_r <= 0;
  end else begin
    dout_r <= 0;
    case(state_r)
      init: begin
        if(din) begin 
          state_r <= mod1;
        end
        else begin 
          dout_r <= 1;
          state_r <= divisible;
        end
      end
      divisible: begin
        if(din) begin 
          state_r <= mod1;
        end
        else begin 
          dout_r <= 1;
          state_r <= divisible;
        end
      end
      mod1: begin
        if(din) begin 
          state_r <= mod3;
        end
        else begin 
          state_r <= mod2;
        end
      end
      mod2: begin
        if(din) begin 
          dout_r <= 1;
          state_r <= divisible; 
        end
        else begin 
          state_r <= mod4;
        end
      end
      mod3: begin
        if(din) begin 
          state_r <= mod2; 
        end
        else begin 
          state_r <= mod1;
        end
      end
      mod4: begin
        if(din) begin 
          state_r <= mod4;
        end
        else begin 
          state_r <= mod3;
        end
      end
    endcase
  end
end

endmodule