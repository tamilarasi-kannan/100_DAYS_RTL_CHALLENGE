module johnson_counter_tb();
  parameter n=5;
  reg clk,rst;
  wire [n-1:0] out;
  
  johnson_counter dut(.clk(clk),.rst(rst),.out(out));
  
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
    $monitor("clk = %b | rst = %b | out = %b",clk,rst,out);
    #300;
    $finish;
  end
endmodule
