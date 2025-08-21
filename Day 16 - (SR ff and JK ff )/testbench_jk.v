module jk_ff_tb();
  reg clk,rst,j,k;
  wire q;
  
  jkff dut (.clk(clk),.rst(rst),.j(j),.k(k),.q(q));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    #2;
    $monitor("time = %0t | rst = %b | j = %b | k = %b | q = %b",$time,rst,j,k,q);
  end
  
  initial begin
    rst = 1;
    #10;
    rst = 0;
    j = 0; k = 0;
    #10; 
    j = 0; k = 1;
    #10;
    j = 1; k = 0;
    #10;
    j = 1; k = 1;
    #10;
    j = 0; k = 1;
    #10;
    $finish;
  end
  
endmodule
