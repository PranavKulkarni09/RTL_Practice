module token_bucket_algorithm(clk, rst, packet_in, packet_out);
  input logic clk, rst, packet_in;
  output logic packet_out;

    parameter CAP = 10;     // max tokens in bucket
    parameter RATE = 1;     // tokens added per clock
    parameter PKT_SIZE = 3; // tokens needed per packet

    logic [31:0] tokens;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tokens <= 0;
            packet_out <= 0;
        end else begin
            if (tokens < CAP)
                tokens <= tokens + RATE;

            if (packet_in) begin
                if (tokens >= PKT_SIZE) begin
                    tokens <= tokens - PKT_SIZE;
                    packet_out <= 1;
                end else begin
                    packet_out <= 0;
                end
            end else begin
                packet_out <= 0;
            end
        end
    end

endmodule
