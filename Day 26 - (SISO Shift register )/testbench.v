module tb_siso_reg;

   reg clk,rst,si;
  wire so;
  
  siso dut(.clk(clk),.rst(rst),.si(si),.so(so));
  
  initial begin
    clk = 0;
    forever#5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    #10;
    rst = 0;
    si = $random();
  end
  
    initial begin
      $monitor("Time=%0t | rst = %b | si=%b | so=%b", $time, rst,si, so);
      #200;
      $finish;
    end

endmodule
