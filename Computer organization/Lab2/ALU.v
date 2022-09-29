`include "Full_adder.v"
`include "ALU_1bit.v"
`include "ALU_MSB.v"
`include "ALU_LSB.v"
module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
  
  output wire[15:0] result;
  output wire zero;
  output wire overflow;

  input wire[15:0] aluSrc1;
  input wire[15:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;

  wire[15:0] carry; // carry chain
  wire set, w1, w2, w3, w4, w5;

  ALU_LSB  alu0(carry[0], aluSrc1[0], aluSrc2[0], invertA, invertB, 1'b0); // providing carry[0] for the following operation
  ALU_1bit alu1(result[1], carry[1], aluSrc1[1], aluSrc2[1], invertA, invertB, operation, carry[0], 1'b0);
  ALU_1bit alu2(result[2], carry[2], aluSrc1[2], aluSrc2[2], invertA, invertB, operation, carry[1], 1'b0);
  ALU_1bit alu3(result[3], carry[3], aluSrc1[3], aluSrc2[3], invertA, invertB, operation, carry[2], 1'b0);
  ALU_1bit alu4(result[4], carry[4], aluSrc1[4], aluSrc2[4], invertA, invertB, operation, carry[3], 1'b0);
  ALU_1bit alu5(result[5], carry[5], aluSrc1[5], aluSrc2[5], invertA, invertB, operation, carry[4], 1'b0);
  ALU_1bit alu6(result[6], carry[6], aluSrc1[6], aluSrc2[6], invertA, invertB, operation, carry[5], 1'b0);
  ALU_1bit alu7(result[7], carry[7], aluSrc1[7], aluSrc2[7], invertA, invertB, operation, carry[6], 1'b0);
  ALU_1bit alu8(result[8], carry[8], aluSrc1[8], aluSrc2[8], invertA, invertB, operation, carry[7], 1'b0);
  ALU_1bit alu9(result[9], carry[9], aluSrc1[9], aluSrc2[9], invertA, invertB, operation, carry[8], 1'b0);
  ALU_1bit alu10(result[10], carry[10], aluSrc1[10], aluSrc2[10], invertA, invertB, operation, carry[9], 1'b0);
  ALU_1bit alu11(result[11], carry[11], aluSrc1[11], aluSrc2[11], invertA, invertB, operation, carry[10], 1'b0);
  ALU_1bit alu12(result[12], carry[12], aluSrc1[12], aluSrc2[12], invertA, invertB, operation, carry[11], 1'b0);
  ALU_1bit alu13(result[13], carry[13], aluSrc1[13], aluSrc2[13], invertA, invertB, operation, carry[12], 1'b0);
  ALU_1bit alu14(result[14], carry[14], aluSrc1[14], aluSrc2[14], invertA, invertB, operation, carry[13], 1'b0);
  ALU_MSB alu15(result[15], set, overflow, aluSrc1[15], aluSrc2[15], invertA, invertB, operation, carry[14], 1'b0);  // providing overflow and set for calculating result[0]
  ALU_1bit alu16(result[0], carry[15], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, 1'b0, set);  // calculating result[0]
  
  or  o1(w1, result[0], result[1], result[2], result[3]);  // considering max fan-in = 4, here implements hierarchical design to prevent high delay
  or  o2(w2, result[4], result[5], result[6], result[7]);
  or  o3(w3, result[8], result[9], result[10], result[11]);
  or  o4(w4, result[12], result[13], result[14], result[15]);
  or  o5(w5, w1, w2, w3, w4);
  not n1(zero, w5);  // zero
  
endmodule