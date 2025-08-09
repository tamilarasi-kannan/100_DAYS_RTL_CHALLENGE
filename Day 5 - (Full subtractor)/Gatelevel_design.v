module full_subtractor(a,b,c,diff,borrow);
input a,b,c;
output diff,borrow;
xor(n1,a,b);
not(n2,a);
and(n3,n2,b);
not(n4,n1);
and(n5,n4,c);
xor(diff,n1,c);
or(borrow,n3,n5);
endmodule
