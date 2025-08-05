module half_adder_tb();
  parameter N=4;
  reg [N-1:0] a,b;
  wire [N-1:0] sum;
  wire [N-1:0] carry;
  
  half_adder dut(.a(a),.b(b),.sum(sum),.carry(carry));
  
  initial begin
    repeat(20) begin
    a = $random();
    b = $random();
    #5;
    $display("a = %b b = %b sum = %b carry = %b",a,b,sum,carry);
  end
  end
  
endmodule
