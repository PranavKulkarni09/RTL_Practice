module sipo_register_tb();
  logic clk, serial_in;
  logic [3:0] serial_out;
  sipo_register DUT (.clk(clk), .serial_in(serial_in), .out(serial_out));
  
  always #10 clk=~clk;
  
  initial
    begin
      clk=0;
      serial_in=1'b1;
      #20;
      serial_in=1'b0;
      #20;
      serial_in=1'b1;
      #20;
      serial_in=1'b0;
      #100;
      $finish();
    end
  
  initial begin
    $monitor($time, " | serial_in = %b | serial_out = %b", serial_in, serial_out);
  end
endmodule
