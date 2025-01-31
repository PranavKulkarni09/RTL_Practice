module elevator_tb();
  logic clk, rst, up, down;
  logic [1:0] in, out;
  
  elevator DUT(.*);
  
  initial begin
    clk = 0;
    rst = 1;
    in = 2'b00;
    #10 rst = 0;
    #10 in = 2'b01;
    #20 in = 2'b00;
    #20 in = 2'b10;
    #20 in = 2'b00;
    #50 $finish();
  end
  
  always #5 clk = ~clk;
  
  
  initial begin
    $dumpfile("elevator.vcd");
    $dumpvars;
    $monitor("time = %t | in = %b | out = %b | up = %d | down = %d", $time, in, out, up, down);
  end
endmodule
