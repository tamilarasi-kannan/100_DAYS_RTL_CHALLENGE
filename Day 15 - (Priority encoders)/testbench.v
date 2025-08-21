module pri_en_tb();
  reg [7:0] in;
  wire [2:0] y;
  integer i; 

  pri_en dut(in,y);
  
  initial begin 
    
    for(i = 0;i<8;i=i+1) begin
      in = 00000001 << i;
      #10;
      $display("in = %b | out = %b",in,y);
    end
  end
 endmodule
 
