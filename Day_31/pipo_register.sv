module pipo_register(clk, rst, load, in, out);
  input logic clk, rst, load;
  input logic [3:0] in;
  output logic [3:0] out;
  logic [3:0] data;
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      data <= 4'b0000;
    end
    else if (load) begin
      data <= in;
    end
  end
  
  assign out = data;
endmodule
