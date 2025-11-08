module priority_bus_mux_tb;
  
    reg  [3:0] req;
    reg  [7:0] d0, d1, d2, d3;
    wire [1:0] sel;
    wire [7:0] data_out;
  
    priority_bus_mux DUT (.req(req), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .data_out(data_out));
  
    initial begin
        d0 = 8'hA1;
        d1 = 8'hB2;
        d2 = 8'hC3;
        d3 = 8'hD4;
      
        $monitor("TIME=%0t | req=%b | sel=%b | data_out=%h",$time, req, sel, data_out);
      
        req = 4'b0000;  #10; 
        req = 4'b0001;  #10; 
        req = 4'b0011;  #10; 
        req = 4'b0101;  #10; 
        req = 4'b1110;  #10; 
        req = 4'b1000;  #10;
        $finish;
    end
  
 endmodule
