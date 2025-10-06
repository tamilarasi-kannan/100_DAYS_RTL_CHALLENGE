module uart_tansmitter_tb();
  reg clk,rst;
  reg data_valid;
  reg [7:0] datain;
  wire tx;
  
  parameter baudrate = 10;
  parameter clk_freq = 1000;
  localparam baud_cnt = clk_freq/baudrate;
  
  uart_transmitter dut(.clk(clk),.rst(rst),.datain(datain),.tx(tx),.data_valid(data_valid));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1; #10;
    rst = 0; data_valid = 0; #20;
    rst = 0; data_valid = 1;datain = 8'b01010101; 
  end
  
  initial begin
    $monitor("time = %0t | clk = %b | rst = %b | data_valid = %b | datain = %b | shift_register = %b | tx = %b",$time,clk,rst,data_valid,datain,dut.shift_reg,tx);
    #5000;
    $finish;
  end
  initial begin
    $dumpvars();
    $dumpfile("uart_transmitter.vcd");
  end
endmodule
