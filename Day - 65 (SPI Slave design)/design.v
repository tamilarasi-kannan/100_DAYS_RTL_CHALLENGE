module spi_slave (
  input rst,sclk,cs,mosi,       
    output reg miso,     
    output reg [7:0] data_out, 
    input  [7:0] data_in,     
    output reg done);
  
    reg [2:0] bit_cnt;        
    reg [7:0] shift_in;         
    reg [7:0] shift_out;  
  
    always @(posedge rst or posedge sclk or posedge cs) begin
      
        if (rst) begin
            bit_cnt   <= 3'b000;
            shift_in  <= 8'b00000000;
            shift_out <= 8'b00000000;
            miso      <= 1'b0;
            done      <= 1'b0;  
        end
      
        else if (cs == 1) begin      
            bit_cnt   <= 0;
            done      <= 0;
            shift_out <= data_in;   
        end
      
        else begin                
            shift_in <= {shift_in[6:0], mosi};  
            miso     <= shift_out[7];            
            shift_out<= {shift_out[6:0], 1'b0};  
            bit_cnt <= bit_cnt + 1;
          
            if (bit_cnt == 3'b111)
                done <= 1;
            else
                done <= 0;
        end  
    end
  
    always @(*) begin
        data_out = shift_in;    
    end
  
 endmodule
