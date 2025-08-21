module dff(rst,clk,d,q,q_bar);
  input rst,clk,d;
  output reg q;
  output q_bar;
  
  always@(posedge clk) begin
    if(rst)
      q = 0;
    else
      q = d;
  end
  
  assign q_bar = ~q;
  
endmodule
