module tff(rst,t,clk,q);
  input rst,clk,t;
  output reg q;
  
  always@(posedge clk) begin
    if(rst) begin
      q <= 0;
    end
    else begin
      if(t == 1) 
     	 q <= ~q;
      else
      	 q <= q;
    end
  end 
endmodule
  
