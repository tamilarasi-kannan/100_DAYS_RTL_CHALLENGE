module rom_design_tb();
  reg [3:0] add;
  wire [7:0] data;
  
  rom_design dut(.add(add),.data(data));
  
  initial begin
    repeat(9) begin
      add = $random();
      #10;
      $monitor("address = %h | data = %h",add,data);
    end
  end
endmodule
