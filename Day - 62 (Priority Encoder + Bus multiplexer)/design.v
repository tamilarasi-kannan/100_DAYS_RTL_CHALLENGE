module priority_bus_mux ( 
  input  [3:0] req, 
  input  [7:0] d0, d1, d2, d3, 
  output reg [1:0] sel,      
  output reg [7:0] data_out);
  
    always @(*) begin
        if(req[3])
            sel = 2'b11;    
      else if(req[2])
            sel = 2'b10;   
      else if(req[1])
            sel = 2'b01;   
      else if(req[0])
            sel = 2'b00;   
      else
            sel = 2'b00;  
    end
  
    always @(*) begin
        case(sel)
            2'b00: data_out = d0;
            2'b01: data_out = d1;
            2'b10: data_out = d2;
            2'b11: data_out = d3;
            default: data_out = 8'h00;
        endcase 
    end
 endmodule
