module sr_ff(clk,rst,s,r,q);
  input clk,rst,s,r;
  output reg q;
  always@(posedge clk) begin
    if(rst) begin
      q <=1'b0;
    end
    else begin
      case({s,r}) 
        2'b00 : q <=q;
        2'b01 : q <=0;
        2'b10 : q <=1;
        2'b11 : q <=1'bx;
      endcase
  end
  end
  endmodule
