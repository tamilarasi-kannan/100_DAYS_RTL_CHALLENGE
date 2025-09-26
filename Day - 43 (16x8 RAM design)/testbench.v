module ram_design_tb();
  reg clk,write_enable;
  reg [3:0] add;
  reg [7:0] datain,dataout;
  
  ram_design dut(.clk(clk),.write_enable(write_enable),.add(add),.datain(datain),.dataout(dataout));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    write_enable = 1; add = 4'h0; datain = 8'hAA; #10;
        add = 4'h1; datain = 8'h55; #10;
        write_enable = 0; add = 4'h0; #10;
        add = 4'h1; #10;
  end
  
  initial begin
    $monitor("clk = %b | write_enable = %b | address = %h | datain = %h | dataout = %h",clk,write_enable,add,datain,dataout);
    #50;
    $finish;
  end
endmodule
