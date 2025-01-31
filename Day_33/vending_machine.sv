module vending_machine(clk, rst, in, out, balance);
  input clk, rst;
  input [1:0] in;
  output reg out;
  output reg [1:0] balance;
  typedef enum logic [1:0] {IDLE = 2'b00, S1 = 2'b01, S2 = 2'b10} state_t;
  state_t c_state, n_state;
  always@(posedge clk) begin
    if(rst) begin
      c_state <= IDLE;
    end
    else begin
      c_state <= n_state;
    end
  end
  always_comb begin
    case(c_state)
        IDLE: if(in==0) begin
          n_state = IDLE;
          out = 0;
          balance = 2'b00;
        end
        else if(in==2'b01) begin
          n_state = S1;
          out = 0;
          balance = 2'b00;
        end
        else if(in==2'b10) begin
          n_state = S2;
          out = 0;
          balance = 2'b00;
        end
        S1: if(in==0) begin
          n_state = IDLE;
          out = 0;
          balance = 2'b01;
        end
        else if(in==2'b01) begin
          n_state = S2;
          out = 0;
          balance = 2'b00;
        end
        else if(in==2'b10) begin
          n_state = IDLE;
          out = 1;
          balance = 2'b00;
        end
        S2: if(in==0) begin
          n_state = IDLE;
          out = 0;
          balance = 2'b10;
        end
        else if(in==2'b01) begin
          n_state = IDLE;
          out = 1;
          balance = 2'b00;
        end
        else if(in==2'b10) begin
          n_state = IDLE;
          out = 1;
          balance = 2'b01;
        end
      endcase
  end
endmodule
