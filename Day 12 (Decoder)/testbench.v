module decoder3x8_tb();
  reg [2:0] in;
  wire [7:0] out;
  
  decoder3X8 dut(.in(in),.out(out));
  
  initial begin 
    repeat(15) begin
      in = $random();
      #10;
      $display("in = %b | out = %b",in,out);
    end
  end
endmodule
