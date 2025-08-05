module half_adder_tb();
  reg a,b;
  wire sum,carry;
  
  half_adder dut(a,b,sum,carry);
  
  initial begin
    repeat(10) begin
      a = $random();
      b = $random();
      #5;
      $display("a = %b b = %b sum = %b carry = %b",a,b,sum,carry);
    end
  end
  
endmodule
