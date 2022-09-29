module ALU( aluSrc1, aluSrc2, ALU_operation_i, result, zero, overflow );
//same as Lab2 done

//I/O ports 
input	[15:0]  aluSrc1;
input	[15:0]  aluSrc2;
input	[4-1:0] ALU_operation_i;

output	[15:0]  result;
output		      zero;
output		      overflow;

//Internal Signals
wire		        zero;
wire            overflow;
wire    [16-1:0]result;
wire    [16-1:0]result_t;
reg     [16-1:0]result_p;

//Main function
/*your code here*/

wire[15:0] carry; // carry chain
wire set, w1, w2, w3, w4, w5;

ALU_LSB   alu0(            carry[ 0], aluSrc1[ 0], aluSrc2[ 0], ALU_operation_i[3], ALU_operation_i[2], 1'b0); // providing carry[0] for the following operation
ALU_1bit  alu1(result_t[ 1], carry[ 1], aluSrc1[ 1], aluSrc2[ 1], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[0], 1'b0);
ALU_1bit  alu2(result_t[ 2], carry[ 2], aluSrc1[ 2], aluSrc2[ 2], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[1], 1'b0);
ALU_1bit  alu3(result_t[ 3], carry[ 3], aluSrc1[ 3], aluSrc2[ 3], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[2], 1'b0);
ALU_1bit  alu4(result_t[ 4], carry[ 4], aluSrc1[ 4], aluSrc2[ 4], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[3], 1'b0);
ALU_1bit  alu5(result_t[ 5], carry[ 5], aluSrc1[ 5], aluSrc2[ 5], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[4], 1'b0);
ALU_1bit  alu6(result_t[ 6], carry[ 6], aluSrc1[ 6], aluSrc2[ 6], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[5], 1'b0);
ALU_1bit  alu7(result_t[ 7], carry[ 7], aluSrc1[ 7], aluSrc2[ 7], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[6], 1'b0);
ALU_1bit  alu8(result_t[ 8], carry[ 8], aluSrc1[ 8], aluSrc2[ 8], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[7], 1'b0);
ALU_1bit  alu9(result_t[ 9], carry[ 9], aluSrc1[ 9], aluSrc2[ 9], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[8], 1'b0);
ALU_1bit alu10(result_t[10], carry[10], aluSrc1[10], aluSrc2[10], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[9], 1'b0);
ALU_1bit alu11(result_t[11], carry[11], aluSrc1[11], aluSrc2[11], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[10], 1'b0);
ALU_1bit alu12(result_t[12], carry[12], aluSrc1[12], aluSrc2[12], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[11], 1'b0);
ALU_1bit alu13(result_t[13], carry[13], aluSrc1[13], aluSrc2[13], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[12], 1'b0);
ALU_1bit alu14(result_t[14], carry[14], aluSrc1[14], aluSrc2[14], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[13], 1'b0);
ALU_MSB alu15(result_t[15],set,overflow,aluSrc1[15], aluSrc2[15], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], carry[14], 1'b0);
xor x1(crt, set, overflow);
ALU_1bit alu16(result_t[ 0], carry[15], aluSrc1[ 0], aluSrc2[ 0], ALU_operation_i[3], ALU_operation_i[2], ALU_operation_i[1:0], 1'b0, set);

or  o1(w1, result_t[0], result_t[1], result_t[2], result_t[3]);  // considering max fan-in = 4, here implements hierarchical design to prevent high delay
or  o2(w2, result_t[4], result_t[5], result_t[6], result_t[7]);
or  o3(w3, result_t[8], result_t[9], result_t[10], result_t[11]);
or  o4(w4, result_t[12], result_t[13], result_t[14], result_t[15]);
or  o5(w5, w1, w2, w3, w4);
not n1(zero, w5);  // zero
always @(*)begin
    case(ALU_operation_i)
        4'b0110:  result_p = result_t + 16'b0000000000000001;
        default:  result_p = result_t;
    endcase
end
assign result = result_p;
endmodule

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
