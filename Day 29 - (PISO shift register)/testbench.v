module piso_tb();
  reg clk,rst,load_enable;
  reg [3:0]pi;
  wire so;
  
  piso dut(.clk(clk),.rst(rst),.load_enable(load_enable),.pi(pi),.so(so));
  
  initial begin 
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1;
    #10;
    rst = 0;
    load_enable = 1;
    pi = 4'b0101;
    #10;
    load_enable = 0;
    #40;
    load_enable = 1;
    pi = 4'b1011;
    #10;
    load_enable = 0;
  end
  initial begin
    $monitor("rst = %b | clk = %b | load enable = %b | pi = %b | so = %b counter = %d",rst,clk,load_enable,pi,so,dut.counter);
    #120;
    $finish;
  end
endmodule
