module tb();
  reg a,b,c;
  wire diff;
  wire borrow;
  
  full_subt dut(a,b,c,diff,borrow);
  
  initial begin
    repeat(15) begin
      {a,b,c} = $random();
      #10;
      $display("a = %b | b = %b | c = %b | diff = %b | borrow = %b",a,b,c,diff,borrow);
    end
  end
endmodule
