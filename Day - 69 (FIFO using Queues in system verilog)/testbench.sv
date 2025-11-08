module fifo_tb;

  int fifo_q[$];

  task fifo_push(input int data);
    fifo_q.push_back(data); 
    $display("PUSH : %0d -> FIFO = %p", data, fifo_q);
  endtask

  task automatic fifo_pop();
    int out;
    if (fifo_q.size() > 0) begin
      out = fifo_q.pop_front(); 
      $display("POP  : %0d -> FIFO = %p", out, fifo_q);
    end else begin
      $display("FIFO is empty!!");
    end
  endtask

  initial begin

    fifo_push(10);
    fifo_push(20);
    fifo_push(30);

    fifo_pop();
    fifo_pop();

    fifo_push(40);

    fifo_pop();
    fifo_pop();
    fifo_pop(); 
  end

endmodule
