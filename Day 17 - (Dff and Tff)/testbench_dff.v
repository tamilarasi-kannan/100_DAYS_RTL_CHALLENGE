module dff_tb();
  reg rst,clk,d;
  wire q,q_bar;
  
  dff dut(.rst(rst),.clk(clk),.d(d),.q(q),.q_bar(q_bar));
  
  always #5 clk = ~clk;
  
  initial begin
    #2;
     $monitor("time = %0t | clk = %b | rst = %b | d = %b | q = %b | q_bar = %b",$time,clk,rst,d,q,q_bar);
  end
  
  initial begin
    rst = 1;
    clk = 0;
    #5;
    rst = 0;
    d = 0;
    #15;
    d = 1;
    #15;
    d = 0; 
    #15;
    d = 1;
    #50;
    
    $finish;
  end
endmodule
    
