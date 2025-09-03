module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
  typedef enum logic [1:0] {
    reset,
    first,
    second,
    third
  } state_t;
  state_t state_r;

  always_ff @(posedge clk) begin

    if(!resetn) begin
      dout <= 0;
      state_r <= reset;
    end else begin
      dout <= 0;
      state_r <= reset;
      case(state_r)
        reset: begin
          if(din) state_r <= first;
        end
        first: begin
          if(!din) state_r <= second;
          else state_r <= first;
        end
        second: begin
          if(din) state_r <= third;
        end
        third: begin
          if(!din) begin
            dout <= 1;
            state_r <= second;
          end 
          else state_r <= first;
        end
      endcase
    end
  end
endmodule