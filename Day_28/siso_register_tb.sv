module siso_register_tb();
  logic clk, rst, in, out;
  
  siso_register DUT (.*);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor($time, "| rst: %b | in: %b | out: %b | temp_out: %b", rst, in, out, DUT.temp_out);
    rst = 1;
    in = 0;
    #20;
    rst = 0;
    #10;
    repeat(10) begin
      in = $random %2;
      #10;
    end
    #150;
    $finish();
  end
endmodule
