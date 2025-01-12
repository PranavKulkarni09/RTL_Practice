module fsm_simple(clk, rst, in, state);
  input logic clk, rst, in;
  output logic [1:0] state;
  
  typedef enum logic [1:0] {IDLE = 2'b00, S1 = 2'b01, S2 = 2'b10} state_transition;
  
  state_transition c_state, n_state;
  
  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      c_state <= IDLE;
    end
    else begin
      c_state <= n_state;
    end
  end
  
  always_comb begin
    case(state)
      IDLE: n_state = in ? S1 : IDLE;
      S1: n_state = in ? S2 : S1;
      S2: n_state = in ? IDLE : S2;
      default: n_state = IDLE;
    endcase
  end
  
  assign state = c_state;
endmodule
