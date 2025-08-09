module half_sub(a,b,diff,borrow);
  input a,b;
  output reg diff;
 output reg borrow;
  always@(*) begin
   diff = a ^ b;
   borrow = (~a) & b;
  end
 endmodule
