
module ALU_1bit( result, carryOut, a, b, invertA, invertB, aluOp, carryIn, less );
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] aluOp;
  input wire less;
  input wire carryIn;
  
  wire w1, w2, w3, w4, w5, w6, w7, w8;
  wire A, O, S;
  
  xor x1(w1, a, invertA);                       // simple MUX for a and invertA
  xor x2(w2, b, invertB);

  not n1(w3, aluOp[0]);                         // decoder for operation MUX starts here
  not n2(w4, aluOp[1]);

  and a1(A, w1, w2);                            // and/nor
  or  o1(O, w1, w2);                            // or
  Full_adder p1(S, carryOut, carryIn, w1, w2);  // add/sub

  and a2(w5, w3, w4, A);                        // and/nor
  and a3(w6, aluOp[0], w4, O);                  // or
  and a4(w7, w3, aluOp[1], S);                  // add/sub
  and a5(w8, aluOp[0], aluOp[1], less);         // slt

  or  o2(result, w5, w6, w7, w8);               // result
  
endmodule