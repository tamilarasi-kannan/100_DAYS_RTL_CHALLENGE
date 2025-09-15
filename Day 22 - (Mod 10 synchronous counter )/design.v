module mod_counter(clk,rst,out);
  input clk,rst;
  output reg [3:0] out;
  
  always@(negedge clk) begin
    if(rst)
      out <=4'b0000;
    else 
      if(out >= 9)
        out <= 4'b0000;
    else
      out <= out+1;
  end
endmodule
