module tb_glitch_filter();

  parameter WIDTH = 8;
  logic clk, rst;
  logic signal_in;
  logic [WIDTH-1:0] hold_time;
  logic signal_out;

  glitch_filter #(.WIDTH(WIDTH)) dut (.clk(clk), .rst(rst), .signal_in(signal_in), .hold_time(hold_time), .signal_out(signal_out));

  initial begin
    clk = 0;
  end
  always #5 clk = ~clk;

  initial begin
    rst = 1; signal_in = 0; hold_time = 8'd4;
    #20 rst = 0;

    signal_in = 1;
    repeat(2) @(posedge clk);
    signal_in = 0;
    repeat(2) @(posedge clk);

    signal_in = 1;
    repeat(5) @(posedge clk);
    signal_in = 0;
    repeat(2) @(posedge clk);

    signal_in = 1;
    @(posedge clk);
    signal_in = 0;
    repeat(2) @(posedge clk);

    signal_in = 1;
    repeat(10) @(posedge clk);
    signal_in = 0;

    #50 $finish;
  end

  initial begin
    $dumpfile("glitch_filter.vcd");
    $dumpvars();
  end
endmodule
