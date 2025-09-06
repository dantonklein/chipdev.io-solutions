//this question is poorly written its hilarious

module model #(parameter
    DATA_WIDTH=8
) (
    input clk,
    input resetn,
    input [DATA_WIDTH-1:0] din,
    input wr,
    output logic [DATA_WIDTH-1:0] dout,
    output logic full,
    output logic empty
);
    typedef enum logic [1:0] {
        Empty,
        Intermediate,
        Full
    } state_t;
    state_t state_r;
    logic[DATA_WIDTH-1:0] entries[2];
    logic first_ptr;
    logic last_ptr;
    
    always_ff @(posedge clk) begin
        if(~resetn) begin
            entries[0] <= 0;
            entries[1] <= 0;
            state_r <= Empty;
            first_ptr <= 0;
            last_ptr <= 0;
        end
        else begin
            case(state_r)
                Empty: begin
                    if(wr) begin
                        state_r <= Intermediate;
                        entries[last_ptr] <= din;
                        last_ptr++;
                    end
                end
                Intermediate: begin
                    if(wr) begin
                        state_r <= Full;
                        entries[last_ptr] <= din;
                    end
                end
                Full: begin
                    if(wr) begin
                        entries[first_ptr] <= din;
                        last_ptr <= first_ptr;
                        first_ptr <= last_ptr;
                    end
                end
            endcase
        end
    end
    always_comb begin
        empty = state_r == Empty;
        full = state_r == Full;
        dout = entries[first_ptr];
    end

endmodule