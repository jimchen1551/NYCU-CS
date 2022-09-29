module Shifter_Barrel( result, leftRight, shamt, sftSrc );
    
  output wire[15:0] result;

  input wire leftRight;
  input wire[3:0] shamt;
  input wire[15:0] sftSrc;

  wire[31:0] temp;
  wire[31:0] temp1;
  wire Right;

  wire[3:0] ctsht;  // counter shift amount
  twosCmpl c(ctsht, shamt);
  not n(Right, leftRight);
  and a0(temp[0], Right, sftSrc[0]);
  and a1(temp[1], Right, sftSrc[1]);
  and a2(temp[2], Right, sftSrc[2]);
  and a3(temp[3], Right, sftSrc[3]);
  and a4(temp[4], Right, sftSrc[4]);
  and a5(temp[5], Right, sftSrc[5]);
  and a6(temp[6], Right, sftSrc[6]);
  and a7(temp[7], Right, sftSrc[7]);
  and a8(temp[8], Right, sftSrc[8]);
  and a9(temp[9], Right, sftSrc[9]);
  and a10(temp[10], Right, sftSrc[10]);
  and a11(temp[11], Right, sftSrc[11]);
  and a12(temp[12], Right, sftSrc[12]);
  and a13(temp[13], Right, sftSrc[13]);
  and a14(temp[14], Right, sftSrc[14]);
  and a15(temp[15], Right, sftSrc[15]);
  and a16(temp[16], leftRight, sftSrc[0]);
  and a17(temp[17], leftRight, sftSrc[1]);
  and a18(temp[18], leftRight, sftSrc[2]);
  and a19(temp[19], leftRight, sftSrc[3]);
  and a20(temp[20], leftRight, sftSrc[4]);
  and a21(temp[21], leftRight, sftSrc[5]);
  and a22(temp[22], leftRight, sftSrc[6]);
  and a23(temp[23], leftRight, sftSrc[7]);
  and a24(temp[24], leftRight, sftSrc[8]);
  and a25(temp[25], leftRight, sftSrc[9]);
  and a26(temp[26], leftRight, sftSrc[10]);
  and a27(temp[27], leftRight, sftSrc[11]);
  and a28(temp[28], leftRight, sftSrc[12]);
  and a29(temp[29], leftRight, sftSrc[13]);
  and a30(temp[30], leftRight, sftSrc[14]);
  and a31(temp[31], leftRight, sftSrc[15]);

  mux m0(temp1[0], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[0], temp[4], temp[8], temp[12]);
  mux m1(temp1[1], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[1], temp[5], temp[9], temp[13]);
  mux m2(temp1[2], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[2], temp[6], temp[10], temp[14]);
  mux m3(temp1[3], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[3], temp[7], temp[11], temp[15]);
  mux m4(temp1[4], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[4], temp[8], temp[12], temp[16]);
  mux m5(temp1[5], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[5], temp[9], temp[13], temp[17]);
  mux m6(temp1[6], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[6], temp[10], temp[14], temp[18]);
  mux m7(temp1[7], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[7], temp[11], temp[15], temp[19]);
  mux m8(temp1[8], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[8], temp[12], temp[16], temp[20]);
  mux m9(temp1[9], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[9], temp[13], temp[17], temp[21]);
  mux m10(temp1[10], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[10], temp[14], temp[18], temp[22]);
  mux m11(temp1[11], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[11], temp[15], temp[19], temp[23]);
  mux m12(temp1[12], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[12], temp[16], temp[20], temp[24]);
  mux m13(temp1[13], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[13], temp[17], temp[21], temp[25]);
  mux m14(temp1[14], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[14], temp[18], temp[22], temp[26]);
  mux m15(temp1[15], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[15], temp[19], temp[23], temp[27]);
  mux m00(temp1[16], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[16], temp[20], temp[24], temp[28]);
  mux m01(temp1[17], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[17], temp[21], temp[25], temp[29]);
  mux m02(temp1[18], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[18], temp[22], temp[26], temp[30]);
  mux m03(temp1[19], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[19], temp[23], temp[27], temp[31]);
  mux m04(temp1[20], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[20], temp[24], temp[28], temp[0]);
  mux m05(temp1[21], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[21], temp[25], temp[29], temp[1]);
  mux m06(temp1[22], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[22], temp[26], temp[30], temp[2]);
  mux m07(temp1[23], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[23], temp[27], temp[31], temp[3]);
  mux m08(temp1[24], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[24], temp[28], temp[0], temp[4]);
  mux m09(temp1[25], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[25], temp[29], temp[1], temp[5]);
  mux m010(temp1[26], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[26], temp[30], temp[2], temp[6]);
  mux m011(temp1[27], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[27], temp[31], temp[3], temp[7]);
  mux m012(temp1[28], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[28], temp[0], temp[4], temp[8]);
  mux m013(temp1[29], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[29], temp[1], temp[5], temp[9]);
  mux m014(temp1[30], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[30], temp[2], temp[6], temp[10]);
  mux m015(temp1[31], leftRight, shamt[3], shamt[2], ctsht[3], ctsht[2], temp[31], temp[3], temp[7], temp[11]);

  mux m16(result[0], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[0], temp1[1], temp1[2], temp1[3]);
  mux m17(result[1], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[1], temp1[2], temp1[3], temp1[4]);
  mux m18(result[2], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[2], temp1[3], temp1[4], temp1[5]);
  mux m19(result[3], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[3], temp1[4], temp1[5], temp1[6]);
  mux m20(result[4], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[4], temp1[5], temp1[6], temp1[7]);
  mux m21(result[5], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[5], temp1[6], temp1[7], temp1[8]);
  mux m22(result[6], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[6], temp1[7], temp1[8], temp1[9]);
  mux m23(result[7], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[7], temp1[8], temp1[9], temp1[10]);
  mux m24(result[8], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[8], temp1[9], temp1[10], temp1[11]);
  mux m25(result[9], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[9], temp1[10], temp1[11], temp1[12]);
  mux m26(result[10], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[10], temp1[11], temp1[12], temp1[13]);
  mux m27(result[11], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[11], temp1[12], temp1[13], temp1[14]);
  mux m28(result[12], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[12], temp1[13], temp1[14], temp1[15]);
  mux m29(result[13], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[13], temp1[14], temp1[15], temp1[16]);
  mux m30(result[14], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[14], temp1[15], temp1[16], temp1[17]);
  mux m31(result[15], leftRight, shamt[1], shamt[0], ctsht[1], ctsht[0], temp1[15], temp1[16], temp1[17], temp1[18]);

endmodule

module twosCmpl(result, shamt);
  output wire[3:0] result;
  input wire[3:0] shamt;
  wire w1, w2;
  and a1(result[0], shamt[0], 1'b1);
  xor x1(result[1], shamt[0], shamt[1]);
  or  o1(w1, shamt[0], shamt[1]);
  xor x2(result[2], shamt[2], w1);
  or  o2(w2, shamt[0], shamt[1], shamt[2]);
  xor x3(result[3], shamt[3], w2);
endmodule

module mux(result, Left, shamt1, shamt0, ctsht1, ctsht0, b0, b1, b2, b3);
  output wire result;
  input wire Left;
  input wire shamt1, shamt0, ctsht1, ctsht0;
  input wire b0, b1, b2, b3;
  wire Right;
  not n0(Right, Left);
  wire s0, s1, s2, s3, r0, r1, l0, l1;
  wire S0, S1, S2, S3;
  and a0(r0, Right, shamt0);
  and a1(l0, Left, ctsht0);
  and a2(r1, Right, shamt1);
  and a3(l1, Left, ctsht1);
  or  o0(s0, r0, l0);
  or  o1(s1, r1, l1);
  not n1(s2, s0);
  not n2(s3, s1);
  and a4(S0, b0, s2, s3);
  and a5(S1, b1, s0, s3);
  and a6(S2, b2, s2, s1);
  and a7(S3, b3, s0, s1);
  or (result, S0, S1, S2, S3);
endmodule
/*iverilog -o t_Shifter_Barrel.vvp t_Shifter_Barrel.v Shifter_Barrel.v*/