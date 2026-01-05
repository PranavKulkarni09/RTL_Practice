module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
  parameter S0=0, S1=1, S10=2, S101=3;
  logic [1:0] state;

  always @ (posedge clk) begin
    if(!resetn) begin
      state <= S0;
      dout <= 0;
    end
    else begin
      case(state)
      S0: begin
        state <= din? S1 : S0;
        dout <= 0;
      end
      S1: begin
        state <= din? S1 : S10;
        dout <= 0;
      end
      S10: begin
        state <= din? S101 : S0;
        dout <= 0;
      end
      S101: begin
        state <= din? S1 : S10;
        dout <= din? 0 : 1;
      end
      endcase
    end
  end

endmodule
