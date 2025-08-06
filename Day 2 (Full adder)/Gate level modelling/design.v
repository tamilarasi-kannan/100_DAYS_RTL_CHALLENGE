module full_add (a,b,c,sum,carry);

  input a,b,c;
  output sum;
  output  carry;
  wire n1,n2,n3,n4;
  
  xor(n1,a,b);
  xor(sum,n1,c);
  and(n2,a,b);
  and(n3,b,c);
  and(n4,a,c);
  or(carry,n2,n3,n4);
  
endmodule
