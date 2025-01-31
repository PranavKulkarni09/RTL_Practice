module vending_machine_tb();
  logic clk, rst, out;
  logic [1:0] in, balance;
  
  vending_machine DUT (.*);
  
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    in = 1;
    #10 in = 1;
    #10 in = 1;
    #100 $finish();
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor("in = %b | balance = %b | out = %b", in, balance, out);
  end
  
  initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars;
  end
endmodule
