module piso_register (clk, rst, load, parallel_in, serial_out);
  input logic clk, rst, load;
  input logic [3:0] parallel_in;
  output logic serial_out;
  logic [3:0] shift_reg;
  
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      shift_reg <= 4'b0000;
      serial_out <= 0;
    end else if (load) begin
      shift_reg <= parallel_in;
    end else begin
      serial_out <= shift_reg[0];
      shift_reg <= {1'b0, shift_reg[3:1]};
    end
  end
endmodule
