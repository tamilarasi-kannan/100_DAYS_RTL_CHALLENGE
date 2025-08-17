module decoder3x8 (a,b,c,y);
  input a,b,c;
  output reg [7:0] y;
  
  always@(*) begin
    case({a,b,c}) 
      3'b000 : y = 8'b00000001;
      3'b001 : y = 8'b00000010;
      3'b010 : y = 8'b00000100;
      3'b011: y = 8'b00001000;
      3'b100 : y = 8'b00010000;
      3'b101 : y = 8'b00100000;
      3'b110 : y = 8'b01000000;
      3'b111 : y = 8'b10000000;
      default : y = 8'b0;
    endcase
  end
endmodule

module full_adder(a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  
  wire [7:0] y;
  decoder3x8 dut(.a(a),.b(b),.c(c),.y(y));
  
  assign sum = y[1] | y[2] | y[4] | y[7];
  assign carry = y[3] | y[5] | y[6] | y[7];
endmodule
  
  
