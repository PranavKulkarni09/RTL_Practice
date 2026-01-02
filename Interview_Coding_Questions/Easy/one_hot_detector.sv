module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);

  int count;

  always@(*)  begin
    count = 0;
    for(int i = 0; i<DATA_WIDTH; i++) begin
      if(din[i]==1'b1) begin
        count++;
      end
    end
    if(count==1) begin
      onehot = 1'b1;
    end
    else begin
      onehot = 1'b0;
    end
  end

endmodule
