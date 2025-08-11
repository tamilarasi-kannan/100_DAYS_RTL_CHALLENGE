module demux1x4_tb();
reg [1:0] sel;
reg in;
wire [3:0] y;

demux1x4 dut(.sel(sel),.in(in),.y(y));

initial begin
repeat(20) begin
  {sel,in} = $random();
#10;
  $display("sel = %b | in = %b | y = %b",sel,in,y);
end
end

endmodule
