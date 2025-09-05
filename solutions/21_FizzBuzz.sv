module model #(parameter
    FIZZ=3,
    BUZZ=5,
    MAX_CYCLES=100
) (
    input clk,
    input resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);
logic [$clog2(MAX_CYCLES)-1:0] counter_r;
logic [$clog2(MAX_CYCLES)-1:0] fizz_r;
logic [$clog2(MAX_CYCLES)-1:0] buzz_r;

assign fizzbuzz = fizz & buzz;

always_ff @ (posedge clk) begin
    if(~resetn) begin
        counter_r <= '0;
        fizz_r <= '0;
        buzz_r <= '0;
        fizz <= 1;
        buzz <= 1;
    end
    else begin
        fizz = 0;
        buzz = 0;

        if(fizz_r == FIZZ - 1) begin
            fizz_r <= 0;
            fizz <= 1;
        end 
        else fizz_r <= fizz_r + 1;

        if(buzz_r == BUZZ - 1) begin
            buzz_r <= 0;
            buzz <= 1;
        end 
        else buzz_r <= buzz_r + 1;

        if(counter_r == MAX_CYCLES - 1)begin
            counter_r <= 0;
            fizz_r <= 0;
            buzz_r <= 0;
            fizz <= 1;
            buzz <= 1;
        end
        else counter_r <= counter_r + 1;
    end
end
endmodule