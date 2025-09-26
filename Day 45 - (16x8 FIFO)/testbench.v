module fifo_tb();
  reg clk,rst,write_enable,read_enable;
  reg [7:0] datain;
  wire [7:0] dataout;
  wire full,empty;
  
  fifo dut(.clk(clk),.rst(rst),.write_enable(write_enable),.read_enable(read_enable),.datain(datain),.dataout(dataout),.full(full),.empty(empty));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1; write_enable = 0; read_enable = 0; datain = 0;
    #20; 
    rst = 0;
    write_enable = 1; datain = 8'h0A; #10;
    write_enable = 1; datain = 8'h0D; #10;
    write_enable = 0; read_enable = 1; #10;
    read_enable = 0; write_enable = 1; datain = 8'h7A; #10;
    write_enable = 0; read_enable = 1; #20;
  end
  initial begin
    $monitor("clk = %b | rst = %b | write_enable = %b | read_enable = %b | datain = %h | dataout = %h",clk,rst,write_enable,read_enable,datain,dataout);
    #100;
    $finish;
  end
endmodule
  
