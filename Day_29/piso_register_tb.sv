module piso_register_tb();
    logic clk, rst, load, serial_out;
    logic [3:0] parallel_in;
  piso_register DUT (.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 0; load = 0; parallel_in = 4'b0000;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #10;
        load = 1;
        parallel_in = 4'b1011;
        #10;
        load = 0;
        #50;
        load = 1;
        parallel_in = 4'b1100;
        #10;
        load = 0;
        #100;
      $finish();
    end
  
    initial begin
        $monitor("Time=%0t | Reset=%b | Load=%b | Parallel In=%b | Shift Register=%b | Serial Out=%b", $time, rst, load, parallel_in, DUT.shift_reg, serial_out);
    end
endmodule
