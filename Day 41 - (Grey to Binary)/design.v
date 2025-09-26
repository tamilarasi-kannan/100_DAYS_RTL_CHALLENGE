module graytobinary(gray,binary);
  parameter N = 4;
  input [N-1:0] gray;
  output [N-1:0] binary;
  
  reg [N-1:0] temp;
  
  always@(*) begin
    temp[N-1] = gray[N-1];
    
    for(integer i=N-2;i>=0;i = i-1) begin
      temp[i] = temp[i+1] ^ gray[i];
    end
  end
  
  assign binary = temp;
endmodule
  
