module clock_divider_tb();
  reg clk,rst;
  wire divideby2,divideby4,divideby8,divideby16;

  clock_divider dut(.rst(rst),.clk(clk),.divideby2(divideby2),.divideby4(divideby4),.divideby8(divideby8),.divideby16(divideby16));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #10;
    rst = 0;
  end
  initial begin
    $monitor("clk = %b | rst = %b | divideby2 = %b | divideby4 = %b | divideby8 = %b | divideby16 = %b",clk,rst,divideby2,divideby4,divideby8,divideby16);
    #100;
    $finish;
  end
  
endmodule
