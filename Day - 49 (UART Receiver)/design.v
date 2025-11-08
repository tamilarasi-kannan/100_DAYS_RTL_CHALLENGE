module uart_receiver (
    input clk,             
    input rst,             
    input rx,             
    output reg [7:0] data_out,  
    output reg data_valid       
);
  
    parameter BAUD_RATE = 10;   
    parameter CLK_FREQ = 1000;  
    localparam BAUD_CNT = CLK_FREQ / BAUD_RATE;
  
    reg [15:0] baud_counter = 0;  
    reg [3:0] bit_index = 0;      
    reg [7:0] shift_reg = 0;      
    reg receiving = 0;      
  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            baud_counter <= 0;
            bit_index <= 0;
            receiving <= 0;
            data_valid <= 0;
            data_out <= 0;
        end 
      else begin
            data_valid <= 0; 
            if (!receiving) begin
                if (rx == 0) begin
                    receiving <= 1;       
                    baud_counter <= 0;    
                    bit_index <= 0;       
                end
            end
            else begin
                if (baud_counter == BAUD_CNT - 1) begin
                    baud_counter <= 0;
                    bit_index <= bit_index + 1;
                    if (bit_index >= 1 && bit_index <= 8)
                        shift_reg[bit_index - 1] <= rx; 
                    if (bit_index == 9) begin
                        data_out <= shift_reg;
                        data_valid <= 1;
                        receiving <= 0;
                    end
                end 
              else begin
                    baud_counter <= baud_counter + 1;
                end  
            end 
      end 
    end
 endmodule
