module elevator(clk, rst, in, out, up, down);
  input logic clk, rst;
  input logic [1:0] in;
  output logic [1:0] out;
  output logic up, down;
  
  typedef enum logic[1:0] {GROUND = 2'b00, FIRST = 2'b01, SECOND = 2'b10} state_t;
  
  state_t c_state, n_state;
  
  always_ff@(posedge clk) begin
    if(rst) begin
      c_state <= GROUND;
    end
    else begin
      c_state <= n_state;
    end
  end
  
  always_comb begin
    n_state = c_state; up = 0; down = 0;
    case(c_state)
      GROUND: begin
  if(in == GROUND) begin
    n_state = GROUND; up = 0; down = 0;
  end
        else if(in == FIRST) begin
    n_state = FIRST; up = 1; down = 0;
  end
  else if(in == SECOND) begin
    n_state = SECOND; up = 1; down = 0;
  end
end

FIRST: begin
  if(in == GROUND) begin
    n_state = GROUND; up = 0; down = 1;
  end
  else if(in == FIRST) begin
    n_state = FIRST; up = 0; down = 0;
  end
  else if(in == SECOND) begin
    n_state = SECOND; up = 1; down = 0;
  end
end

SECOND: begin
  if(in == GROUND) begin
    n_state = GROUND; up = 0; down = 1;
  end
  else if(in == FIRST) begin
    n_state = FIRST; up = 1; down = 1;
  end
  else if(in == SECOND) begin
    n_state = SECOND; up = 0; down = 0;
  end
end
    endcase
  end
  
  assign out = c_state;
endmodule
