module ring_counter_tb();
  parameter N = 5;
  reg clk,reset;
  wire [N-1:0] count;

  ring_counter dut(.clk(clk),.reset(reset),.count(count));

  always #5 clk = ~clk;
  initial begin
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
  end
  initial begin
    $monitor("Reset = %b clk = %b Count = %b", reset,clk,count);
    #300;
    $finish;
  end
endmodule
