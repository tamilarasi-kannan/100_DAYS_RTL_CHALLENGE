module mealy_machine(input rst,input clk,input data_in,input valid,output reg pattern_dect);
  
   parameter s_r = 5'b00000;
   parameter s_1 = 5'b00010;
   parameter s_10 = 5'b00100;
   parameter s_101 = 5'b01000;
   parameter s_1011 = 5'b10000;
  
  reg [4:0] state,nxt_state;
  always@(posedge clk) begin
    if(rst) begin
      pattern_dect=0;
      state=0;
      nxt_state=0;
    end
    else begin
      if(valid)begin
        case(state)
          s_r: begin
            if(data_in) begin
              nxt_state=s_1;
              pattern_dect=0;
            end
            else begin
              nxt_state=s_r;
              pattern_dect=0;
            end
          end
          
          s_1: begin
            if(data_in) begin
              nxt_state=s_1;
              pattern_dect=0;
            end
            else begin
              nxt_state=s_10;
              pattern_dect=0;
            end
          end
          
          s_10: begin
            if(data_in) begin
              nxt_state=s_101;
              pattern_dect=0;
            end
            else begin
              nxt_state=s_r;
              pattern_dect=0;
            end
          end
          
          s_101: begin
            if(data_in) begin
              nxt_state=s_1011;
              pattern_dect=0;
            end
            else begin
              nxt_state=s_10;
              pattern_dect=0;
            end
          end
          
          s_1011: begin
            if(data_in) begin
              nxt_state=s_1;
              pattern_dect=0;
            end
            else begin
              nxt_state=s_10;
              pattern_dect=1;
            end
          end
          
        endcase
        state=nxt_state;
        end
  end
  end
  
    endmodule
