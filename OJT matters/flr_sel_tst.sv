// ----------------------------------------------------------------------
// TEST     : floor_select_test
// DETAILS  : Verifies if floor is selected
// ----------------------------------------------------------------------
// IMPLEMENTATION NOTE:
// 1. Create a test when floor is selected
// 2. Transmit a signal when floor is selected and see if floor is confirmed selected
// 3. Repeat steps 1 to 2 for random floors
// ----------------------------------------------------------------------

program testcase (elevare_input_if input_if, elevare_output_if output_if);
    elevare_env env;
    elevare_txn txn;
    mailbox tst2drv;

    logic [15:0] exp_flr_q [$];

    initial begin
        $display(" ******************** Start of testcase ****************");
        txn = new();
        tst2drv = new();

        env = new(input_if, output_if, tst2drv);
        env.build();
        env.reset();
        env.start();

        assert (txn.randomize() with {
            txn_type         == IDLE_FLOOR_UP_DOWN;
            txn.i_up_floors   == 'h0000;
            txn.i_down_floors == 'h0000;
            txn.i_porb        == 'b1;
        });

        tst2drv.put(txn);

        txn.display();

        for (int i = 15; i >= 0; i--) begin
            if (txn.i_floor_sel[i] == 'b1)
                exp_flr_q.push_front(i + 1);
        end

        $display("Queue:         %0p", exp_flr_q);
        $display("Output floor: %0d", output_if.o_curr_floor);

        env.wait_for_end();
        env.report();

        #1000;

    end

    final
        $display(" ******************** End of testcase ****************");

endprogram: testcase