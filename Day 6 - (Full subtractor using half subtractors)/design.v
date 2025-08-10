module half_subt (a,b,diff,borrow);
  input reg a,b;
  output reg diff,borrow;
  always@(*) begin
    diff = a ^ b;
    borrow = (~a) & b;
  end
endmodule

module full_subt(a,b,c,diff,borrow);
  input a,b,c;
 output diff,borrow;
  wire n1,n2,n3;
  
  half_subt ha1(.a(a),.b(b),.diff(n1),.borrow(n2));
  half_subt ha2(.a(n1),.b(c),.diff(diff),.borrow(n3));
  
  assign borrow = n2 | n3;
  
endmodule
