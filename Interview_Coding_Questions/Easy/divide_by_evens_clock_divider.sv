module model (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);

  logic count_2;
  logic [1:0] count_4;
  logic [3:0] count_6;

  always@(posedge clk) begin
    if(!resetn) begin
      count_2 <= 0;
      count_4 <= 0;
      count_6 <= 0;
    end
    else begin
      count_2 <= count_2 + 1;
      count_4 <= count_4 + 1;
      count_6 <= (count_6 + 1) % 6;
    end
  end

  assign div2 = (count_2 == 1);
  assign div4 = (count_4 == 1) || (count_4 == 2);
  assign div6 = (count_6 == 1) || (count_6 == 2) || (count_6 == 3);

endmodule
