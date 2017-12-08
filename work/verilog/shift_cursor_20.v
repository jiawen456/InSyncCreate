/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shift_cursor_20 (
    input clk,
    input rst,
    input [1:0] direction,
    input [24:0] cursor,
    output reg [24:0] out
  );
  
  
  
  reg [24:0] out_temp;
  
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
  
  always @* begin
    M_get_neighbours_cursor = cursor;
    
    case (direction)
      2'h0: begin
        out_temp = M_get_neighbours_up;
      end
      2'h1: begin
        out_temp = M_get_neighbours_down;
      end
      2'h2: begin
        out_temp = M_get_neighbours_left;
      end
      2'h3: begin
        out_temp = M_get_neighbours_right;
      end
      default: begin
        out_temp = cursor;
      end
    endcase
    out = out_temp;
    if (out_temp == 25'h0000000) begin
      out = cursor;
    end
  end
endmodule
