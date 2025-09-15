module ripple_counter_tb();
  reg clk,rst;
  wire [3:0] q;
  
  ripple_counter_tff dut(.clk(clk),.q(q),.rst(rst));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #20;
    rst = 0;
  end
  
  initial begin
    $monitor("clk = %b | rst = %b | q = %b",clk,rst,q);
    #500;
    $finish;
  end
endmodule
