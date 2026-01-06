module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);

  logic [DATA_WIDTH-1:0] temp;

  always@(*) begin
    int temp_dw = DATA_WIDTH;
    for(int i = 0; i<DATA_WIDTH; i++) begin
      temp[temp_dw-1] = din[i];
      temp_dw--;
    end
    if(temp===din) begin
      dout = 1;
    end
    else begin
      dout = 0;
    end
  end

endmodule
