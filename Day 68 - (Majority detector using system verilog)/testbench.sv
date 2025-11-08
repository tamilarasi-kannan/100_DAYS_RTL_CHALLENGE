module tb_majority_array;

    parameter N = 8;
    logic [N-1:0] in;
    int count;
    logic majority;
    int i;

    initial begin
        in = 8'b0000_0000; #5;
        calc_majority(in);

        in = 8'b0110_0010; #5;
        calc_majority(in);

        in = 8'b1111_0000; #5;
        calc_majority(in);

        in = 8'b1111_1000; #5;
        calc_majority(in);

        in = 8'b1010_1011; #5;
        calc_majority(in);

        $finish;
    end
    task calc_majority(input logic [N-1:0] arr);
        begin
            count = 0;
            for (i = 0; i < N; i++) begin
                if (arr[i])
                    count++;
            end
            majority = (count > (N/2)) ? 1'b1 : 1'b0;

          $display("Time = %0t | Input array = %b | Majority = %b (ones = %0d)", $time, arr, majority, count);
        end
    endtask

endmodule

