/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shift_24 (
    input [24:0] a,
    input [24:0] b,
    input [5:0] alufn,
    output reg [24:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        out = a << b[0+2-:3];
      end
      2'h1: begin
        out = a >> b[0+2-:3];
      end
      2'h3: begin
        out = $signed(a) >>> b[0+2-:3];
      end
      default: begin
        out = a;
      end
    endcase
  end
endmodule