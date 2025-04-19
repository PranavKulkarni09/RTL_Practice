module pwm_gen(clk, led);
  input clk;
  output [7:0] led;
	 
reg [7:0] counter=0;

always@(posedge clk)
begin
if(counter<100) begin
counter<= counter+8'b1;
end
else begin
counter<= 1'b0;
end
end
assign led[0]= (counter<10) ? 1 : 0;

assign led[1]= (counter<20) ? 1 : 0;

assign led[2]= (counter<30) ? 1 : 0;

assign led[3]= (counter<40) ? 1 : 0;

assign led[4]= (counter<50) ? 1 : 0;

assign led[5]= (counter<60) ? 1 : 0;

assign led[6]= (counter<70) ? 1 : 0;

assign led[7]= (counter<80) ? 1 : 0;

endmodule
