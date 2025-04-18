module booth_algorithm (multiplier, multiplicand, product);
  input signed [3:0] multiplier, multiplicand;
  output reg signed [7:0] product;
    
    reg [1:0] op_sel;
    reg signed [3:0] neg_multiplicand;
    reg q_prev;
    integer k;

    always @ (multiplier, multiplicand) begin
        product = 8'sd0;
        q_prev = 1'b0;
        neg_multiplicand = -multiplicand;

        for (k = 0; k < 4; k = k + 1) begin
            op_sel = { multiplier[k], q_prev };
            
            case (op_sel)
                2'b10: product[7:4] = product[7:4] + neg_multiplicand;
                2'b01: product[7:4] = product[7:4] + multiplicand;
            endcase

            product = product >>> 1;      
            product[7] = product[6];       
            q_prev = multiplier[k];
        end
    end

endmodule
