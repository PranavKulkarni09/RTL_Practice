module barrel_shifter(in, N, leftOrRight, out);
  input leftOrRight; //0 for Left and 1 for Right
  input [7:0] in;
  input [2:0] N;
  output reg [7:0] out;
  
  reg [7:0] shift_result;
  
  always@(*) begin
    case(leftOrRight)
      1'b0 : shift_result = (N==3'd0) ? in : (N==3'd1) ? {in[6:0], 1'b0} : (N==3'd2) ? {in[5:0], 2'b00} : (N==3'd3) ? {in[4:0], 3'b000} : (N==3'd4) ? {in[3:0], 4'b000} : (N==3'd5) ? {in[2:0], 5'b0} : (N==3'd6) ? {in[1:0], 6'b0} : {in[0], 7'b0};
      
      
      1'b1 : shift_result = (N==3'd0) ? in : (N==3'd1) ? {1'b0, in[6:0]} : (N==3'd2) ? {2'b0, in[5:0]} : (N==3'd3) ? {3'b0, in[4:0]} : (N==3'd4) ? {4'b0, in[3:0]} : (N==3'd5) ? {5'b0, in[2:0]} : (N==3'd6) ? {6'b0, in[1:0]} : {7'b0, in[0]};
    endcase
  end
  assign out = shift_result;
endmodule
