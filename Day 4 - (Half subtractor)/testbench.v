module half_sub_tb();
  reg a,b;
  wire diff,borrow;
  half_sub dut(a,b,diff,borrow);
  initial begin
    repeat(10) begin
      {a,b} = $random();
      #10;
      $display("a = %b | b = %b | diff = %b | borrow = %b",a,b,diff,borrow);
    end
  end
 endmodule
