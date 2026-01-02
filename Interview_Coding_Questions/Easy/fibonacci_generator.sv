module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

  logic [DATA_WIDTH-1:0] temp_current, temp_previous;

  always @ (posedge clk) begin
    if(!resetn) begin
      temp_current <= 1;
      temp_previous <= 0;
    end
    else begin
      temp_current <= temp_current + temp_previous;
      temp_previous <= temp_current;
    end
  end

  assign out = temp_current;

endmodule
