module digital_lock (
    input  wire clk,
    input  wire rst,      
    input  wire key,      
    output reg  unlocked  
);

    parameter S0   = 3'b000; 
    parameter S1   = 3'b001; 
    parameter S2   = 3'b010; 
    parameter S3   = 3'b011; 
    parameter OPEN = 3'b100; 

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end
  
    always @(*) begin
        next_state = state;
        unlocked = 0;

        case (state)
            S0: begin
                if (key == 1) next_state = S1;
                else next_state = S0;
            end
            S1: begin
                if (key == 0) next_state = S2;
                else next_state = S1;
            end
            S2: begin
                if (key == 1) next_state = S3;
                else next_state = S0;
            end
            S3: begin
                if (key == 1) next_state = OPEN;
                else next_state = S2; 
            end
            OPEN: begin
                unlocked = 1;          
                if (key == 1) next_state = S1;
                else next_state = S0;
            end
            default: next_state = S0;
        endcase
    end

endmodule

