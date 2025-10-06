module lifo_stack_tb;

    reg clk, rst, push, pop;
    reg [7:0] din;
    wire [7:0] dout;
    wire full, empty;

    lifo_stack dut (.clk(clk), .rst(rst), .push(push), .pop(pop), .din(din), .dout(dout), .full(full), .empty(empty));

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; push = 0; pop = 0; din = 0;
        #15 rst = 0;

        push = 1; din = 8'hA1; #10;
        push = 1; din = 8'hB2; #10;
        push = 1; din = 8'hC3; #10;
        push = 0;

        pop = 1; #10;
        pop = 1; #10;
        pop = 1; #10;
        pop = 0;
      
        push = 1; din = 8'hD4; #10;
        push = 1; din = 8'hE5; #10;
        push = 0;
      
        pop = 1; #20;
        pop = 0;

        #20 $finish;
    end
  
    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | push=%b | pop=%b | din=%h | dout=%h",
                  $time, clk, rst, push, pop, din, dout);
    end

endmodule
