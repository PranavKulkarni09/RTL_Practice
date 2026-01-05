module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  typedef enum [1:0] {Sres = 2'd0, Szero = 2'd1, Sone = 2'd2, Stwo = 2'd3} state;
  state curr_state, next_state;

  always@(posedge clk) begin
    if(!resetn) begin
      curr_state <= Sres;
    end
    else begin
      curr_state <= next_state;
    end
  end

  always@(*) begin
    case(curr_state)
    Sres: begin
      next_state = din ? Sone : Szero;
    end
    Szero: begin
      next_state = din ? Sone : Szero;
    end
    Sone: begin
      next_state = din ? Szero : Stwo;
    end
    Stwo: begin
      next_state = din ? Stwo : Sone;
    end
    endcase
  end

  always@(*) begin
    dout = (curr_state == Szero);
  end

endmodule
