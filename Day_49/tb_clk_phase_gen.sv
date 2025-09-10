module tb_clk_phase_gen();

  reg clk, rst;
  wire clk_0, clk_90, clk_180, clk_270;

  clk_phase_gen dut (.clk(clk), .rst(rst), .clk_0(clk_0), .clk_90(clk_90), .clk_180(clk_180), .clk_270(clk_270));

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst = 1;
    #15 rst = 0;
    #100 $finish;
  end

  initial begin
    $dumpfile("clk_phase_gen.vcd");
    $dumpvars();
  end
endmodule
