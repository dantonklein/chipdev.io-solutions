module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);
typedef enum logic {
  yes_count,
  no_count
} state_t;
state_t state_r;

logic[DATA_WIDTH-1:0] count_r;
assign count = count_r;
  always_ff @(posedge clk) begin
    if(reset) begin
      count_r <= '0;
      state_r <= no_count;
    end
    else begin
      case(state_r)
        yes_count: begin
          if(stop) state_r <= no_count;
          else if(count_r == MAX) count_r <= 0;
          else count_r <= count_r + 1;
        end
        no_count: begin
          if(!stop & start) begin
            if(count_r == MAX) count_r <= 0;
            else count_r <= count_r + 1;
            state_r <= yes_count;
          end
        end
      endcase
    end
  end
endmodule