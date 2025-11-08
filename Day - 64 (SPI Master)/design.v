module spi_master (
    input clk, rst, start,       
    input  [7:0] data_in,     
    input  miso, mode,       
    output reg  mosi,        
    output reg  sclk,        
    output reg  cs,         
    output reg  done,       
    output reg [7:0] data_out );
  
 reg [2:0] bit_cnt;
 reg [7:0] shift_reg;
  
 always @(posedge clk or posedge rst) begin
    if(rst)
        sclk <= 0;
    else if(!cs)
        sclk <= ~sclk; 
 end
  
 always @(posedge clk or posedge rst) begin
    if(rst) begin
        cs       <= 1;
        done     <= 0;
        bit_cnt  <= 0;
        data_out <= 0; 
    end
    else begin
        if(start && cs) begin
            cs        <= 0;
            shift_reg <= data_in;
            bit_cnt   <= 7;
            done      <= 0;   
        end
        if(!cs) begin
            if(mode == 0) begin 
                if(sclk == 0)
                    mosi <= shift_reg[bit_cnt];
                else begin
                    data_out[bit_cnt] <= miso;
                    if(bit_cnt == 0) begin
                        cs   <= 1;  done <= 1;
                    end 
                  else
                        bit_cnt <= bit_cnt - 1; 
                end
            end 
          else begin       
                if(sclk == 1)
                    mosi <= shift_reg[bit_cnt];
                else begin
                    data_out[bit_cnt] <= miso;
                    if(bit_cnt == 0) begin
                        cs   <= 1;
                        done <= 1;
                    end 
                  else
                        bit_cnt <= bit_cnt - 1;
                end 
          end  
        end  
    end
 end
endmodule
