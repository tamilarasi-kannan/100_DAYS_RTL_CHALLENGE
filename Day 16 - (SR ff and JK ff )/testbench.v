module sr_ff_tb();
  reg clk,rst,s,r;
  wire q;
  sr_ff dut (.clk(clk),.rst(rst),.s(s),.r(r),.q(q));
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    #2;
    $monitor("time = %0t | rst = %b | clk = %b | s = %b | r = %b | q = %b",$time,rst,clk,s,r,q);
  end
  initial begin
    rst = 1;
  end
  initial begin
     #10;
    rst = 0;
    s = 0; r = 0;
    #10;
    s = 0; r = 1;
    #10;
    s = 1; r = 0;
    #10;
    s = 1; r = 1;
    #10;
    s = 0; r = 1;
    #10;
    $finish;
  end
endmodule
