module watchdog_timer_tb;
  
    reg clk, rst, kick;
    wire timeout;
  
    watchdog_timer uut (.clk(clk),.rst(rst),.kick(kick), .timeout(timeout));
  
    always #5 clk = ~clk;
  
    initial begin
        clk = 0;
        rst = 1;
        kick = 0;
        #20 rst = 0;
        repeat(5) begin
            #30 kick = 1;
            #10 kick = 0;
        end
        #500;
        #100 $finish;
    end
  
    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | kick=%b | cnt=%d | timeout=%b",
                 $time, clk, rst, kick, uut.cnt, timeout);
    end
 endmodule
