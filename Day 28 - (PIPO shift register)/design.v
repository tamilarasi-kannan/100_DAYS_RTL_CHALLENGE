module pipo(clk,rst,pi,po);
  input clk,rst;
  input [3:0]pi;
  output reg [3:0] po;
  
  always@(negedge clk) begin
    if(rst) 
      po <= 4'b0000;
    else begin
      po <=pi;
    end
  end 
endmodule
