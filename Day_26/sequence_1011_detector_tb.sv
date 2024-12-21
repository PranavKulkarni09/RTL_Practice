module sequence_1011_detector_tb();
  
  logic in, clk, rst, out;
  
  sequence_1011_detector DUT (.*);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor($time, "| in: %b | out: %b", in, out);
    rst = 1;
    #20;
    rst = 0;
    
    repeat(10) begin
      in = $random %2;
      #10;
    end
    
    #500;
    $finish();
  end
endmodule
