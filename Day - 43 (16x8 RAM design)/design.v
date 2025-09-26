module ram_design(clk,write_enable,add,datain,dataout);
  input clk,write_enable;
  input [3:0] add;
  input [7:0] datain;
  output reg [7:0] dataout;
  
  reg [7:0] mem [15:0];
  
  always@(posedge clk) begin
    if(write_enable) begin
      mem[add] <= datain;
      dataout <= mem[add];
    end
    else begin
      dataout <= mem[add];
    end
  end
endmodule
  
  
