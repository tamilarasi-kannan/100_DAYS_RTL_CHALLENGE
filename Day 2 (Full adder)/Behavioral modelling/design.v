module full_add (a,b,c,sum,carry);
  parameter N = 4;
  input reg [N-1:0] a,b,c;
  output reg [N-1:0] sum;
  output reg carry;
  
  always@(*) begin
   sum <= a^b^c;
   carry  <= (a&b) | (b&c) |(c&a);
  end
  
endmodule
