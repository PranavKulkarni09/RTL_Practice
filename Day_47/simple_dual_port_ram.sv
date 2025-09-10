
module simple_dual_port_ram #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 4)(clk, rst, wr_en_a, rd_en_a, addr_a, wdata_a, rdata_a, wr_en_b, rd_en_b, addr_b, wdata_b, rdata_b);

  input  logic clk, rst;

  // Port A
  input  logic wr_en_a, rd_en_a;
  input  logic [ADDR_WIDTH-1:0]    addr_a;
  input  logic [DATA_WIDTH-1:0]    wdata_a;
  output logic [DATA_WIDTH-1:0]    rdata_a;

  // Port B
  input  logic wr_en_b, rd_en_b;
  input  logic [ADDR_WIDTH-1:0]    addr_b;
  input  logic [DATA_WIDTH-1:0]    wdata_b;
  output logic [DATA_WIDTH-1:0]    rdata_b;
  
  logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

  always_ff @(posedge clk) begin
    if (wr_en_a)
      mem[addr_a] <= wdata_a;
    else if (wr_en_b)
      mem[addr_b] <= wdata_b;
  end

  // Port A read
  always_ff @(posedge clk) begin
    if (rd_en_a)
      rdata_a <= mem[addr_a];
  end

  // Port B read
  always_ff @(posedge clk) begin
    if (rd_en_b)
      rdata_b <= mem[addr_b];
  end

endmodule
