module door_lock(clk, rst, entered_password, in, door_unlock, error);
  input logic clk, rst, in;
  input logic [3:0] entered_password;
  output logic door_unlock, error;
    
  parameter logic [3:0] PASSWORD = 4'b1110;

    typedef enum logic [1:0] {LOCKED = 2'b00, CHECK = 2'b01, UNLOCKED = 2'b10} state_t;
    state_t c_state, n_state;

  always_ff @(posedge clk or posedge rst) begin
      if (rst)
            c_state <= LOCKED;
        else
            c_state <= n_state;
    end

    always_comb begin
        n_state = c_state;
        door_unlock = 0;
        error = 0;

        case (c_state)
            LOCKED: begin
              if (in) 
                    n_state = CHECK;
            end

            CHECK: begin
                if (entered_password == PASSWORD)
                    n_state = UNLOCKED;
                else begin
                    n_state = LOCKED;
                    error = 1;
                end
            end

            UNLOCKED: begin
                door_unlock = 1;
                n_state = LOCKED;
            end
        endcase
    end
endmodule
