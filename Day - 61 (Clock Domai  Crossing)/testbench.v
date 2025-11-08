module cdc_2ff_sync_tb();
    reg  clk_dest;
    reg  async_in;
    wire sync_out;
  
    cdc_2ff_sync dut ( .clk_dest(clk_dest), .async_in(async_in), .sync_out(sync_out));
  
    initial begin
        clk_dest = 0;
        forever #5 clk_dest = ~clk_dest; 
    end
  
    initial begin
        async_in = 0;
        #12 async_in = 1;  
        #7  async_in = 0;
        #3  async_in = 1;
        #10 async_in = 0;
        #6  async_in = 1;
        #15 async_in = 0;
        #50 $finish;
    end
  
    initial begin
      $monitor("TIME=%0t | async_in=%b | sync_out=%b", $time, async_in, sync_out);
    end
  
endmodule
