module Universal_Shift_Register_tb();
  logic clk, rst;
  logic [1:0] MODE;
  logic [3:0] DATAIN, DATAOUT;
  Universal_Shift_Register DUT (.*);
  initial begin
    clk =0; MODE = 2'b00; DATAIN = 4'b0000;
    rst = 1; #20; rst = 0; #20;
    #20 MODE = 2'b01; DATAIN = 4'b0011;
    #20  MODE = 2'b10; DATAIN = 4'b0111;
    #20 MODE = 2'b11; DATAIN = 4'b1010;
    #200 $finish();
  end
  
  always #5 clk=~clk;
  
  initial begin
    $monitor(" Time=%t | Mode =%b | DATAIN=%b | DATAOUT=%b", $time, MODE, DATAIN, DATAOUT);
  end    
endmodule
