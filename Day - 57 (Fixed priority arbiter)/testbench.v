module fixedpriroity_tb();
  
  reg clk,rst;
  reg [3:0] req;
  wire [3:0] grant;
  
  fixedpriroity dut(.clk(clk),.rst(rst),.grant(grant),.req(req));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #20;  rst = 0;
    repeat(5) begin
    #5 req = $random();
    end  
  end
  
  initial begin
    $monitor("clk = %b | rst = %b | req = %b | grant = %b",clk,rst,req,grant);
    #100;  
    $finish;  
  end
  
 endmodule
