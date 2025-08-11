module mux_tb();
  reg [3:0] in;
  reg a,b;
  wire y;
  
  mux dut(.in(in),.a(a),.b(b),.y(y));
  
  initial begin 
    repeat(15) begin
    {a,b,in} = $random();
    #10;
    $display("a = %b | b = %b | in = %b | y = %b",a,b,in,y);
  end
  end
  
endmodule
