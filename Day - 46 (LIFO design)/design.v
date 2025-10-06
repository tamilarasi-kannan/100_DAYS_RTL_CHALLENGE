module lifo_stack (
    input clk, rst,
    input push, pop,
    input [7:0] din,
    output reg [7:0] dout,
    output reg full, empty
);

    reg [7:0] mem [15:0];   
    reg [3:0] sp;           

    always @(posedge clk) begin
        if (rst) begin
            sp <= 0;
            full <= 0;
            empty <= 1;
            dout <= 0;
        end else begin
           
            if (push && !full) begin
                mem[sp] <= din;
                sp <= sp + 1;
            end
          
            if (pop && !empty) begin
                sp <= sp - 1;          
                dout <= mem[sp - 1];   
            end

        
            full  <= (sp == 16);
            empty <= (sp == 0);
        end
    end
endmodule

