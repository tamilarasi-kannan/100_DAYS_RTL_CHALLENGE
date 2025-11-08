module pwn_generator_tb();
  reg clk,rst;
  reg [7:0] duty;
  wire pwn_out;
  
  pwn_generator dut(.clk(clk),.rst(rst),.pwn_out(pwn_out),.duty(duty));
  
  initial begin
    clk = 0;
    forever#5 clk = ~clk;
  end
  
  initial begin
    rst = 1; #10;
    rst = 0;
    duty = 8'd64; // 25% duty cycle (ie) 64/256*100 = 25  #2000;
    duty = 8'd128; // 50% duty cycle (ie) 128/256*100 = 50  #3000;
    duty = 8'd192;   
    #3000;
    $stop; 
  end
  
  initial begin
    $monitor("clk = %b | rst = %b | duty = %0d | counter = %0d | pwn_out = %0b",clk,rst,duty,dut.counter,pwn_out);   
  end
  
 endmodule
