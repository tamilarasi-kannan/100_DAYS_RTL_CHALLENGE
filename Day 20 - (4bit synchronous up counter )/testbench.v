module tb();
  parameter N = 4;
  reg clk,rst;
  wire [N-1:0] out;
  
  synch_counter dut(.clk(clk),.rst(rst),.out(out));
  
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
    #350;
    $finish;
  end
  initial begin
    $dumpvars();
    $dumpfile("counter.vcd");
  end
endmodule
