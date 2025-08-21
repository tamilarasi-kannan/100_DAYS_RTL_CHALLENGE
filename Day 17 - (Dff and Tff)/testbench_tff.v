module tff_tb();
  reg clk,rst,t;
  wire q;
  
  tff dut(.rst(rst),.clk(clk),.t(t),.q(q));
  
  always #5 clk = ~clk;
  
  initial begin
    #2;
    $monitor("time = %0t Rst = %b clk = %b t = %b q = %b",$time,rst,clk,t,q);
  end
  
  initial begin
    rst = 1;
    clk = 0;
    #10;
    rst = 0;
    #10;
    t = 0;
    #10;
    t = 1;
    #10;
    t = 0;
    #10;
    t = 1;
    #50;
    $finish;
  end
endmodule
