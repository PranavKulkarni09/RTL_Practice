module tb_vedic_mul_2x2();
  
  reg  [1:0] a, b;
  wire [3:0] product;
  
  vedic_mul_2x2 dut (.a(a), .b(b), .product(product));
  
  initial begin
    a = 2'd2;
    b = 2'd1;
    #10;

    a = 2'd3;
    b = 2'd2;
    #10;

    a = 2'd0;
    b = 2'd1;
    #10;
    
    a = 2'd3;
    b = 2'd1;
    #10;

    a = 2'd2;
    b = 2'd2;
    #10;

    a = 2'd3;
    b = 2'd3;
    #10;

    #20 $finish();
  end
    
  initial begin
    $monitor("Time %0t: %0d * %0d = %0d", $time, a, b, product);
  end
endmodule
