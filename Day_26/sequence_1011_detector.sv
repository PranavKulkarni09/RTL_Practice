module sequence_1011_detector(in, clk, rst, out);
  input in, clk, rst;
  output reg out;
  
  typedef enum logic [3:0] { IDLE = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0101, S4 = 4'b1011} state;
  
  /*IDLE state = 0000
    S1 state = 0001
    S2 state = 0010
    S3 state = 0101
    S4 state = 1011*/
  
  state c_state, n_state;
  
  always@(posedge clk or posedge rst) begin
    if(rst)
      c_state <= IDLE;
    else
      c_state <= n_state;
  end
  
  always_comb begin
    case(c_state)
      IDLE : n_state = in ? S1 : IDLE;
      S1   : n_state = in ? S1 : S2;
      S2   : n_state = in ? S3 : IDLE;
      S3   : n_state = in ? S4 : S2;
      S4   : n_state = in ? S1 : S2;
      default : n_state = IDLE;
    endcase
  end
  
  always_comb begin
    out = (c_state==S4);
  end
endmodule
