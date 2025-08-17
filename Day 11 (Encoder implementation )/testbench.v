module encoder8x3_tb();
  reg [7:0] in;
  wire [2:0] out;
  integer i ;
  
  encoder8x3 dut(.in(in),.out(out));
  
  initial begin 
    
    for(i = 0;i<8;i=i+1) begin
      in = 00000001 << i;
      #10;
      $display("in = %b | out = %b",in,out);
    end
  end
endmodule
