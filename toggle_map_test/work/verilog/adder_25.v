/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_25 (
    input [24:0] a,
    input [24:0] b,
    input [5:0] alufn,
    output reg z,
    output reg v,
    output reg n,
    output reg overflow,
    output reg [24:0] out
  );
  
  
  
  reg [24:0] xA;
  
  reg [24:0] xB;
  
  reg [24:0] s;
  
  reg [24:0] compare_sum;
  
  always @* begin
    compare_sum = a - b;
    overflow = 1'h0;
    xA = a;
    xB = b ^ {4'h8{alufn[0+0-:1]}};
    
    case (alufn[0+1-:2])
      2'h0: begin
        s = a + b;
        overflow = (xA[7+0-:1] & xB[7+0-:1] & ~s[7+0-:1]) | (~xA[7+0-:1] & ~xB[7+0-:1] & s[7+0-:1]);
      end
      2'h1: begin
        s = a - b;
        overflow = (xA[7+0-:1] & xB[7+0-:1] & ~s[7+0-:1]) | (~xA[7+0-:1] & ~xB[7+0-:1] & s[7+0-:1]);
      end
      2'h2: begin
        s = a * b;
      end
      2'h3: begin
        s = a - (a / b * b);
      end
      default: begin
        s = a + b;
      end
    endcase
    z = (~|compare_sum);
    n = compare_sum[7+0-:1];
    v = (xA[7+0-:1] & xB[7+0-:1] & ~compare_sum[7+0-:1]) | (~xA[7+0-:1] & ~xB[7+0-:1] & compare_sum[7+0-:1]);
    out = s;
  end
endmodule
