module interrupt_controller (
  input clk,rst, 
  input  [3:0] irq, 
  input int_ack, 
  output reg int_req, 
  output reg [1:0] int_id);
  
    reg [3:0] pending;   
  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pending <= 4'b0000;
            int_req <= 1'b0;
            int_id  <= 2'b00;
        end 
      else begin
            pending <= pending | irq;
            if (pending != 0) begin
                casex (pending)
                    4'b1xxx: begin int_id <= 2'b11; int_req <= 1'b1; end 
                    4'b01xx: begin int_id <= 2'b10; int_req <= 1'b1; end 
                    4'b001x: begin int_id <= 2'b01; int_req <= 1'b1; end 
                    4'b0001: begin int_id <= 2'b00; int_req <= 1'b1; end 
                endcase 
            end
            if (int_ack) begin
                pending[int_id] <= 1'b0;
                int_req <= 1'b0;
            end  
      end  
    end
 endmodule
