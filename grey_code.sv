module grey_code #(parameter  DATA_WIDTH = 4) 
(
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);


logic [DATA_WIDTH-1:0] q, q_d, temp;


    always_ff @(posedge clk) begin
        if (~resetn) begin
            q <= 0;
        end else begin
          q <= q_d;
        end
    end

    always_comb begin
        if (!resetn) begin
            q_d = 0;
            temp = 0;
        end else begin
            q_d = q + 1;

            for (int i = 0; i < DATA_WIDTH-1; i=i+1) begin
                temp[i] = q_d[i+1] ^ q_d[i];
            end

            temp[DATA_WIDTH-1] = q_d[DATA_WIDTH-1];
        end
    end
    
    assign out = temp;

endmodule : grey_code