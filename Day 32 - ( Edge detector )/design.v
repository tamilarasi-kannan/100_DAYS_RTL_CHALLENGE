module both_edge_detector(
    input  clk,     
    input  rst,     
    input  din,     
    output reg dout 
);

    reg din_dly; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            din_dly <= 0;
            dout    <= 0;
        end else begin
            dout    <= din ^ din_dly;  
            din_dly <= din;            
        end
    end
endmodule
