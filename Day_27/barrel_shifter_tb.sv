module barrel_shifter_tb();
  logic [7:0] in, out;
  logic [2:0] N;
  logic leftOrRight;
  
  barrel_shifter DUT (.*);
  
  initial begin
    $monitor($time, "| in: %b | leftOrRight: %b by N: %d bits | out: %b", in, leftOrRight, N, out);
  end
  
  initial begin
    //To check for left shift:
    in = 8'b11001101;
    leftOrRight = 1'b0;
    N = 3'b000;
    #10;
    in = 8'b11001101;
    leftOrRight = 1'b0;
    N = 3'b011;
    #10;
    in = 8'b11001101;
    leftOrRight = 1'b0;
    N = 3'b100;
    #10;
    //To check for right shift
    in = 8'b11001101;
    leftOrRight = 1'b1;
    N = 3'b000;
    #10;
    in = 8'b11001101;
    leftOrRight = 1'b1;
    N = 3'b011;
    #10;
    in = 8'b11001101;
    leftOrRight = 1'b1;
    N = 3'b100;
    #10;
  end
endmodule
