module half_adder (a, b, sum, carry);
  input  logic a, b;
  output logic sum, carry;
  
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

module vedic_mul_2x2 ( a, b, product);
  
  input  logic [1:0] a, b;
  output logic [3:0] product;
  
  logic [3:0] partial_products;
  logic intermediate_carry;
  
  assign partial_products[0] = a[0] & b[0];
  assign partial_products[1] = a[0] & b[1];
  assign partial_products[2] = a[1] & b[0];
  assign partial_products[3] = a[1] & b[1];
  
  assign product[0] = partial_products[0];
  
  half_adder first_adder (.a(partial_products[1]), .b(partial_products[2]), .sum(product[1]), .carry(intermediate_carry));
  
  half_adder second_adder (.a(intermediate_carry), .b(partial_products[3]), .sum(product[2]), .carry(product[3]));
endmodule
