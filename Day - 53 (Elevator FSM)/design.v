module elevator_fsm (
    input clk,
    input reset,
    input [3:0] req,     
    output reg [1:0] floor, 
    output reg motor_up,
    output reg motor_down,
    output reg door_open
 );
  
    parameter IDLE      = 2'b00,
              MOVE_UP   = 2'b01,
              MOVE_DOWN = 2'b10,
              OPEN_DOOR = 2'b11;
    reg [1:0] state, next_state;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            floor <= 2'd0;   
        end
        else begin
            state <= next_state;
        end
    end
    always @(*) begin
        motor_up   = 0;
        motor_down = 0;
        door_open  = 0;
        next_state = state;
        case (state)
            IDLE: begin
                if (req[floor]) begin
                    next_state = OPEN_DOOR; 
                end
                else if ( (req[3] & (floor < 3)) || 
                          (req[2] & (floor < 2)) || 
                          (req[1] & (floor < 1)) ) begin
                    next_state = MOVE_UP; 
                end
                else if ( (req[0] & (floor > 0)) || 
                          (req[1] & (floor > 1)) || 
                          (req[2] & (floor > 2)) ) begin
                    next_state = MOVE_DOWN; 
                end
            end
            MOVE_UP: begin
                motor_up = 1;
                if (req[floor]) next_state = OPEN_DOOR;
                else if (floor == 2'd3) next_state = IDLE; 
            end
            MOVE_DOWN: begin
                motor_down = 1;
                if (req[floor]) next_state = OPEN_DOOR;
                else if (floor == 2'd0) next_state = IDLE; 
            end
            OPEN_DOOR: begin
                door_open = 1;
                next_state = IDLE; 
            end
        endcase
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            floor <= 2'd0;
        end
        else begin
            case (state)
                MOVE_UP:   if (floor < 3) floor <= floor + 1;
                MOVE_DOWN: if (floor > 0) floor <= floor - 1;
            endcase
        end
 end
endmodule
