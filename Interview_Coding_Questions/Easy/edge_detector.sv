module model (
  input clk,
  input resetn,
  input din,
  output dout
);

  logic temp, detect;

  always@(posedge clk) begin
    if(!resetn) begin
      temp <= 1'b0;
      detect <= 1'b0;
    end
    else begin
      detect <= din & ~temp;
      temp <= din;
    end
  end

  assign dout = detect;

endmodule
