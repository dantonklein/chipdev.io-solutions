`include "full_adder.sv"
module model #(parameter
    DATA_WIDTH=8
) (
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output logic [DATA_WIDTH-0:0] sum,
    output logic [DATA_WIDTH-1:0] cout_int
);
    logic[DATA_WIDTH:0] carries;
    assign carries[0] = 1'b0;
    generate
        for (genvar  i = 0; i < DATA_WIDTH; i++) begin
            full_adder FA (
                .a(a[i]),
                .b(b[i]),
                .cin(carries[i]),
                .sum(sum[i]),
                .cout(carries[i+1])
            );
        end
    endgenerate

    assign cout_int = carries[DATA_WIDTH:1];
    assign sum[DATA_WIDTH] = carries[DATA_WIDTH];
endmodule