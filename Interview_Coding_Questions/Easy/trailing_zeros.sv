module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

  logic [$clog2(DATA_WIDTH):0] temp;

  always@(*) begin
    if(din === 'b0) begin
      dout = DATA_WIDTH;
    end
    else begin
      temp = 0;
      for(int i = 0; i<DATA_WIDTH; i++) begin
        if(din[i]==1'b0) begin
          temp = temp + 1;
        end
        else begin
          break;
        end
      end
      assign dout = temp;
    end
  end

endmodule
