module mealy_machine_tb;

  reg clk;
  reg rst;
  reg data_in;
  reg valid;
  wire pattern_dect;


  mealy_machine dut (
    .rst(rst),
    .clk(clk),
    .data_in(data_in),
    .valid(valid),
    .pattern_dect(pattern_dect)
  );


  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  initial begin
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, valid, data_in, pattern_dect);


    rst = 1; valid = 0; data_in = 0;
    #10;
    rst = 0;

    valid = 1;

    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10; 

    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;

    valid = 0;
    #20;
    $finish;
  end

endmodule

