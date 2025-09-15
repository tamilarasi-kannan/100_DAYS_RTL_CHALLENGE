module sipo(clk,rst,si,po);
  input clk,rst,si;
  output reg [3:0]po;
  
  reg [3:0] temp;
  
  always@(posedge clk) begin
    if(rst) begin
      temp <= 4'b0000;
    end
    else begin
      temp <= {temp[2:0],si};
      po <= temp;
  end
  end
endmodule
