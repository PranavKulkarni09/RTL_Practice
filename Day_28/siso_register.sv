module siso_register(clk, rst, in, out);
  input clk, rst, in;
  output reg out;
  reg [3:0] temp_out;
  
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      temp_out <= 4'b0;
      out <= 1'b0;
    end
    else begin
      temp_out <= temp_out << 1;
      temp_out[0] <= in;
      out = temp_out[3];
    end
  end
endmodule
