module johnson_counter(clk,rst,out);
  parameter n=5;
  input clk,rst;
  output reg [n-1:0] out;
  
  always@(posedge clk or posedge rst) begin
    if(rst) 
      out <=0;
    else 
      out <= {~out[0],out[n-1:1]};
  end
endmodule
