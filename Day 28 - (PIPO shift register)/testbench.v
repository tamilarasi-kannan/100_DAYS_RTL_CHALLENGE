module pipo_tb();
  reg clk,rst;
  reg [3:0]pi;
  wire [3:0]po;
  
  pipo dut(.clk(clk),.rst(rst),.pi(pi),.po(po));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1;
    #10;
    rst = 0;
    pi = 4'b0001;
    #10;
    pi = 4'b1111; #10;
    pi = 4'b1011; #10;
    pi = 4'b1001; #10;
    pi = 4'b0101;
  end
  initial begin
    $monitor("clk = %b | rst = %b | pi = %b | po = %b",clk,rst,pi,po);
    #100;
    $finish;
  end
endmodule
