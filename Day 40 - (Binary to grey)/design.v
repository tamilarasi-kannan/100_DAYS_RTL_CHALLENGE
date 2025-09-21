module binary2grey #(parameter n=4)
  (
  input [n-1:0] binary,
  output reg [n-1:0]grey);
  integer i;
  always@(*) begin                                                
    for(i=0;i<n-1;i=i+1) begin
       grey[i]=binary[i]^binary[i+1];
    end
   grey[n-1]=binary[n-1];
    end
endmodule
