module reg_testbench();
  reg clk,rst,writeenable;
  reg [3:0] radd,wadd;
  reg [7:0] wdata;
  wire [7:0] rdata;
  
  regfile dut(.clk(clk),.rst(rst),.writeenable(writeenable),.rdata(rdata),.wdata(wdata),.radd(radd),.wadd(wadd));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #15;
    rst = 0;
    writeenable = 1;
    wadd = 4'h0; wdata = 8'h12;#5;
    wadd = 4'h3; wdata = 8'h10; #5;
    wadd = 4'ha; wdata = 8'h17; #5;
    wadd = 4'hb; wdata = 8'h20; #5;
    wadd = 4'h8; wdata = 8'h3d; #5;
    #20;
    writeenable = 0;
    radd = 4'ha;
    #10;
    radd = 4'h8;
  end
  
  initial begin
    $monitor("clk = %b | rst = %b | write enable = %b | write address = %h | write data = %h | read address = %h | read data = %h ",clk,rst,writeenable,wadd,wdata,radd,rdata);
  #100;
    $finish;
  end
  
endmodule
    
    
