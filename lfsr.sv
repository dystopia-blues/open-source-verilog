module lfsr (
    input logic clk,
    input logic rst,
    output logic [31:0] lfsr
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr <= 32'hFFFFFFFF; // Initial seed
        end else begin
            lfsr <= {lfsr[30:0], lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0]};
        end
    end

endmodule : lfsr