module TFF (
    input clk,
    input rst,
    input t,
    output reg q
);
  always @(negedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;       
        else if (t)
            q <= ~q;         
        else
            q <= q;          
    end
endmodule

module ripple_counter_tff (
    input clk,
    input rst,
    output [3:0] q
);

    wire q0, q1, q2, q3;

    TFF tff0 (.clk(clk),  .rst(rst), .t(1'b1), .q(q0)); 
    TFF tff1 (.clk(q0),   .rst(rst), .t(1'b1), .q(q1));
    TFF tff2 (.clk(q1),   .rst(rst), .t(1'b1), .q(q2));
    TFF tff3 (.clk(q2),   .rst(rst), .t(1'b1), .q(q3));

    assign q = {q3, q2, q1, q0};

endmodule
  
  
  
