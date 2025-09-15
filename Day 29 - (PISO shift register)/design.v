module piso(clk,rst,load_enable,pi,so);
  input clk,rst,load_enable;
  input [3:0]pi;
  output reg so;
  
  reg [3:0]data;
  reg [3:0] counter;
  
  always@(posedge clk) begin
    if(rst) begin
      data <=4'b0000;
      so <=0;
      counter <=0;
    end
    else begin
      if(load_enable) begin

        data <= pi;
        counter <=4'b000;
      end
      else begin
        
        so <= data[3];
        data <= {data[2:0],1'b0};
        counter <= counter + 1;
      end
    end 
  end
endmodule
