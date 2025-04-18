module binary_to_bcd_tb();

    logic [7:0] bin_in;
    logic [3:0] digit0, digit1, digit2;
    logic [11:0] bcd_out;

  binary_to_bcd uut (.bin_in(bin_in), .digit0(digit0), .digit1(digit1), .digit2(digit2), .bcd_out(bcd_out));
    always begin
        bin_in = $urandom_range(0, 255);
        #10;
    end

    initial begin
        $display("Time\tBinary\t\tBCD");
      $monitor("%0t\t%d\t\t%0b", $time, bin_in, bcd_out);
        #80 $finish;
    end

endmodule
