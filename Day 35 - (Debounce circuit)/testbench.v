module debounce_tb();
  parameter N = 10;
  reg clk,rst,btn;
  wire btn_out;
  
  debounce dut(.clk(clk),.rst(rst),.btn(btn),.btn_out(btn_out));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;#10;
    rst = 0;#10;
    btn = 1; #20;
    btn = 0; #20;
    btn = 1; #20;
  end
  
  initial begin
    $monitor("time = %0t | clk = %b | rst = %b | btn = %b | btn_out = %b counter = %d",$time,clk,rst,btn,btn_out,dut.counter);
  #300;
    $finish;
  end
endmodule
