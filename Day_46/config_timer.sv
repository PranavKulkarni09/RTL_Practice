module config_timer (clk, rst, start, auto_restart, limit, count, done);
  
  input  logic clk, rst, start, auto_restart;
  input  logic [15:0] limit;
  output logic [15:0] count;
  output logic done;
  
  typedef enum logic [1:0] {IDLE, RUNNING, DONE} state_t;
  state_t ps, ns;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      ps <= IDLE;
    else
      ps <= ns;
  end

  always_comb begin
    ns = ps;
    case (ps)
      IDLE:     ns = start ? RUNNING : IDLE;
      RUNNING:  ns = (count == limit) ? DONE : RUNNING;
      DONE:     ns = auto_restart ? RUNNING : IDLE;
      default:  ns = IDLE;
    endcase
  end

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      count <= 0;
    else if (ps == RUNNING)
      count <= count + 1;
    else if (ps == DONE && auto_restart)
      count <= 0;
    else if (ps == IDLE)
      count <= 0;
  end

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      done <= 0;
    else
      done <= (ps == RUNNING && count == limit);
  end
endmodule
