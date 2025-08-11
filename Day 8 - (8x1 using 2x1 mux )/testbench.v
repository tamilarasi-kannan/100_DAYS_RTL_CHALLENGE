module tb();
  reg [2:0] sel;
  reg [7:0] i;
  wire y;
  
  mux8x1 dut(sel,i,y);
  
  initial begin
    repeat(15) begin
      {sel,i} = $random();
      #20;
      $display("sel = %b | i = %b | y = %b",sel,i,y);
    end
  end 
  
 endmodule
