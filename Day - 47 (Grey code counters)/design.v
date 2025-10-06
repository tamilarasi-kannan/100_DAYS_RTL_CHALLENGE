module grey_counter(clk,rst,updown,grey);
  input clk,rst;
  input updown;
  output reg [3:0] grey;
  
  reg [3:0] binary;
  
  always@(posedge clk) begin
    if(rst) begin
      binary <= 4'b0000;
    end
    else if(updown) begin
      binary <= binary +1;
    end
    else begin
      binary <= binary - 1;
    end
  end
  
  always@(*) begin
    grey = binary ^ (binary >> 1);
  end
endmodule
