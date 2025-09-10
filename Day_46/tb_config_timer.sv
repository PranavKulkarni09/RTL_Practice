module tb_config_timer();

  logic clk, rst, start, auto_restart;
  logic [15:0] limit;
  logic [15:0] count;
  logic done;

  config_timer dut ( .clk(clk), .rst(rst), .start(start), .auto_restart(auto_restart), .limit(limit), .count(count), .done(done));

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst = 1;
    start = 0;
    auto_restart = 0;
    limit = 16'd5;
    #20 rst = 0;

    #10 start = 1;
    #10 start = 0;

    wait(done);
    $display("Timer finished at count = %0d", count);

    auto_restart = 1;
    #10 start = 1;
    #10 start = 0;

    repeat(2) begin
      wait(done);
      $display("Auto-restart triggered at count = %0d", count);
      #10;
    end
    #50 $finish;
  end
  
  initial begin
    $dumpfile("timer_simple.vcd");
    $dumpvars(0, tb_configurable_timer_simple);
  end
endmodule
