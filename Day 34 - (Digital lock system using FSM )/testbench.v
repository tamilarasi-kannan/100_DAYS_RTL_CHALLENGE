module tb_digital_lock;
    reg clk = 0, rst, key;
    wire unlocked;

    digital_lock uut (.clk(clk), .rst(rst), .key(key), .unlocked(unlocked));

    always #5 clk = ~clk; 

    initial begin
        rst = 1; key = 0; #10;
        rst = 0;
      
        key = 1; #10;
        key = 0; #10;
        key = 1; #10;
        key = 1; #10; 
      
        key = 1; #10;
        key = 1; #10;
        key = 0; #10;
        key = 0; #10;

        #20 $finish;
    end
  initial begin 
    $monitor("clk = %b | rst = %b | key = %b | unlock = %b",clk,rst,key,unlocked);
  end
endmodule
