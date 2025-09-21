module moore_tb();
  reg clk, rst, data;
  wire pattern_detected;
  
  moore_detector dut(.clk(clk), .rst(rst), .data(data), .pattern_detected(pattern_detected));
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns period
  end

  // Stimulus
  initial begin
    data = 0;
    rst = 1; #12;   
    rst = 0; #10;

    data = 1; #10;  
    data = 0; #10;  
    data = 1; #10;  
    data = 0; #10; 

    // Apply another sequence 1010
    data = 1; #10;
    data = 0; #10;
    data = 1; #10;
    data = 0; #10;

    #50;
    $finish;
  end

  initial begin
    $monitor("time=%0t | clk=%b | rst=%b | data=%b | pattern_detected=%b",
             $time, clk, rst, data, pattern_detected);
  end
endmodule
