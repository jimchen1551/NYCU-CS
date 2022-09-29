
module ALU_LSB(carryOut, a, b, invertA, invertB, carryIn);
  
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire carryIn;
  // result cannot be calculated now
  wire w1, w2;
  wire S;

  xor x1(w1, a, invertA);                       // simple MUX for a and invertA
  xor x2(w2, b, invertB);

  Full_adder p1(S, carryOut, carryIn, w1, w2);  // here just for providing carry[0] to support other ALU

endmodule