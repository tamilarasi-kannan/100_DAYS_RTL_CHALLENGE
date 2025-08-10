module tb();
  reg a,b,c;
  wire diff,borrow;
  
  full_subt dut (.a(a),.b(b),.c(c),.diff(diff),.borrow(borrow));
  
  initial begin
    repeat(15) begin
      {a,b,c} = $random();
      #10;
      $display("a = %b | b = %b | c = %b | diff = %b | borrow = %b",a,b,c,diff,borrow);
    end
  end
endmodule
