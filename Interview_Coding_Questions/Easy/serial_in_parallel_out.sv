module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);

  logic [DATA_WIDTH-1:0] temp;

  always @ (posedge clk) begin
    if(!resetn) begin
      temp <= 0;
    end
    else begin
      temp <= (temp<<1) + din;
    end
  end

  assign dout = temp;

endmodule
