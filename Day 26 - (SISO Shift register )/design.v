module siso(clk,rst,si,so);
  input clk,rst,si;
  output reg so;
  
  reg [3:0] temp;
  
  always@(negedge clk)begin
    if(rst) 
      temp <=4'b0000;
    else 
      temp <= temp << 1;
    temp[0] <= si;
    so <= temp[3];
  end
endmodule
