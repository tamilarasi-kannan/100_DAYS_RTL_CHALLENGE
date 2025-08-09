module half_sub(a,b,diff,borrow);
  input a,b;
  output diff,borrow;
  wire n1;
  xor(diff,a,b);
  not(n1,a);
  and(borrow,n1,b);
 endmodule
