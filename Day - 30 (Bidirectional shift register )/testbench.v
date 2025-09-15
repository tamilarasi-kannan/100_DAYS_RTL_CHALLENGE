module bishift_reg_tb;
   parameter MSB = 4;        

   reg data;                  
   reg clk;                   
   reg en;                    
   reg mode;                   
   reg rst;                  
   wire [MSB-1:0] out;        

   
  bishift_reg  #(MSB) dut  (  .d (data),
                             .clk (clk),
                             .en (en),
                            .mode (mode),
                             .rst (rst),
                             .out (out));

   always #10 clk = ~clk;

   initial begin
      clk <= 0;
      en <= 0;
      mode <= 0;
      rst <= 0;
      data <= 1;
   end

   initial begin
      rst <= 0;
      #20 rst <= 1;
          en <= 1;
          
      repeat (7) @ (posedge clk)
         data <= ~data;
   
     
      #10 mode <= 1;
      repeat (7) @ (posedge clk)
         data <= ~data;

      repeat (7) @ (posedge clk);
      
       #300 $finish;
   end

   
   initial
     $monitor ("rst=%0b data=%b, en=%0b, mode=%0b, out=%b", rst, data, en, mode, out);
  
endmodule
