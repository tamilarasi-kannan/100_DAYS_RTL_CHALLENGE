module crc_tb;
 reg clk, rst;
 reg data_valid,data_in;
 wire [7:0] crc_out;
  
 crc_generator DUT(.clk(clk), .rst(rst), .data_valid(data_valid), .data_in(data_in),.crc_out(crc_out));
  
 always #5 clk = ~clk;
  
 initial begin
    clk = 0; rst = 1; data_valid = 0; data_in = 0;
    #10 rst = 0;
    data_valid = 1;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_valid = 0;
    #50 $finish;
 end
  
 initial begin
    $monitor("TIME=%0t | data_in=%b | crc=%h", $time, data_in, crc_out);
 end
endmodule
