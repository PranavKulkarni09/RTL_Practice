module tb_simple_dual_port_ram;

  parameter DATA_WIDTH = 8;
  parameter ADDR_WIDTH = 4;

  logic clk, rst;
  //For Port A
  logic wr_en_a, rd_en_a;
  //For Port B
  logic wr_en_b, rd_en_b;
  logic [ADDR_WIDTH-1:0] addr_a, addr_b;
  logic [DATA_WIDTH-1:0] wdata_a, wdata_b;
  logic [DATA_WIDTH-1:0] rdata_a, rdata_b;

  simple_dual_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (.clk(clk), .rst(rst), .wr_en_a(wr_en_a), .rd_en_a(rd_en_a), .addr_a(addr_a), .wdata_a(wdata_a), .rdata_a(rdata_a), .wr_en_b(wr_en_b), .rd_en_b(rd_en_b), .addr_b(addr_b), .wdata_b(wdata_b), .rdata_b(rdata_b));

  initial begin
    clk = 0;
  end
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    rst = 1;
    wr_en_a = 0; rd_en_a = 0;
    wr_en_b = 0; rd_en_b = 0;
    addr_a = 0; addr_b = 0;
    wdata_a = 0; wdata_b = 0;
    #20 rst = 0;

    // Write to Port A
    @(posedge clk);
    wr_en_a = 1; addr_a = 4'd3; wdata_a = 8'hAA;
    @(posedge clk);
    wr_en_a = 0;

    // Write to Port B
    @(posedge clk);
    wr_en_b = 1; addr_b = 4'd7; wdata_b = 8'h55;
    @(posedge clk);
    wr_en_b = 0;

    // Read from both ports
    @(posedge clk);
    rd_en_a = 1; addr_a = 4'd3;
    rd_en_b = 1; addr_b = 4'd7;
    @(posedge clk);
    rd_en_a = 0; rd_en_b = 0;

    // Collision test: same address write
    @(posedge clk);
    wr_en_a = 1; addr_a = 4'd5; wdata_a = 8'h11;
    @(posedge clk);
    wr_en_a = 0;

    @(posedge clk);
    wr_en_b = 1; addr_b = 4'd5; wdata_b = 8'h22;
    @(posedge clk);
    wr_en_b = 0;

    // Read after collision
    @(posedge clk);
    rd_en_a = 1; addr_a = 4'd5;
    rd_en_b = 1; addr_b = 4'd5;
    @(posedge clk);

    #50 $finish;
  end

  initial begin
    $dumpfile("simple_dual_port_ram.vcd");
    $dumpvars();
  end
endmodule
