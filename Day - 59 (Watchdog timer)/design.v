module watchdog_timer ( input  clk, input  rst, input  kick, output reg timeout );
  
    reg [7:0] cnt;   
  
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cnt     <= 8'd0;
            timeout <= 1'b0;    
        end
        else begin
            if(kick) begin
                cnt     <= 8'd0; 
                timeout <= 1'b0;  
            end
            else begin
                cnt <= cnt + 1;  
              if(cnt == 8'd50) 
                    timeout <= 1'b1; 
            end
        end 
    end
 endmodule
