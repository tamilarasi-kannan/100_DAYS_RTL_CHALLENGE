module restoring_divider #(parameter N = 4)(
    input  [N-1:0] dividend,
    input  [N-1:0] divisor,
    output reg [N-1:0] quotient,
    output reg [N-1:0] remainder
);

    integer i;
    reg [N:0] rem;   

    always @(*) begin
        quotient  = 0;
        rem       = 0;

        for (i = N-1; i >= 0; i = i - 1) begin
            
            rem = {rem[N-1:0], dividend[i]};

            rem = rem - divisor;

          if (rem[N] == 1) begin
                rem = rem + divisor;
                quotient[i] = 0;
            end else begin
                quotient[i] = 1;
            end
        end

        remainder = rem[N-1:0];
    end

endmodule
