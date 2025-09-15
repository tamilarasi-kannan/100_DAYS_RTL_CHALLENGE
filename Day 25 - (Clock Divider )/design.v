module clock_divider(clk,rst,divideby2,divideby4,divideby8,divideby16);
  input clk,rst;
  output reg divideby2,divideby4,divideby8,divideby16;
  
  reg [3:0]count;
  
  always@(posedge clk) begin
    if(rst) begin
      count <=4'b0000;
    end
      else begin
        count <=count+1;
      
      divideby2 <=count[0];
      divideby4 <=count[1];
      divideby8 <=count[2];
      divideby16 <=count[3];
    end
  end
endmodule
