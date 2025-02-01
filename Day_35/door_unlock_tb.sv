module door_lock_tb();
    logic clk, rst, in, door_unlock, error;;
    logic [3:0] entered_password;

  door_lock DUT (.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        entered_password = 4'b0000;
        in = 0;

        #10 rst = 0;

        #10 entered_password = 4'b1100;
        in = 1;
        #10 in = 0;

        #20 entered_password = 4'b1110;
        in = 1;
        #10 in = 0;

        #20 entered_password = 4'b1110;
        in = 1;
        #10 in = 0;

        #50 $finish;
    end

    initial begin
        $monitor("Time=%0t | Password=%b | Enter=%b | Unlock=%b | Error=%b",
                 $time, entered_password, in, door_unlock, error);
    end
endmodule
