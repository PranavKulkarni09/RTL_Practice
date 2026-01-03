module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);

  logic counting;
  logic [DATA_WIDTH-1:0] counter_temp;

    always @(posedge clk) begin
        if (reset) begin
            counter_temp <= 0;
            counting <= 0;
        end 
        else if (stop) begin
            counting <= 0;
        end
        else if (start || counting) begin
            counting <= 1;
            if (counter_temp == MAX) begin
                counter_temp <= 0;
            end else begin
                counter_temp <= counter_temp + 1;
            end
        end
    end

    assign count = counter_temp;

endmodule
