module token_bucket_algorithm_tb();

    logic clk, rst, packet_in, packet_out;

  token_bucket_algorithm DUT (.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        packet_in = 0;

        #10 rst = 0;

        #10 packet_in = 1;
        #10 packet_in = 0;
        #10 packet_in = 1;
        #10 packet_in = 0;

        #10 packet_in = 1;
        #10 packet_in = 1;
        #10 packet_in = 0;

        #50 packet_in = 1;
        #10 packet_in = 0;

        #100 $finish;
    end

    initial begin
        $monitor("Time=%0t | Tokens=%0d | Packet In=%b | Packet Out=%b",
                 $time, DUT.tokens, packet_in, packet_out);
    end

endmodule
