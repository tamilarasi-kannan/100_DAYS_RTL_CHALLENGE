module tb_restoring_divider;
    reg [3:0] dividend, divisor;
    wire [3:0] quotient, remainder;

    restoring_divider #(4) uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
      $monitor("Dividend=%d | Divisor=%d | Quotient=%d |  Remainder=%d",dividend, divisor, quotient, remainder);

        dividend = 4'd15; divisor = 4'd3; #10;

        dividend = 4'd14; divisor = 4'd3; #10;

        dividend = 4'd13; divisor = 4'd5; #10;

        dividend = 4'd9; divisor = 4'd2; #10;

        $finish;
    end
endmodule
