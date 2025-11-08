module uart_receiver_tb;
  reg clk, rst, rx;
  wire [7:0] data_out;
  wire data_valid;
  
  uart_receiver uut (.clk(clk),.rst(rst),.rx(rx), .data_out(data_out),.data_valid(data_valid));
  
  always #5 clk = ~clk;  
  
  task send_byte;
    input [7:0] data;
    integer i;
    begin
      rx = 0;
      #(100);  
      for (i = 0; i < 8; i = i + 1) begin
        rx = data[i];
        #(100);  
      end
      rx = 1;
      #(100);
    end
  endtask
  
  initial begin
    clk = 0;
    rst = 1;
    rx = 1;    
    #50;
    rst = 0;
    #200;
    $display("Sending byte 1: 10101010");
    send_byte(8'b10101010);
    #2000;
    $display("Sending byte 2: 01010101");
    send_byte(8'b01010101);
    #2000;
    $finish;
  end
  
 endmodule
