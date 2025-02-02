module traffic_light_controller #(parameter int T_GREEN = 10, T_YELLOW = 3, T_RED = 8, T_ALL_RED = 2)(clk, rst, red, yellow, green, ped_red, ped_green);
  input logic clk, rst;
  output logic red, yellow, green, ped_red, ped_green;
  
  typedef enum logic [1:0] {GREEN_STATE = 2'b00, YELLOW_STATE = 2'b01, RED_STATE    = 2'b10, ALL_RED = 2'b11} state_t;
  
  state_t c_state, n_state;
  int timer;
  always_ff @(posedge clk) begin
    if (rst) begin
      c_state <= GREEN_STATE;
      timer <= 0;
    end
    else begin
      if (timer == 0) begin
        c_state <= n_state;
        case (n_state)
          GREEN_STATE: timer <= T_GREEN;
          YELLOW_STATE: timer <= T_YELLOW;
          RED_STATE: timer <= T_RED;
          ALL_RED: timer <= T_ALL_RED;
        endcase
      end
      else
        timer <= timer - 1;
    end
  end
  
  always_comb begin
    n_state = c_state;
    red = 0; yellow = 0; green = 0; ped_red = 0; ped_green = 0;
    case (c_state)
      GREEN_STATE: begin
        green = 1;
        ped_red = 1;
        if (timer == 0)
          n_state = YELLOW_STATE;
      end
      YELLOW_STATE: begin
        yellow = 1;
        ped_red = 1;
        if (timer == 0)
          n_state = RED_STATE;
      end
      RED_STATE: begin
        red = 1;
        ped_green = 1;
        if (timer == 0)
          n_state = ALL_RED;
      end
      ALL_RED: begin
        red = 1;
        ped_red = 1;
        if (timer == 0)
          n_state = GREEN_STATE;
      end
    endcase
  end
endmodule
