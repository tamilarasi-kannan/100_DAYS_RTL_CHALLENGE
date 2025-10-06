module grey_counter_tb();
  reg clk,rst;
  reg updown;
  wire [3:0] grey;
  
  grey_counter dut(.clk(clk),.rst(rst),.updown(updown),.grey(grey));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1; #10;
    rst = 0; updown = 1;
    #40;
    rst = 0; updown = 0;
    #40;
    rst = 0; updown = 1;
  end
  
  initial begin
    $monitor("clk = %b | rst = %b | updown = %b | binary = %b | grey = %b",clk,rst,updown,dut.binary,grey);
    #200;
    $finish;
  end
endmodule
