module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);

  logic [DATA_WIDTH-1:0] temp;

  always@(*) begin
    for(int i = 0; i<DATA_WIDTH; i++) begin
      temp[DATA_WIDTH-1-i] = din[i];
    end
    if(temp===din) begin
      dout = 1;
    end
    else begin
      dout = 0;
    end
  end

endmodule
