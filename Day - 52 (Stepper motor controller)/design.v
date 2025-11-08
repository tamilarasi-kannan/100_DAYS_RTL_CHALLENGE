module stepper_motor (
    input clk,
    input rst,
    input enable,
    input dir,          
    output reg [3:0] coil
 );
    reg [1:0] step;
    reg [1:0] next_step;
  
    always @(posedge clk) begin
      if (rst) begin
            step <= 2'd0;
            coil <= 4'b1000;  
      end
      else if (enable) begin
            if (dir == 1'b0)
                next_step = (step == 2'd3) ? 2'd0 : step + 2'd1; // CW
            else
                next_step = (step == 2'd0) ? 2'd3 : step - 2'd1; // CCW
            step <= next_step; 
            case (next_step)
                2'd0: coil <= 4'b1000;
                2'd1: coil <= 4'b0100;
                2'd2: coil <= 4'b0010;
                2'd3: coil <= 4'b0001;
                default: coil <= 4'b0000;
            endcase  
      end
        else begin
            coil <= 4'b0000;
        end  
    end
 endmodule
