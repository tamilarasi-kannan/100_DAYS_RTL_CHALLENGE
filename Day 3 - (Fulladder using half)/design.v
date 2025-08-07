module half_adder(a,b,sum,carry);
  input a,b;
  output sum,carry;
  
  assign sum = a^b;
  assign carry = a&b;
  
endmodule

module full_adder (a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  wire n1,n2,n3;
  
  half_adder ha1(.a(a),.b(b),.sum(n1),.carry(n2));
  half_adder ha2(.a(n1),.b(c),.sum(sum),.carry(n3));
  
  assign carry = n2 | n3;
  
endmodule
