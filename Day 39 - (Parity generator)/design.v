module parity_generator (
    input  [2:0] data,
    output even_parity, odd_parity
);

    assign even_parity = data[2] ^ data[1] ^ data[0];    
    assign odd_parity  = ~even_parity;                 

endmodule
