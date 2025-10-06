module uart_transmitter(clk,rst,datain,tx,data_valid);
  input clk,rst;
  input [7:0] datain;
  input data_valid;
  output reg tx;
  
  parameter baudrate = 10;
  parameter clk_freq = 1000;
  localparam baud_cnt = clk_freq/baudrate;
  
  reg [9:0] shift_reg;
  reg [15:0] baud_counter;
  reg [3:0] bit_index;
  reg transmitting;
  
  always@(posedge clk) begin
    if(rst) begin
      baud_counter <= 0;
      bit_index <= 0;
      tx <= 1'b1;
      transmitting <= 0;
    end
    else begin
      if(data_valid && !transmitting) begin
        shift_reg <= {1'b1,datain,1'b0};
        transmitting <= 1;
        bit_index <= 0;
        baud_counter <= 0;
      end
      else if(transmitting) begin
        if(baud_counter == baud_cnt - 1) begin
          baud_counter <= 0;
          tx <= shift_reg[bit_index];
          bit_index <= bit_index + 1;
          if(bit_index == 9) begin
            transmitting <= 0;
            tx = 1'b1;
          end
        end 
        else begin
          baud_counter <= baud_counter + 1;
        end
      end 
    end
  end
endmodule
          
        
