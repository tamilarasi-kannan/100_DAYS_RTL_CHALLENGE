module demux1x8(sel,in,y);
  input [2:0] sel;
  input in;
  output reg [7:0] y;
  
  always@(*) begin
    y = 8'b00000000;
    case(sel)
      3'b000 : y[0] = in;
      3'b001 : y[1] = in;
      3'b010 : y[2] = in;
      3'b011 : y[3] = in;
      3'b100 : y[4] = in;
      3'b101 : y[5] = in;
      3'b110 : y[6] = in;
      3'b111 : y[7] = in;
      default : y = 1'bx;
    endcase
  end
endmodule  
  
module full_subt(a,b,c,diff,borrow);
  input a,b,c;
  output diff,borrow;
  wire [7:0] y;
  
  demux1x8 inst(.sel({a,b,c}),.y(y),.in(1'b1));
    
  assign diff = y[1]| y[2]| y[4]| y[7];
  assign borrow = y[1] | y[2] | y[3] | y[7];
       
endmodule 
