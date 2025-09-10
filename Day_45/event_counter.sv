module event_counter(clk, rst, enable, event_in, threshold, count, irq);
  input logic clk, rst, enable, event_in;
  input logic [7:0] threshold;
  output logic [7:0] count;
  output logic irq;
  
  logic event_in_d, rising_edge;
  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) begin
      event_in_d <= 0;
    end
    else begin
      event_in_d <= event_in;
    end
  end
  
  assign rising_edge = event_in &~event_in_d;
  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) begin
      count <= 0;
    end
    else if (enable && rising_edge) begin
      count <= count + 1;
    end
  end
  
  always_ff@(posedge clk or posedge rst) begin
    if(rst) begin
      irq <= 0;
    end
    else begin
      irq <= (enable && rising_edge && (count + 1 == threshold));
    end
  end
endmodule
