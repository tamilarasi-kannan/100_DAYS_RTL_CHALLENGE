module tb();
  reg a,b,c;
  wire sum,carry;
  
  full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  
  initial begin
    repeat(15) begin
      {a,b,c} = $random();
      #15;
      $display("A = %b | b = %b | C = %b | sum = %b | carry = %b",a,b,c,sum,carry);
    end
  end
endmodule
