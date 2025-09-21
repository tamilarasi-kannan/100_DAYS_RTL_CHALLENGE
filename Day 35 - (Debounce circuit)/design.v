module debounce(clk,rst,btn,btn_out);
  parameter N = 10;
  input clk,rst,btn;
  output reg btn_out;
  
  reg[N-1:0]counter;
  
  
  always@(posedge clk) begin
    if(rst) begin
      counter <= 0;
      btn_out <=0;
    end
    else if(btn == btn_out) begin
      counter <= 0;
      btn_out <= btn;
    end
    else begin
      counter <= counter +1;
      if(counter >= N) begin
        btn_out <= btn;
        counter <= 0;
      end 
    end
  end 
endmodule
