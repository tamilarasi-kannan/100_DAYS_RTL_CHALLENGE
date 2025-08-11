module mux_tb();
  reg [3:0] in;
  reg [1:0] sel;
  wire y;
  
  mux dut(.in(in),.sel(sel),.y(y));
  
  initial begin 
    repeat(15) begin
      {sel,in} = $random();
    #10;
      $display("sel = %b | in = %b | y = %b",sel,in,y);
  end
  end
  
endmodule
