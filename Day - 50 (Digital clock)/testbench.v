module tb_digital_clock;
    reg clk, rst;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hr;
  
    digital_clock uut (.clk(clk), .rst(rst),.sec(sec),.min(min),.hr(hr));
  
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
  
    initial begin
        rst = 1;
        #20;
        rst = 0;
        #2000;   
        $finish;
    end
  
    initial begin
        $monitor("Time = %0t | %0d:%0d:%0d", $time, hr, min, sec);
    end
  
 endmodule
