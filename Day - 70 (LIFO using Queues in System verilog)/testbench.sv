module lifo_tb;
  
  int stack_q[$];
  
  task lifo_push(input int data);
    stack_q.push_back(data); 
    $display("PUSH : %0d -> STACK = %p", data, stack_q);
  endtask

  task automatic lifo_pop();
    int out;
    if (stack_q.size() > 0) begin
      out = stack_q.pop_back(); 
      $display("POP  : %0d -> STACK = %p", out, stack_q);
    end else
      $display("STACK is EMPTY!");
  endtask

  initial begin

    lifo_push(10);
    lifo_push(20);
    lifo_push(30);

    lifo_pop();
    lifo_pop();
    
    lifo_push(40);

    lifo_pop();
    lifo_pop();
    lifo_pop(); 
  end

endmodule
