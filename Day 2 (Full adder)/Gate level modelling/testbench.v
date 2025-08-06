module full_add_tb();
  reg a,b,c;
  wire sum;
  wire carry;
  
  full_add dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  
  initial begin
    repeat(10) begin
      {a,b,c} = $random();
      #10;
      $display("a = %b | b = %b | c = %b | sum = %b | carry = %b",a,b,c,sum,carry);
    end
  end
endmodule
