module full_sub(a,b,c,diff,borrow);
input reg a,b,c;
output reg diff;
output reg borrow;
always@(*) begin
diff = a ^ b ^ c;
borrow = ((~a) & b) | ((~a) & c) | (b & c);
end
endmodule
