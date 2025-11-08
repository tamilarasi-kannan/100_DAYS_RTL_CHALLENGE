module tb_spi_master;
  
 reg clk, rst, start, miso, mode;
 reg [7:0] data_in;
 wire mosi, sclk, cs, done;
 wire [7:0] data_out;
  
 spi_master dut(clk, rst, start, data_in, miso, mode, mosi, sclk, cs, done, data_out);
  
 always #5 clk = ~clk;
  
 initial begin
    clk=0; rst=1; start=0; 
    miso=0; mode=0;
    data_in = 8'b10110011;  #20 
    rst=0;
    #10 start=1;  #10
    start=0;
    #30 miso=1; 
    #30 miso=0;  
    #30 miso=1; 
    #30 miso=1;
    #30 miso=0;   
    #30 miso=1;
    #30 miso=0; 
    #30 miso=1;
    wait(done);  #20;
    $stop;   
 end
  
 initial begin
 $monitor("TIME=%0t | CS=%b | SCLK=%b | MOSI=%b | MISO=%b | MODE=%b | DONE=%b | OUT=%h", $time, cs, sclk, mosi, miso, mode, done, data_out); 
 end
  
 endmodule
