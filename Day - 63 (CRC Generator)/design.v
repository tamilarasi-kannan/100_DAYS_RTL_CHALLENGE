module crc_generator #(
    parameter CRC_WIDTH = 8,
    parameter POLYNOMIAL = 8'h07)(
    input clk, rst, data_valid, data_in,
    output reg [CRC_WIDTH-1:0] crc_out);
  
 always @(posedge clk or posedge rst) begin
    if (rst) begin
        crc_out <= 0;
    end
   
    else if (data_valid) begin
        crc_out <= {crc_out[CRC_WIDTH-2:0], data_in};
        if (crc_out[CRC_WIDTH-1])
            crc_out <= ({crc_out[CRC_WIDTH-2:0], data_in} ^ POLYNOMIAL);
    end
 end
 endmodule
