module sipo_tb();
  reg clk,rst,si;
  wire [3:0]po;
  
  sipo dut(.clk(clk),.rst(rst),.si(si),.po(po));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1;
    si = 1;
    #10;
    rst = 0;
    si = 0;
    #10; si = 1;
    #10; si = 0;
    #10; si = 0;
    #10; si = 1;
    #10; si = 1;
  end
  initial begin
    $monitor("clk = %b | rst = %b | si = %b | po = %b",clk,rst,si,po);
    #100;
    $finish;
  end

endmodule
