module fifo(clk,rst,write_enable,read_enable,datain,dataout,full,empty);
  input clk,rst;
  input write_enable,read_enable;
  input [7:0] datain;
  output reg [7:0] dataout;
  output reg full,empty;
  
  reg [7:0] mem [15:0];
  reg [3:0] wptr;
  reg [3:0] rptr;
  reg [4:0] count;
  
  always@(posedge clk) begin
    if(rst) begin
      wptr <= 0;
      rptr <= 0;
      dataout <= 0;
      count <= 0;
      full <= 0;
      empty <= 1;
    end
    else begin
     if(write_enable && !(full)) begin
      mem[wptr] <= datain;
        wptr <= wptr +1;
      count <= count +1;
      end
      if(read_enable && !(empty)) begin
      dataout <= mem[rptr];
      rptr <= rptr +1;
      count <= count - 1;
    end
    end
    
    full <= (count == 16);
    empty <= (count == 0);
  end 
  
endmodule
  
      
