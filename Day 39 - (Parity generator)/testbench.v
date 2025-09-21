module parity_tb();
  reg [2:0] data;
  wire even_parity,odd_parity;
  
  parity_generator dut(.data(data),.even_parity(even_parity),.odd_parity(odd_parity));
  
  initial begin
    repeat(10) begin
    data = $random();
    #10;
    $monitor("data = %b | even parity = %b | odd parity = %b",data,even_parity,odd_parity);
  end
  end
endmodule
