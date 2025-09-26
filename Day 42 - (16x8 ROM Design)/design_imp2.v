module rom(add,data);
  input [3:0] add;
  output reg [7:0] data;
  
  reg [7:0] mem [15:0];
  
  initial begin
    $readmemh("mem.hex", mem);
  end
  
  always@(*) begin
    data <= mem[add];
  end
endmodule
