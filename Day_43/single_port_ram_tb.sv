module single_port_ram_tb();

  reg [7:0] data;
  reg [5:0] address;
  reg en, write_enable, clk;
  wire [7:0] q;

  single_port_ram DUT (.*);

  always #5 clk = ~clk;

  initial begin
    
    clk = 0;
    en = 1;
    write_enable = 1;
    
    data = 8'hAA; address = 6'd5; #10;
    data = 8'h55; address = 6'd10; #10;
    data = 8'hF0; address = 6'd15; #10;

    write_enable = 0;

    address = 6'd5; #10;
    $display("Read from address 5: %h", q);

    address = 6'd10; #10;
    $display("Read from address 10: %h", q);

    address = 6'd15; #10;
    $display("Read from address 15: %h", q);

    address = 6'd20; #10;
    $display("Read from address 20 (uninitialized): %h", q);

    en = 0;
    address = 6'd5; #10;
    $display("Read with en=0 from address 5: %h", q);

    $finish;
  end

endmodule
