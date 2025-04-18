module binary_to_bcd (bin_in, digit0, digit1, digit2, bcd_out);
  input  logic [7:0] bin_in;
  output logic [3:0] digit0, digit1, digit2;
  output logic [11:0] bcd_out;

    logic [3:0] temp0, temp1, temp2;
    integer i;

    always_comb begin
        temp0 = 4'd0;
        temp1 = 4'd0;
        temp2 = 4'd0;

        for (i = 7; i >= 0; i--) begin
            if (temp0 > 4)
                temp0 = temp0 + 3;
            if (temp1 > 4)
                temp1 = temp1 + 3;
            if (temp2 > 4)
                temp2 = temp2 + 3;

            {temp2, temp1, temp0} = {temp2, temp1, temp0, bin_in[i]};
        end

        digit0  = temp0;
        digit1  = temp1;
        digit2  = temp2;
        bcd_out = {temp2, temp1, temp0};
    end

endmodule
