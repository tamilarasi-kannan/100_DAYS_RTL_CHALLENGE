class pattern_generator();
  
 parameter N = 4;
  randc bit [N-1:0] pattern;
  
  bit[N-1:0]  num;
  
  function void pre_randomize();
    if (num < N) begin
      num++;
    end else begin
      num = 1;
    end
  endfunction
  
  constraint gen_pattern {
    foreach (pattern[i]) {
      if (i < num) 
             pattern[N-1-i] == 1;
      else              
             pattern[N-1-i] == 0; } };
 endclass
    
 module pattern_tb ();
   
  pattern_generator #(.N(8))  byte_pattern;
  pattern_generator #(.N(32)) word_pattern;
   
  initial begin
    byte_pattern = new();
    word_pattern = new();
    
    repeat (8) begin
      byte_pattern.randomize();
      $display("%b", byte_pattern.pattern);
    end
    
    repeat (32) begin
      word_pattern.randomize();
      $display("%b", word_pattern.pattern);
    end  
  end
 endmodule
