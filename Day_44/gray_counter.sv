// Binary to Gray Code Converter
module binary_to_gray #(parameter WIDTH = 4) (binary_in, gray_out);
  input wire [WIDTH-1:0] binary_in;
  output wire [WIDTH-1:0] gray_out;
  
    assign gray_out[WIDTH-1] = binary_in[WIDTH-1];
    
    // Other bits are XOR of current and next higher bit
    generate
        genvar i;
        for (i = WIDTH-2; i >= 0; i = i-1) begin : gray_gen
            assign gray_out[i] = binary_in[i] ^ binary_in[i+1];
        end
    endgenerate
endmodule

// Gray Code to Binary Converter
module gray_to_binary #(parameter WIDTH = 4) (gray_in, binary_out);
  input wire [WIDTH-1:0] gray_in;
  output wire [WIDTH-1:0] binary_out;
  
    assign binary_out[WIDTH-1] = gray_in[WIDTH-1];
    
    generate
        genvar j;
        for (j = WIDTH-2; j >= 0; j = j-1) begin : binary_gen
            assign binary_out[j] = binary_out[j+1] ^ gray_in[j];
        end
    endgenerate
endmodule

// 4-bit Gray Code Counter
module gray_counter (clk, reset_n, gray_count);
  input wire clk;
    input wire reset_n;
  output reg [3:0] gray_count;
  
    wire [3:0] current_binary;
    wire [3:0] next_binary;
    wire [3:0] next_gray;
    
    gray_to_binary #(4) decoder (.gray_in(gray_count), .binary_out(current_binary));
    
    assign next_binary = current_binary + 1'b1;
    
  binary_to_gray #(4) encoder (.binary_in(next_binary), .gray_out(next_gray));
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            gray_count <= 4'b0000;
        end else begin
            gray_count <= next_gray;
        end
    end
endmodule
