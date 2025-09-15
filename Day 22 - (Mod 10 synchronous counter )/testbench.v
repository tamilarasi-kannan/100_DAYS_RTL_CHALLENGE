module mod_counter_tb();
  reg clk,rst;
  wire [3:0] out;
  
  mod_counter dut(.clk(clk),.rst(rst),.out(out));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #15;
    rst = 0;
  end
  initial begin
    $monitor("clk = %b | rst = %b | out = %b",clk,rst,out);
    #350;
    $finish;
  end
endmodule
