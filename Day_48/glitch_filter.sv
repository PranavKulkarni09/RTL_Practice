module glitch_filter #(parameter WIDTH = 8)( clk, rst, signal_in, hold_time, signal_out);
  
  input  logic clk, rst, signal_in;
  input  logic [WIDTH-1:0] hold_time;
  output logic signal_out;

  logic [WIDTH-1:0] counter;
  logic             stable;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      counter     <= 0;
      signal_out  <= 0;
      stable      <= 0;
    end else begin
      if (signal_in) begin
        if (!stable)
          counter <= counter + 1;

        if (counter >= hold_time) begin
          stable     <= 1;
          signal_out <= 1;
        end
      end else begin
        counter     <= 0;
        stable      <= 0;
        signal_out  <= 0;
      end
    end
  end
endmodule
