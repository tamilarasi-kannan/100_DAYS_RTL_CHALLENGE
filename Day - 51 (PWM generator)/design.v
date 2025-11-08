module pwn_generator(clk,rst,pwn_out,duty);
  input clk,rst;
  input [7:0] duty;
  output reg pwn_out;
  reg [7:0] counter;
  
  always@(posedge clk) begin
    if(rst) begin
      counter <= 0;
      pwn_out <= 0;
    end
    
    else begin
      counter <= counter +1;
      if(counter < duty) begin
        pwn_out <= 1;
      end
      else begin
        pwn_out <= 0;
      end  
    end  
  end
 endmodule
