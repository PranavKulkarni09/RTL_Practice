module gray_counter_tb();

    reg clk;
    reg reset_n;
    
    wire [3:0] gray_count;
    
    gray_counter dut (.clk(clk), .reset_n(reset_n), .gray_count(gray_count));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset_n = 0;
      
        $display("Time\tGray Count");
        $display("----------------");
        
        #10;
        $display("%4t\t%b", $time, gray_count);
        reset_n = 1;
        
        repeat (16) begin
            #10;
            $display("%4t\t%b", $time, gray_count);
        end
        
        reset_n = 0;
        #10;
        $display("%4t\t%b (reset)", $time, gray_count);
        
        #10 $finish;
    end
    
endmodule
