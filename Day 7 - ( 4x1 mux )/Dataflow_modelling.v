module mux(a,b,y,in);
  input a,b;
  input [4:0] in ;
  output reg y;
  
 assign y = in[0]&(~a)&(~b) | in[1]&(~a)&(b) | in[2]&(a)&(~b) | in[3]&(a)&(b);
  
endmodule
