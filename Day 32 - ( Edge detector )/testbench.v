module tb_both_edge_detector;

    reg clk, rst, din;
    wire dout;

    both_edge_detector uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout)
    );

    
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        
        rst = 1; din = 0;
        #12; rst = 0;   
        #10 din = 0;
        #10 din = 1;  
        #20 din = 0;  
        #15 din = 1; 
        #15 din = 0;  
        #20 din = 1;  

        #20 $finish;
    end
  
endmodule
