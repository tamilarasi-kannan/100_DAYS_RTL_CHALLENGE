module half_adder(a,b,sum,carry);
  parameter N=4;
  input [N-1:0] a,b;
  output [N-1:0] sum;
  output [N-1:0] carry;
  
 assign sum = a^b;
 assign carry = a & b;
  
endmodule
