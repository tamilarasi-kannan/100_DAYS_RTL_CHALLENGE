module synch_counter(clk,rst,out);
  parameter N = 4;
  input clk,rst;
  output reg [N-1:0] out;

  always@(posedge clk) begin
    if(rst) 
      out <= 4'b0;
    else
      out <= out + 1;
  end
endmodule
