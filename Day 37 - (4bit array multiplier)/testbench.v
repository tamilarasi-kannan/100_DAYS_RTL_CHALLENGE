module bit_multiplier_tb();
  reg [3:0]a,b;
  wire [7:0] result;
  
  bit_multiplier dut(.a(a),.b(b),.result(result));
  
  initial begin
    repeat(20) begin
    {a,b} = $random();
    #10;
    $monitor("A = %b | B = %b | result = %b",a,b,result);
    end
  end
endmodule
