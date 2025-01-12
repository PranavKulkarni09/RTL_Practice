module sipo_register(clk, serial_in, out);
    input logic clk, serial_in;
    output logic[3:0] out=0;
    
    always @(posedge clk)
        begin
        out[3]<=serial_in;
            out[2]<=out[3];
            out[1]<=out[2];
            out[0]<=out[1];
        end 
endmodule
