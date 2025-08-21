module jkff (rst,clk,j,k,q);
  input rst,clk,j,k;
  output reg q;
  
  always@(posedge clk) begin
    if(rst) begin
      q <= 1'b0;
    end
    else begin
      case({j,k}) 
        2'b00 : q <= q;
        2'b01 : q <= 0;
        2'b10 : q <= 1;
        2'b11 : q <= ~q;
      endcase
    end
  end
endmodule
