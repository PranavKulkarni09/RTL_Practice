module traffic_light_controller_tb();
    logic clk, rst;
    logic red, yellow, green, ped_red, ped_green;

  traffic_light_controller DUT (.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;

        #100 $finish;
    end

    initial begin
      $monitor("Time=%0t | Vehicle_at_R=%b | Vehicle_at_Y=%b | Vehicle_at_G=%b | Ped_at_R=%b Ped_at_G=%b", 
                 $time, red, yellow, green, ped_red, ped_green);
    end
endmodule
