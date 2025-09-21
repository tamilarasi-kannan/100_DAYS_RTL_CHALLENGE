module bit_multiplier(a,b,result);
  input [3:0]a,b;
  output [7:0] result;
  
  reg [3:0] p1,p2,p3,p4;
  
    assign p1 = a & {4{b[0]}};
    assign p2 = a & {4{b[1]}};
    assign p3 = a & {4{b[2]}};
    assign p4 = a & {4{b[3]}};
 
  
  assign result = p1 + (p2 <<1) + (p3 <<2) + (p4 <<3);
  
endmodule
    
