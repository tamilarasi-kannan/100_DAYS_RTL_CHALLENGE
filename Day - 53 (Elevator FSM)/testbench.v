module tb_elevator;
    reg clk, reset;
    reg [3:0] req;       
    wire [1:0] floor;      
    wire motor_up, motor_down, door_open;
  
    elevator_fsm uut (.clk(clk), .reset(reset), .req(req), .floor(floor), .motor_up(motor_up),.motor_down(motor_down), .door_open(door_open));
  
    always #5 clk = ~clk;
  
    initial begin
        clk = 0;
        reset = 1;
        req = 4'b0000;
        #15 reset = 0;
        #10 req = 4'b0100; 
        #100 req = 4'b0000; 
        #50 req = 4'b1000;
        #100 req = 4'b0000;
        #50 req = 4'b0001;
        #100 req = 4'b0000;
        #50 req = 4'b1010;
        #200 req = 4'b0000;
        #200 $stop;
    end
  
    initial begin
        $monitor("Time=%0t | Floor=%0d | Up=%b | Down=%b | Door=%b | Req=%b",$time, floor, motor_up, motor_down, door_open, req);
    end
  
 endmodule
