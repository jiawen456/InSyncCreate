/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module processor_2 (
    input clk,
    input rst,
    input [4:0] button,
    input start_button,
    input reset_button,
    output reg [7:0] display_seg0,
    output reg [7:0] display_seg1,
    output reg [7:0] display_seg2,
    output reg [7:0] display_seg3,
    output reg [24:0] out
  );
  
  
  
  reg completed;
  
  reg check;
  
  reg [24:0] pos;
  
  wire [1-1:0] M_left_btn_out;
  reg [1-1:0] M_left_btn_in;
  edge_detector_4 left_btn (
    .clk(clk),
    .in(M_left_btn_in),
    .out(M_left_btn_out)
  );
  wire [1-1:0] M_left_btn_cond_out;
  reg [1-1:0] M_left_btn_cond_in;
  button_conditioner_5 left_btn_cond (
    .clk(clk),
    .in(M_left_btn_cond_in),
    .out(M_left_btn_cond_out)
  );
  wire [1-1:0] M_right_btn_out;
  reg [1-1:0] M_right_btn_in;
  edge_detector_4 right_btn (
    .clk(clk),
    .in(M_right_btn_in),
    .out(M_right_btn_out)
  );
  wire [1-1:0] M_right_btn_cond_out;
  reg [1-1:0] M_right_btn_cond_in;
  button_conditioner_5 right_btn_cond (
    .clk(clk),
    .in(M_right_btn_cond_in),
    .out(M_right_btn_cond_out)
  );
  wire [1-1:0] M_up_btn_out;
  reg [1-1:0] M_up_btn_in;
  edge_detector_4 up_btn (
    .clk(clk),
    .in(M_up_btn_in),
    .out(M_up_btn_out)
  );
  wire [1-1:0] M_up_btn_cond_out;
  reg [1-1:0] M_up_btn_cond_in;
  button_conditioner_5 up_btn_cond (
    .clk(clk),
    .in(M_up_btn_cond_in),
    .out(M_up_btn_cond_out)
  );
  wire [1-1:0] M_down_btn_out;
  reg [1-1:0] M_down_btn_in;
  edge_detector_4 down_btn (
    .clk(clk),
    .in(M_down_btn_in),
    .out(M_down_btn_out)
  );
  wire [1-1:0] M_down_btn_cond_out;
  reg [1-1:0] M_down_btn_cond_in;
  button_conditioner_5 down_btn_cond (
    .clk(clk),
    .in(M_down_btn_cond_in),
    .out(M_down_btn_cond_out)
  );
  wire [1-1:0] M_enter_btn_out;
  reg [1-1:0] M_enter_btn_in;
  edge_detector_4 enter_btn (
    .clk(clk),
    .in(M_enter_btn_in),
    .out(M_enter_btn_out)
  );
  wire [1-1:0] M_enter_btn_cond_out;
  reg [1-1:0] M_enter_btn_cond_in;
  button_conditioner_5 enter_btn_cond (
    .clk(clk),
    .in(M_enter_btn_cond_in),
    .out(M_enter_btn_cond_out)
  );
  wire [1-1:0] M_start_btn_out;
  reg [1-1:0] M_start_btn_in;
  edge_detector_4 start_btn (
    .clk(clk),
    .in(M_start_btn_in),
    .out(M_start_btn_out)
  );
  wire [1-1:0] M_start_btn_cond_out;
  reg [1-1:0] M_start_btn_cond_in;
  button_conditioner_5 start_btn_cond (
    .clk(clk),
    .in(M_start_btn_cond_in),
    .out(M_start_btn_cond_out)
  );
  wire [1-1:0] M_reset_btn_out;
  reg [1-1:0] M_reset_btn_in;
  edge_detector_4 reset_btn (
    .clk(clk),
    .in(M_reset_btn_in),
    .out(M_reset_btn_out)
  );
  wire [1-1:0] M_reset_btn_cond_out;
  reg [1-1:0] M_reset_btn_cond_in;
  button_conditioner_5 reset_btn_cond (
    .clk(clk),
    .in(M_reset_btn_cond_in),
    .out(M_reset_btn_cond_out)
  );
  wire [4-1:0] M_reset_ctr_value;
  reg [1-1:0] M_reset_ctr_rst;
  counter_18 reset_ctr (
    .clk(clk),
    .rst(M_reset_ctr_rst),
    .value(M_reset_ctr_value)
  );
  localparam IDLE_state = 4'd0;
  localparam CREATE_SELECT_state = 4'd1;
  localparam GAME_SELECT_state = 4'd2;
  localparam MASK_SELECT_state = 4'd3;
  localparam GEN_MAP_state = 4'd4;
  localparam PLAYING_state = 4'd5;
  localparam RESET_state = 4'd6;
  localparam CURSOR_state = 4'd7;
  localparam CHECK_state = 4'd8;
  localparam TOGGLE_state = 4'd9;
  localparam DONE_state = 4'd10;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  reg [24:0] M_blink_d, M_blink_q = 1'h0;
  reg [24:0] M_old_map_d, M_old_map_q = 1'h0;
  reg [24:0] M_current_map_d, M_current_map_q = 1'h0;
  reg [7:0] M_current_score_d, M_current_score_q = 1'h0;
  reg [7:0] M_current_highscore_d, M_current_highscore_q = 1'h0;
  reg [24:0] M_current_cursor_d, M_current_cursor_q = 25'h0000001;
  reg [24:0] M_next_cursor_d, M_next_cursor_q = 25'h0000001;
  reg [1:0] M_direction_d, M_direction_q = 1'h0;
  reg M_game_type_d, M_game_type_q = 1'h0;
  reg M_mask_type_d, M_mask_type_q = 1'h0;
  reg M_create_type_d, M_create_type_q = 1'h0;
  reg [24:0] M_out_temp_d, M_out_temp_q = 1'h0;
  wire [25-1:0] M_toggle_map_out;
  wire [1-1:0] M_toggle_map_completed;
  reg [25-1:0] M_toggle_map_cursor;
  reg [25-1:0] M_toggle_map_map;
  reg [1-1:0] M_toggle_map_mask_type;
  toggle_map_19 toggle_map (
    .clk(clk),
    .rst(rst),
    .cursor(M_toggle_map_cursor),
    .map(M_toggle_map_map),
    .mask_type(M_toggle_map_mask_type),
    .out(M_toggle_map_out),
    .completed(M_toggle_map_completed)
  );
  wire [25-1:0] M_shift_cursor_out;
  reg [2-1:0] M_shift_cursor_direction;
  reg [25-1:0] M_shift_cursor_cursor;
  shift_cursor_20 shift_cursor (
    .clk(clk),
    .rst(rst),
    .direction(M_shift_cursor_direction),
    .cursor(M_shift_cursor_cursor),
    .out(M_shift_cursor_out)
  );
  wire [1-1:0] M_check_lighted_out;
  reg [25-1:0] M_check_lighted_cursor;
  reg [25-1:0] M_check_lighted_map;
  check_lighted_21 check_lighted (
    .clk(clk),
    .rst(rst),
    .cursor(M_check_lighted_cursor),
    .map(M_check_lighted_map),
    .out(M_check_lighted_out)
  );
  
  wire [25-1:0] M_gen_map_out;
  reg [1-1:0] M_gen_map_mask_type;
  reg [1-1:0] M_gen_map_game_type;
  gen_map_temp_22 gen_map (
    .mask_type(M_gen_map_mask_type),
    .game_type(M_gen_map_game_type),
    .out(M_gen_map_out)
  );
  
  wire [5-1:0] M_get_position_pos;
  reg [25-1:0] M_get_position_cursor;
  get_position_23 get_position (
    .cursor(M_get_position_cursor),
    .pos(M_get_position_pos)
  );
  
  wire [4-1:0] M_decimal_score_out1;
  wire [4-1:0] M_decimal_score_out0;
  reg [8-1:0] M_decimal_score_a;
  decimal2_24 decimal_score (
    .a(M_decimal_score_a),
    .out1(M_decimal_score_out1),
    .out0(M_decimal_score_out0)
  );
  
  wire [4-1:0] M_decimal_highscore_out1;
  wire [4-1:0] M_decimal_highscore_out0;
  reg [8-1:0] M_decimal_highscore_a;
  decimal2_24 decimal_highscore (
    .a(M_decimal_highscore_a),
    .out1(M_decimal_highscore_out1),
    .out0(M_decimal_highscore_out0)
  );
  
  wire [8-1:0] M_sevenseg3_segs;
  reg [5-1:0] M_sevenseg3_char;
  seven_seg_26 sevenseg3 (
    .char(M_sevenseg3_char),
    .segs(M_sevenseg3_segs)
  );
  
  wire [8-1:0] M_sevenseg2_segs;
  reg [5-1:0] M_sevenseg2_char;
  seven_seg_26 sevenseg2 (
    .char(M_sevenseg2_char),
    .segs(M_sevenseg2_segs)
  );
  
  wire [8-1:0] M_sevenseg1_segs;
  reg [5-1:0] M_sevenseg1_char;
  seven_seg_26 sevenseg1 (
    .char(M_sevenseg1_char),
    .segs(M_sevenseg1_segs)
  );
  
  wire [8-1:0] M_sevenseg0_segs;
  reg [5-1:0] M_sevenseg0_char;
  seven_seg_26 sevenseg0 (
    .char(M_sevenseg0_char),
    .segs(M_sevenseg0_segs)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_create_type_d = M_create_type_q;
    M_game_type_d = M_game_type_q;
    M_current_score_d = M_current_score_q;
    M_next_cursor_d = M_next_cursor_q;
    M_blink_d = M_blink_q;
    M_direction_d = M_direction_q;
    M_out_temp_d = M_out_temp_q;
    M_current_cursor_d = M_current_cursor_q;
    M_current_highscore_d = M_current_highscore_q;
    M_mask_type_d = M_mask_type_q;
    M_current_map_d = M_current_map_q;
    M_old_map_d = M_old_map_q;
    
    M_left_btn_cond_in = button[3+0-:1];
    M_left_btn_in = M_left_btn_cond_out;
    M_right_btn_cond_in = button[4+0-:1];
    M_right_btn_in = M_right_btn_cond_out;
    M_up_btn_cond_in = button[0+0-:1];
    M_up_btn_in = M_up_btn_cond_out;
    M_down_btn_cond_in = button[2+0-:1];
    M_down_btn_in = M_down_btn_cond_out;
    M_enter_btn_cond_in = button[1+0-:1];
    M_enter_btn_in = M_enter_btn_cond_out;
    M_start_btn_cond_in = start_button;
    M_start_btn_in = M_start_btn_cond_out;
    M_reset_btn_cond_in = reset_button;
    M_reset_btn_in = M_reset_btn_cond_out;
    M_old_map_d = M_old_map_q;
    M_current_map_d = M_current_map_q;
    M_current_cursor_d = M_current_cursor_q;
    M_next_cursor_d = M_next_cursor_q;
    M_direction_d = M_direction_q;
    M_current_score_d = M_current_score_q;
    M_current_highscore_d = M_current_highscore_q;
    M_mask_type_d = M_mask_type_q;
    M_game_type_d = M_game_type_q;
    M_create_type_d = M_create_type_q;
    M_blink_d = M_blink_q + 1'h1;
    M_reset_ctr_rst = 1'h0;
    out = 25'h0000000;
    M_gen_map_mask_type = M_mask_type_q;
    M_gen_map_game_type = M_game_type_q;
    M_toggle_map_map = M_current_map_q;
    M_toggle_map_cursor = M_current_cursor_q;
    M_toggle_map_mask_type = M_mask_type_q;
    M_shift_cursor_direction = M_direction_q;
    M_shift_cursor_cursor = M_current_cursor_q;
    M_decimal_highscore_a = M_current_highscore_q;
    M_decimal_score_a = M_current_score_q;
    M_check_lighted_cursor = M_current_cursor_q;
    M_check_lighted_map = M_current_map_q;
    M_get_position_cursor = M_out_temp_q;
    
    case (M_state_q)
      IDLE_state: begin
        out = 25'h0000000;
        if (M_enter_btn_out) begin
          M_state_d = CREATE_SELECT_state;
        end
      end
      CREATE_SELECT_state: begin
        if (M_up_btn_out || M_down_btn_out || M_left_btn_out || M_right_btn_out) begin
          M_create_type_d = ~M_create_type_q;
        end
        if (M_create_type_q == 1'h0) begin
          out = 25'h04d2d60;
        end
        if (M_create_type_q == 1'h1) begin
          out = 25'h00d6044;
        end
        if (M_enter_btn_out) begin
          M_state_d = GAME_SELECT_state;
        end
      end
      GAME_SELECT_state: begin
        if (M_up_btn_out || M_down_btn_out || M_left_btn_out || M_right_btn_out) begin
          M_game_type_d = ~M_game_type_q;
        end
        if (M_game_type_q == 1'h0) begin
          out = 25'h0049240;
        end
        if (M_game_type_q == 1'h1) begin
          out = 25'h0457d44;
        end
        if (M_enter_btn_out) begin
          M_state_d = MASK_SELECT_state;
        end
      end
      MASK_SELECT_state: begin
        if (M_up_btn_out || M_down_btn_out || M_left_btn_out || M_right_btn_out) begin
          M_mask_type_d = ~M_mask_type_q;
        end
        if (M_mask_type_q == 1'h0) begin
          out = 25'h0019300;
        end
        if (M_mask_type_q == 1'h1) begin
          out = 25'h0083820;
        end
        if (M_enter_btn_out) begin
          M_state_d = GEN_MAP_state;
        end
      end
      GEN_MAP_state: begin
        if (M_create_type_q == 1'h0) begin
          M_gen_map_mask_type = M_mask_type_q;
          M_gen_map_game_type = M_game_type_q;
          M_current_map_d = M_gen_map_out;
          M_old_map_d = M_gen_map_out;
        end
        M_current_highscore_d = 8'h63;
        M_current_score_d = 8'h00;
        M_current_cursor_d = 8'h01;
        M_next_cursor_d = 8'h01;
        M_state_d = PLAYING_state;
      end
      PLAYING_state: begin
        M_current_cursor_d = M_next_cursor_q;
        M_out_temp_d = M_current_cursor_q;
        if (M_create_type_q == 1'h0 && M_reset_btn_out) begin
          M_state_d = RESET_state;
        end
        if (M_create_type_q == 1'h1 && M_reset_btn_out) begin
          M_old_map_d = M_current_map_q;
          M_create_type_d = ~M_create_type_q;
          M_state_d = RESET_state;
        end
        if (M_enter_btn_out) begin
          M_state_d = CHECK_state;
        end
        if (M_up_btn_out) begin
          M_direction_d = 2'h0;
          M_state_d = CURSOR_state;
        end
        if (M_down_btn_out) begin
          M_direction_d = 2'h1;
          M_state_d = CURSOR_state;
        end
        if (M_left_btn_out) begin
          M_direction_d = 2'h2;
          M_state_d = CURSOR_state;
        end
        if (M_right_btn_out) begin
          M_direction_d = 2'h3;
          M_state_d = CURSOR_state;
        end
        if (M_start_btn_out) begin
          M_state_d = IDLE_state;
        end
        pos = M_get_position_pos;
        out = M_current_map_q;
        out[(pos)*1+0-:1] = M_blink_q[24+0-:1];
      end
      RESET_state: begin
        M_current_map_d = M_old_map_q;
        M_current_cursor_d = 8'h01;
        M_current_score_d = 8'h00;
        M_next_cursor_d = 8'h01;
        M_state_d = PLAYING_state;
      end
      CHECK_state: begin
        check = M_check_lighted_out;
        if (check == 1'h1) begin
          M_state_d = TOGGLE_state;
        end
        if (check == 1'h0) begin
          M_state_d = PLAYING_state;
        end
        if (M_game_type_q == 1'h0 || M_create_type_q == 1'h1) begin
          M_state_d = TOGGLE_state;
        end
      end
      TOGGLE_state: begin
        completed = M_toggle_map_completed;
        M_current_map_d = M_toggle_map_out;
        if (M_create_type_q == 1'h0) begin
          M_current_score_d = M_current_score_q + 8'h01;
        end
        if (completed == 1'h0) begin
          M_state_d = PLAYING_state;
        end
        if (M_create_type_q == 1'h1 && completed == 1'h1) begin
          M_state_d = PLAYING_state;
        end
        if (M_create_type_q == 1'h0 && completed == 1'h1) begin
          M_reset_ctr_rst = 1'h1;
          M_state_d = DONE_state;
        end
      end
      CURSOR_state: begin
        M_next_cursor_d = M_shift_cursor_out;
        M_state_d = PLAYING_state;
      end
      DONE_state: begin
        M_blink_d = M_blink_q + 1'h1;
        out = {5'h19{~M_blink_q[24+0-:1]}};
        if (M_current_highscore_q > M_current_score_q) begin
          M_current_highscore_d = M_current_score_q;
        end
        if (M_start_btn_out) begin
          M_current_cursor_d = 25'h0000001;
          M_current_map_d = 25'h0000000;
          M_state_d = IDLE_state;
        end
        if (M_reset_btn_out) begin
          M_state_d = RESET_state;
        end
        if (M_reset_ctr_value == 4'hf) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
    M_sevenseg3_char = M_decimal_highscore_out1;
    M_sevenseg2_char = M_decimal_highscore_out0;
    M_sevenseg1_char = M_decimal_score_out1;
    M_sevenseg0_char = M_decimal_score_out0;
    display_seg0 = ~M_sevenseg0_segs;
    display_seg1 = ~M_sevenseg1_segs;
    display_seg2 = ~M_sevenseg2_segs;
    display_seg3 = ~M_sevenseg3_segs;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_blink_q <= 1'h0;
      M_old_map_q <= 1'h0;
      M_current_map_q <= 1'h0;
      M_current_score_q <= 1'h0;
      M_current_highscore_q <= 1'h0;
      M_current_cursor_q <= 25'h0000001;
      M_next_cursor_q <= 25'h0000001;
      M_direction_q <= 1'h0;
      M_game_type_q <= 1'h0;
      M_mask_type_q <= 1'h0;
      M_create_type_q <= 1'h0;
      M_out_temp_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_blink_q <= M_blink_d;
      M_old_map_q <= M_old_map_d;
      M_current_map_q <= M_current_map_d;
      M_current_score_q <= M_current_score_d;
      M_current_highscore_q <= M_current_highscore_d;
      M_current_cursor_q <= M_current_cursor_d;
      M_next_cursor_q <= M_next_cursor_d;
      M_direction_q <= M_direction_d;
      M_game_type_q <= M_game_type_d;
      M_mask_type_q <= M_mask_type_d;
      M_create_type_q <= M_create_type_d;
      M_out_temp_q <= M_out_temp_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule