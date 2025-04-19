module synch_rom (clk, en, addr, data);
  
  input clk;
  input en;
  input [3:0] addr;
  output reg [3:0] data;

    reg [3:0] mem [0:15];

    always @(posedge clk) begin
        if (en)
            data <= mem[addr];
        else
            data <= 4'bz;
    end
  
    initial begin
        mem = '{ 
            4'b0010, 4'b0010, 4'b1110, 4'b0010, 
            4'b0100, 4'b1010, 4'b1100, 4'b0000, 
            4'b1010, 4'b0010, 4'b1110, 4'b0010, 
            4'b0100, 4'b1010, 4'b1100, 4'b0000 
        };
    end

endmodule
