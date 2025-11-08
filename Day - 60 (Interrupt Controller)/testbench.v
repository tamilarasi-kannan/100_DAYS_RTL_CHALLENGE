module interrupt_controller_tb;
    reg clk, rst;
    reg  [3:0]  irq;
    reg int_ack;
    wire int_req;
    wire [1:0]  int_id;
  
    interrupt_controller dut (.clk(clk), .rst(rst), .irq(irq), .int_ack(int_ack), .int_req(int_req),.int_id(int_id));
  
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
  
    initial begin
        rst  = 1;  irq  = 4'b0000;
        int_ack = 0;
        #10; rst = 0;
        #10 irq[0] = 1;
        #20 int_ack = 1; 
        #10 int_ack = 0;
        #20 irq[2] = 1;
        irq[1] = 1; 
        #30 int_ack = 1;
        #10 int_ack = 0;
        #30 int_ack = 1; 
        #10 int_ack = 0;
        #20 irq[3] = 1;
        #20 int_ack = 1;  
        #10 int_ack = 0;
        #50;  $finish; 
    end
  
    initial begin
      $monitor("Time=%0t | irq=%b | int_req=%b | int_id=%b | ack=%b", $time, irq, int_req, int_id, int_ack);
    end
  
 endmodule
