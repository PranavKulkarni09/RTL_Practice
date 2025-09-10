module clk_phase_gen (clk, rst, clk_0, clk_90, clk_180, clk_270);
  
  input  wire clk, rst;
  output wire clk_0, clk_90, clk_180, clk_270;

  reg [1:0] phase_counter;
  reg toggle;

  always @(posedge clk or posedge rst) begin
    if (rst)
      phase_counter <= 2'b00;
    else
      phase_counter <= {~phase_counter[0], phase_counter[1]};
  end

  always @(posedge clk or posedge rst) begin
    if (rst)
      toggle <= 1'b0;
    else
      toggle <= ~toggle;
  end

  assign clk_0   = phase_counter[1];
  assign clk_90  = phase_counter[1] ^ toggle;
  assign clk_180 = ~phase_counter[1];
  assign clk_270 = ~clk_90;
endmodule
