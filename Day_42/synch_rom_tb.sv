module synch_rom_tb();

    reg clk;
    reg en;
    reg [3:0] addr;
    wire [3:0] data;

  synch_rom DUT (.clk(clk), .en(en), .addr(addr), .data(data));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tEN\tADDR\tDATA");
        $monitor("%0t\t%b\t%h\t%b", $time, en, addr, data);

        en = 1;
        addr = 0; #10;
        addr = 1; #10;
        addr = 2; #10;
        addr = 3; #10;
        addr = 4; #10;
        addr = 5; #10;
        addr = 6; #10;
        addr = 7; #10;

        en = 0;
        addr = 8; #10;
        addr = 9; #10;

        $finish;
    end

endmodule
