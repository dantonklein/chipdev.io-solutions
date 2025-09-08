module model #(parameter
    DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] codeIn,
    output reg isThermometer
);
    logic[$clog2(DATA_WIDTH)-1:0] times_different;
    always_comb begin
        times_different = 0;
        for(int i = 0; i < DATA_WIDTH - 1; i++) begin
            times_different += (codeIn[i] != codeIn[i + 1]);
        end
        isThermometer = (times_different == 1);
    end
endmodule