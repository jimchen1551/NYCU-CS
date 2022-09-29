
module ALU_MSB( result, set, overflow, a, b, invertA, invertB, aluOp, carryIn, less );
  
  output wire result;
  output wire set;
  output wire overflow;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] aluOp;
  input wire less;
  input wire carryIn;
  
  wire w1, w2, w3, w4, w5, w6, w7, w8;
  wire w9, w10, w11;
  wire A, O, carryOut;
  
  xor x1(w1, a, invertA);                         // simple MUX for a and invertA
  xor x2(w2, b, invertB);

  not n1(w3, aluOp[0]);                           // decoder for operation MUX starts here
  not n2(w4, aluOp[1]);

  and a1(A, w1, w2);                              // and/nor
  or  o1(O, w1, w2);                              // or
  Full_adder p1(set, carryOut, carryIn, w1, w2);  // add/sub, set

  and a2(w5, w3, w4, A);                          // and/nor
  and a3(w6, aluOp[0], w4, O);                    // or
  and a4(w7, w3, aluOp[1], set);                  // add/sub
  and a5(w8, aluOp[0], aluOp[1], less);           // slt

  or  o2(result, w5, w6, w7, w8);                 // result

  xor x3(w9, w1, w2);                             // overflow detection
  not n3(w10, w9);
  xor x4(w11, w2, set);
  and a6(overflow, w10, w11);
  // maybe I should read the book "Clean code"
endmodule