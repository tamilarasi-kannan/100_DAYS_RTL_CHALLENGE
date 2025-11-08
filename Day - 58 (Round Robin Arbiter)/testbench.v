module roundrobin_arbiter_tb;
  reg clk, rst;
  reg [3:0] REQ;
  wire [3:0] GNT;
  
  roundrobin_arbiter DUT (.clk(clk), .rst(rst), .REQ(REQ), .GNT(GNT));
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor("Time=%0t | clk=%b | rst=%b | REQ=%b | GNT=%b", $time, clk, rst, REQ, GNT);
  end
  
  initial begin
    clk = 0;  rst = 0;
    REQ = 4'b0000;
    #10 rst = 1;           
    #10 REQ = 4'b1000;        
    #10 REQ = 4'b1010;      
    #10 REQ = 4'b0110;       
    #10 REQ = 4'b1111;        
    #10 REQ = 4'b0010;        
    #10 REQ = 4'b0100;        
    #10 REQ = 4'b0000;        
    #10 $finish;              
  end
  
 endmodule
