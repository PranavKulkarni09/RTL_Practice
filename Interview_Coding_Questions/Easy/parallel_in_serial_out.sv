module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);

  logic [DATA_WIDTH-1:0] temp_shift;

  always @ (posedge clk) begin
    if(!resetn) begin
      temp_shift <= 0;
    end
    else if (din_en) begin
      temp_shift <= din;
    end
    else begin
      temp_shift = temp_shift >> 1;
    end
  end

  assign dout = temp_shift[0];

endmodule
