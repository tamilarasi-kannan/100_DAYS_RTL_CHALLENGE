module fixedpriroity(clk,rst,grant,req);
  
  input clk,rst;
  input [3:0] req;
  output reg [3:0] grant;
  
  always@(posedge clk) begin
    if(rst) begin
      grant <= 4'b0000;  
    end
    else begin
      if(req[3]) begin
        grant <= 4'b1000;  
      end
      else if(req[2]) begin
        grant <= 4'b0100;  
      end
      else if(req[1]) begin
        grant <= 4'b0010; 
      end
      else if(req[0]) begin
        grant <= 4'b0001;  
      end
      else begin
        grant <= 4'b0000;  
      end  
    end  
  end
 endmodule
