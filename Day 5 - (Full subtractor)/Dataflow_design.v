module full_sub(a,b,c,diff,borrow);
input a,b,c;
output diff,borrow;
assign diff = a ^ b ^ c;
assign borrow = ((~a) & b) | ((~a) & c) | (b & c);
endmodule
