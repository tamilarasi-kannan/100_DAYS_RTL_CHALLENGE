module full_add_tb();
  parameter N = 4;
  reg [N-1:0] a,b,c;
  wire [N-1:0] sum;
  wire carry;
  
  full_add dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  
  initial begin
    repeat(10) begin
      {a,b,c} = $random();
      #10;
      $display("a = %b | b = %b | c = %b | sum = %b | carry = %b",a,b,c,sum,carry);
    end
  end
  
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars();
  end
endmodule
  
