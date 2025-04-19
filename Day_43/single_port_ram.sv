module single_port_ram (data, address, en, write_enable, clk, q);
  input [7:0] data;
  input [5:0] address;
  input en;
  input write_eable;
  input clk;
  output [7:0] q;

    reg [7:0] ram [0:31];
    reg [5:0] addr_reg;

    always @(posedge clk) begin
        if (en) begin
            if (write_enable)
                ram[address] <= data;
            else
                addr_reg <= address;
        end
    end

    assign q = (en && !write_enable) ? ram[addr_reg] : 8'bz;

endmodule
