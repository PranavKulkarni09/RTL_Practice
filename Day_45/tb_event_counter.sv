module tb_event_counter;

  logic clk, rst, enable, event_in;
  logic [7:0] threshold;
  logic [7:0] count;
  logic irq;

  event_counter dut (.clk(clk), .rst(rst), .enable(enable), .event_in(event_in), .threshold(threshold), .count(count), .irq(irq));
  
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst = 1; enable = 0; event_in = 0; threshold = 8'd5;
    #20 rst = 0;

    enable = 1;

    repeat(5) begin
      #15 event_in = 1;
      #10 event_in = 0;
    end
    #50;

    threshold = 8'd3;
    rst = 1; #10 rst = 0;
    repeat(3) begin
      #15 event_in = 1;
      #10 event_in = 0;
    end

    #50 $finish;
  end

  initial begin
    $dumpfile("event_counter.vcd");
    $dumpvars();
  end
endmodule
