module booth_algorithm_tb;

    reg signed [3:0] a, b;
    wire signed [7:0] out;

  booth_algorithm uut (.multiplier(a), .multiplicand(b), .product(out));

    initial begin
        a = 4'sd3;  b = 4'sd7;   #10;
        a = 4'sd3;  b = -4'sd7;  #10;
        a = -4'sd3; b = -4'sd7;  #10;
        a = 4'sd5;  b = 4'sd6;   #10;
        a = 4'sd5;  b = -4'sd6;  #10;
        a = -4'sd5; b = -4'sd6;  #10;
    end

    initial begin
      $monitor("Number: %0d, Multiplied by: %0d => Product: %0d", a, b, out);
        #60 $finish;
    end

endmodule
