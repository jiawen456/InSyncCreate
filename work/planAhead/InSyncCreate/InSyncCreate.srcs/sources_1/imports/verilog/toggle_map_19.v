/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module toggle_map_19 (
    input clk,
    input rst,
    input [24:0] cursor,
    input [24:0] map,
    input mask_type,
    output reg [24:0] out,
    output reg completed
  );
  
  
  
  reg [24:0] completed_or;
  
  reg [24:0] completed_and;
  
  reg [24:0] completed_or_x;
  
  reg [24:0] completed_and_x;
  
  wire [25-1:0] M_alu_out;
  reg [25-1:0] M_alu_a;
  reg [25-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_37 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  wire [25-1:0] M_get_neighbours_up;
  wire [25-1:0] M_get_neighbours_down;
  wire [25-1:0] M_get_neighbours_left;
  wire [25-1:0] M_get_neighbours_right;
  reg [25-1:0] M_get_neighbours_cursor;
  get_neighbours_38 get_neighbours (
    .clk(clk),
    .rst(rst),
    .cursor(M_get_neighbours_cursor),
    .up(M_get_neighbours_up),
    .down(M_get_neighbours_down),
    .left(M_get_neighbours_left),
    .right(M_get_neighbours_right)
  );
  wire [25-1:0] M_get_neighbours_x_up_left;
  wire [25-1:0] M_get_neighbours_x_down_left;
  wire [25-1:0] M_get_neighbours_x_up_right;
  wire [25-1:0] M_get_neighbours_x_down_right;
  reg [25-1:0] M_get_neighbours_x_cursor;
  get_neighbours_x_39 get_neighbours_x (
    .clk(clk),
    .rst(rst),
    .cursor(M_get_neighbours_x_cursor),
    .up_left(M_get_neighbours_x_up_left),
    .down_left(M_get_neighbours_x_down_left),
    .up_right(M_get_neighbours_x_up_right),
    .down_right(M_get_neighbours_x_down_right)
  );
  reg [3:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [24:0] M_mask1_d, M_mask1_q = 1'h0;
  reg [24:0] M_mask2_d, M_mask2_q = 1'h0;
  reg [24:0] M_mask3_d, M_mask3_q = 1'h0;
  reg [24:0] M_mask4_d, M_mask4_q = 1'h0;
  reg [24:0] M_out_temp_d, M_out_temp_q = 1'h0;
  reg [24:0] M_mask1_x_d, M_mask1_x_q = 1'h0;
  reg [24:0] M_mask2_x_d, M_mask2_x_q = 1'h0;
  reg [24:0] M_mask3_x_d, M_mask3_x_q = 1'h0;
  reg [24:0] M_mask4_x_d, M_mask4_x_q = 1'h0;
  reg [24:0] M_out_temp_x_d, M_out_temp_x_q = 1'h0;
  
  always @* begin
    M_mask1_x_d = M_mask1_x_q;
    M_mask1_d = M_mask1_q;
    M_mask2_d = M_mask2_q;
    M_mask3_d = M_mask3_q;
    M_out_temp_d = M_out_temp_q;
    M_mask4_d = M_mask4_q;
    M_mask3_x_d = M_mask3_x_q;
    M_out_temp_x_d = M_out_temp_x_q;
    M_mask4_x_d = M_mask4_x_q;
    M_ctr_d = M_ctr_q;
    M_mask2_x_d = M_mask2_x_q;
    
    M_get_neighbours_cursor = cursor;
    M_get_neighbours_x_cursor = cursor;
    M_alu_a = 25'h0000000;
    M_alu_b = 25'h0000000;
    M_alu_alufn = 6'h00;
    M_mask1_d = M_mask1_q;
    M_mask2_d = M_mask2_q;
    M_mask3_d = M_mask3_q;
    M_mask4_d = M_mask4_q;
    M_mask1_x_d = M_mask1_x_q;
    M_mask2_x_d = M_mask2_x_q;
    M_mask3_x_d = M_mask3_x_q;
    M_mask4_x_d = M_mask4_x_q;
    M_out_temp_d = M_out_temp_q;
    M_out_temp_x_d = M_out_temp_x_q;
    M_ctr_d = M_ctr_q + 1'h1;
    out = 25'h0000000;
    
    case (M_ctr_q)
      4'h0: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = cursor;
        M_alu_b = M_get_neighbours_up;
        M_mask1_d = M_alu_out;
      end
      4'h1: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = M_mask1_q;
        M_alu_b = M_get_neighbours_down;
        M_mask2_d = M_alu_out;
      end
      4'h2: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = M_mask2_q;
        M_alu_b = M_get_neighbours_left;
        M_mask3_d = M_alu_out;
      end
      4'h3: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = M_mask3_q;
        M_alu_b = M_get_neighbours_right;
        M_mask4_d = M_alu_out;
      end
      4'h4: begin
        M_alu_alufn = 6'h16;
        M_alu_a = map;
        M_alu_b = M_mask4_q;
        M_out_temp_d = M_alu_out;
      end
      4'h5: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = cursor;
        M_alu_b = M_get_neighbours_x_up_left;
        M_mask1_x_d = M_alu_out;
      end
      4'h6: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = M_mask1_x_q;
        M_alu_b = M_get_neighbours_x_down_left;
        M_mask2_x_d = M_alu_out;
      end
      4'h7: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = M_mask2_x_q;
        M_alu_b = M_get_neighbours_x_up_right;
        M_mask3_x_d = M_alu_out;
      end
      4'h8: begin
        M_alu_alufn = 6'h1e;
        M_alu_a = M_mask3_x_q;
        M_alu_b = M_get_neighbours_x_down_right;
        M_mask4_x_d = M_alu_out;
      end
      4'h9: begin
        M_alu_alufn = 6'h16;
        M_alu_a = map;
        M_alu_b = M_mask4_x_q;
        M_out_temp_x_d = M_alu_out;
      end
    endcase
    if (mask_type == 1'h0) begin
      out = M_out_temp_q;
    end else begin
      if (mask_type == 1'h1) begin
        out = M_out_temp_x_q;
      end
    end
    completed = 1'h0;
    completed_or = (|M_out_temp_q);
    if (completed_or == 1'h0) begin
      completed = 1'h1;
    end
    completed_and = (&M_out_temp_q);
    if (completed_and == 1'h1) begin
      completed = 1'h1;
    end
    completed_or_x = (|M_out_temp_x_q);
    if (completed_or_x == 1'h0) begin
      completed = 1'h1;
    end
    completed_and_x = (&M_out_temp_x_q);
    if (completed_and_x == 1'h1) begin
      completed = 1'h1;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
      M_mask1_q <= 1'h0;
      M_mask2_q <= 1'h0;
      M_mask3_q <= 1'h0;
      M_mask4_q <= 1'h0;
      M_out_temp_q <= 1'h0;
      M_mask1_x_q <= 1'h0;
      M_mask2_x_q <= 1'h0;
      M_mask3_x_q <= 1'h0;
      M_mask4_x_q <= 1'h0;
      M_out_temp_x_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
      M_mask1_q <= M_mask1_d;
      M_mask2_q <= M_mask2_d;
      M_mask3_q <= M_mask3_d;
      M_mask4_q <= M_mask4_d;
      M_out_temp_q <= M_out_temp_d;
      M_mask1_x_q <= M_mask1_x_d;
      M_mask2_x_q <= M_mask2_x_d;
      M_mask3_x_q <= M_mask3_x_d;
      M_mask4_x_q <= M_mask4_x_d;
      M_out_temp_x_q <= M_out_temp_x_d;
    end
  end
  
endmodule
