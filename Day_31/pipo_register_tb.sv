module pipo_register_tb( );
  logic clk, rst, load;
  logic [3:0] in, out;
  pipo_register DUT (.*);
  
  always #10 clk = ~clk;
  
  initial
    begin
      clk = 0; rst = 0; load = 0; in = 4'b0000;
      #10; 
      rst = 1;
      #10;
      rst = 0;
      #10;
      load = 1;
      in = 4'b1011;
      #50;
      load = 1;
      in = 4'b1110;
      #100;
      $finish();
    end
  
  initial begin
    $monitor($time, " | load = %b | in = %b | out = %b", load, in, out);
  end
endmodule
