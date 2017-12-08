/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boole_25 (
    input [24:0] a,
    input [24:0] b,
    input [5:0] alufn,
    output reg [24:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[0+3-:4])
      4'h8: begin
        out = a & b;
      end
      4'he: begin
        out = a | b;
      end
      4'h6: begin
        out = a ^ b;
      end
      4'ha: begin
        out = a;
      end
      4'h7: begin
        out = ~(a & b);
      end
      4'h1: begin
        out = ~(a | b);
      end
      4'h9: begin
        out = ~(a ^ b);
      end
      4'h5: begin
        out = ~a;
      end
      default: begin
        out = 1'h0;
      end
    endcase
  end
endmodule
