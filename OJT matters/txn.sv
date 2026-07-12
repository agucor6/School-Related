class elevare_txn;
    // TODO: Declare rand fields needed by the DUT
    // inputs declared
    rand logic i_porb;
    rand logic i_button_sel;
    rand logic i_up_button;
    rand logic i_down_button;
    rand logic i_elev_speed;
    rand logic i_door_speed;
    rand logic i_open;
    rand logic i_close;
    rand logic i_overload_max;
    rand logic i_weight_read;
    rand logic [15:0] i_down_floors;
    rand logic [15:0] i_up_floors;
    rand logic [15:0] i_floor_sel;

    //outputs declared
    logic o_elev_dir;
    logic o_elev_pulse;
    logic o_door_dir;
    logic o_door_pulse;
    logic o_alarm;
    logic [15:0] o_curr_floor;

    rand txn_type_t   txn_type;
    rand logic [6:0]  delay;

    virtual function void display();
        // TODO: Display all the field values of the transaction class
        $display("\n-------------------- ELEVARE TXN --------------------");
        $display("------- PACKET ------- ");
        // display inputs
        $display(" i_porb          :     %0d", i_porb);
        $display(" i_button_sel    :     %0d", i_button_sel);
        $display(" i_up_button     :     %0d", i_up_button);
        $display(" i_down_button   :     %0d", i_down_button);
        $display(" i_elev_speed    :     %0d", i_elev_speed);
        $display(" i_door_speed    :     %0d", i_door_speed);
        $display(" i_open          :     %0d", i_open);
        $display(" i_close         :     %0d", i_close);
        $display(" i_overload_max  :     %0d", i_overload_max);
        $display(" i_weight_read   :     %0d", i_weight_read);
        $display(" i_down_floors   :     %0d", i_down_floors);
        $display(" i_up_floors     :     %0d", i_up_floors);
        $display(" i_floor_sel     :     %0d", i_floor_sel);

        //display outputs
        $display(" o_elev_pulse    :     %0d", o_elev_pulse);
        $display(" o_door_dir      :     %0d", o_door_dir);
        $display(" o_elev_dir      :     %0d", o_elev_dir);
        $display(" o_door_pulse    :     %0d", o_door_pulse);
        $display(" o_alarm         :     %0d", o_alarm);
        $display(" oo_curr_floor   :     %0d", o_curr_floor);

        $display("  txn_t          :     %s ", txn_type.name());
        $display("  delay          :     %d ", delay);
        $display("--------------------------------------------------\n");
    endfunction: display
endclass: elevare_txn