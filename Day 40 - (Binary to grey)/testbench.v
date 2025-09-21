module binary2grey_tb();
  
  parameter n=4;
  reg [n-1:0] binary;
  wire [n-1:0] grey ;
  
  binary2grey dut(.binary(binary),.grey(grey));
  
  initial begin 
    repeat(9) begin
    binary = $random();
    #10;
    $monitor("binary = %b grey = %b",binary,grey);
    end
  end
   
endmodule
