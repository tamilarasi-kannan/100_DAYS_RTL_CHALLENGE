module greytobinary_tb();
  parameter N = 4;
  reg [N-1:0] gray;
  wire [N-1:0] binary;
  
  graytobinary dut(.gray(gray),.binary(binary));
  
  initial begin
    repeat(10) begin
      gray = $random();
      #10;
      $monitor("gray = %b | binary = %b",gray,binary);
    end
  end
endmodule
