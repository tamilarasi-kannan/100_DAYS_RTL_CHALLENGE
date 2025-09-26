module regfile(clk,rst,writeenable,rdata,wdata,radd,wadd);
  input clk,rst;
  input writeenable;
  input [3:0] radd;
  input [3:0] wadd;
  input [7:0] wdata;
  output [7:0] rdata;
  
  reg [7:0] mem [15:0];
  
  always@(posedge clk) begin
    if(rst) begin
      for(integer i=0;i<16;i=i+1) begin
        mem[i] <= 0;
      end
    end
    else begin
      if(writeenable) begin
        mem[wadd] <= wdata;
      end
    end
  end
  
  assign rdata = mem[radd];
endmodule
        
