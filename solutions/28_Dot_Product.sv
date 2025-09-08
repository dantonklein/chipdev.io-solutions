module model (
    input [7:0] din,
    input clk,
    input resetn,
    output reg [17:0] dout,
    output reg run
);
    logic [7:0] entries[5];
    logic [2:0] count_r;

    always_ff @(posedge clk) begin
        if(~resetn) begin
            count_r <= '0;
            run <= 1;
            dout <= 0;
        end
        else begin
            entries[count_r] <= din;
            count_r <= count_r + 1;
            run <= 0;
            if(count_r == 5) begin
                run <= 1;
                count_r <= 0;
                dout <= ({1'b0,entries[0]} * {1'b0,entries[3]}) + ({1'b0,entries[1]} * {1'b0,entries[4]}) + ({1'b0,entries[2]} * {1'b0,din});
            end
        end
    end
endmodule