module step_motor_tb();
  reg clk,rst;
  reg enable,dir;
  wire [3:0] coil;
  
  stepper_motor dut(.clk(clk),.rst(rst),.enable(enable),.coil(coil),.dir(dir));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;   
  end
  
    initial begin
    rst = 1; enable = 0; dir = 0;
        #30 rst = 0;
        enable = 1; dir = 0; 
        #200 dir = 1;        
        #200 enable = 0;    
    end
  
  initial begin
    $monitor("clk = %b | rst = %b | enable = %b | direction = %b | coil = %b",clk,rst,enable,dir,coil);
    #600;
    $finish;  
  end
  
 endmodule
