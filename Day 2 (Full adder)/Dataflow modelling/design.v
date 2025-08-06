module full_add (a,b,c,sum,carry);
  parameter N = 4;
  input reg [N-1:0] a,b,c;
  output [N-1:0] sum;
  output carry;
  
  assign sum = a^b^c;
  assign carry = (a&b) | (b&c) |(c&a);
  
endmodule
