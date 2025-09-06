module model (
    input [7:0] din,
    input [2:0] addr,
    input wr,
    input rd,
    input clk,
    input resetn,
    output logic [7:0] dout,
    output logic error
);
    logic[7:0] registerfile [8];
    logic register_written[8];

    always_ff @(posedge clk) begin
        if(~resetn) begin
            for(int i = 0; i < 8; i++) begin
                register_written[i] <= 0;
            end
            error <= 0;
            dout <= 0;
        end
        else begin
            error <= 0;
            dout <= 0;
            if(rd & wr) begin
                dout <= 0;
                error <= 1;
            end 
            else if(rd) begin
                error <= 0;
                if(register_written[addr]) dout <= registerfile[addr];
                //else dout <= 0;
                //dout <= registerfile[addr];
            end
            else if(wr) begin
                error <= 0;
                registerfile[addr] <= din;
                register_written[addr] <= 1'b1;
            end
        end
    end
endmodule