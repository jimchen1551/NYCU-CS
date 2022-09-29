module Shifter( result, leftRight, sftSrc );
//same as Lab2 done

//I/O ports 
output	[16-1:0] result;

input			leftRight;
input	[16-1:0] sftSrc ;

//Internal Signals
wire	[16-1:0] result;
  
//Main function
/*your code here*/

mux m0(result[0], leftRight, 1'b0, sftSrc[1]);  // fill with 0 if shift left
mux m1(result[1], leftRight, sftSrc[0], sftSrc[2]);
mux m2(result[2], leftRight, sftSrc[1], sftSrc[3]);
mux m3(result[3], leftRight, sftSrc[2], sftSrc[4]);
mux m4(result[4], leftRight, sftSrc[3], sftSrc[5]);
mux m5(result[5], leftRight, sftSrc[4], sftSrc[6]);
mux m6(result[6], leftRight, sftSrc[5], sftSrc[7]);
mux m7(result[7], leftRight, sftSrc[6], sftSrc[8]);
mux m8(result[8], leftRight, sftSrc[7], sftSrc[9]);
mux m9(result[9], leftRight, sftSrc[8], sftSrc[10]);
mux m10(result[10], leftRight, sftSrc[9], sftSrc[11]);
mux m11(result[11], leftRight, sftSrc[10], sftSrc[12]);
mux m12(result[12], leftRight, sftSrc[11], sftSrc[13]);
mux m13(result[13], leftRight, sftSrc[12], sftSrc[14]);
mux m14(result[14], leftRight, sftSrc[13], sftSrc[15]);
mux m15(result[15], leftRight, sftSrc[14], 1'b0);  // fill with 0 if shift right

endmodule

module mux(result, leftRight, left, right);

  output wire result;
  input wire leftRight;
  input wire left, right;
  wire w, l, r;

  not n1(w, leftRight);       // simple decoder for left or right
  and a1(l, left, w); // left
  and a2(r, right, leftRight);        // right
  or  o1(result, l, r);       // result

endmodule