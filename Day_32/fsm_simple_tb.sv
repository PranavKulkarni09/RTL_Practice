module fsm_simple_tb();
  logic clk, rst, in;
  logic [1:0] state;
  
  fsm_simple DUT (.*);
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0; rst = 0; in = 0;
    #10;
    rst = 1;
    #10;
    rst = 0;
    #10;
    in = 1;
    #10;
    in = 1;
    #10;
    in = 0;
    #10;
    in = 1;
    #50;
    $finish();
  end
  
  initial begin
    $monitor($time, " | rst = %b | in = %b | state = %b", rst, in , state);
  end
endmodule
