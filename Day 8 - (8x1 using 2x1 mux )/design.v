module mux2x1(sel,i0,i1,y);
  input sel,i0,i1;
  output reg y;
  
  always@(*) begin
    case(sel) 
      1'b0 : y = i0;
      1'b1 : y = i1;
    endcase  end
 endmodule


 module mux8x1(sel,i,y);
  input [2:0] sel;
  input [7:0] i;
  output reg y;
  wire w1,w2,w3,w4,w5,w6;
   
  mux2x1 ins1 (.sel(sel[2]),.i0(i[0]),.i1(i[1]),.y(w1));
  mux2x1 ins2 (.sel(sel[2]),.i0(i[2]),.i1(i[3]),.y(w2));
  mux2x1 ins3 (.sel(sel[2]),.i0(i[4]),.i1(i[5]),.y(w3));
  mux2x1 ins4 (.sel(sel[2]),.i0(i[6]),.i1(i[7]),.y(w4));
   
  mux2x1 inst1 (.sel(sel[1]),.i0(w1),.i1(w2),.y(w5));
  mux2x1 inst2 (.sel(sel[1]),.i0(w3),.i1(w4),.y(w6));
   
  mux2x1 inst3 (.sel(sel[0]),.i0(w5),.i1(w6),.y(y));
   
 endmodule
