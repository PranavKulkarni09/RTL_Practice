module Universal_Shift_Register(clk, rst, MODE, DATAIN, DATAOUT);
  input logic clk, rst;
  input logic [1:0] MODE;
  input logic [3:0] DATAIN;
  output logic [3:0] DATAOUT;
  
  always @(posedge clk)
  begin
    if(rst)
      DATAOUT <= 0;
    else
      begin
        case(MODE)
          2'b00 : DATAOUT <= DATAOUT;
          2'b01 : DATAOUT <= {DATAIN[0], DATAIN[3:1]}; 
          2'b10 : DATAOUT <= {DATAIN[2:0], DATAIN[3]};
          2'b11 : DATAOUT <= DATAIN;
        endcase
      end
  end
endmodule 
