module rom_design(add,data);
  input [3:0] add;
  output reg [7:0] data;
  
  
  always@(*) begin
    case(add)
      4'h0 : data <= 8'h5d;
      4'h1 : data <= 8'h7a;
      4'h2 : data <= 8'hcd;
      4'h3 : data <= 8'h6e;
      4'h4 : data <= 8'hab;
      4'h5 : data <= 8'h9d;
      4'h6 : data <= 8'h87;
      4'h7 : data <= 8'h7f;
      4'h8 : data <= 8'hce;
      4'h9 : data <= 8'h51;
      4'ha : data <= 8'hef;
      4'hb : data <= 8'h8a;
      4'hc : data <= 8'h9b;
      4'hd : data <= 8'h1f;
      4'he : data <= 8'h2b;
      4'hf : data <= 8'h5d;
      default: data <= 8'h0;
    endcase 
  end
endmodule
