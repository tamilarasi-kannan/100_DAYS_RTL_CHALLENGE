module tb_spi_slave;
  
 reg sclk, cs, mosi, rst;
 reg [7:0] data_in;    
wire miso,done;
 wire [7:0] data_out;  
  
spi_slave dut(.sclk(sclk),.cs(cs),.mosi(mosi),.rst(rst),.data_out(data_out),.data_in(data_in),.miso(miso),.done(done));
  
 always #5 sclk = ~sclk;
  
 initial begin
    sclk = 0; cs   = 1; 
    mosi = 0; rst  = 1;
    data_in = 8'b11001010;    
    #20 rst = 0;   #10 ; cs = 0;              
    mosi = 1; #10; 
    mosi = 0; #10;
    mosi = 1; #10; 
    mosi = 1; #10;
    mosi = 0; #10; 
    mosi = 0; #10;
    mosi = 1; #10; 
    mosi = 0; #10;
    wait(done);  #20;  cs = 1;   
    #20;
    $stop;  
 end
  
 initial begin
   $monitor("TIME=%0t | CS=%b | SCLK=%b | MOSI=%b | MISO=%b | DONE=%b | DATA_OUT=%h", $time, cs, sclk, mosi, miso, done, data_out);
 end
  
 endmodule
