module Adder( src1_i, src2_i, sum_o);
//Ripple carry adder done

//I/O ports
input	[15:0] src1_i;
input	[15:0] src2_i;
output	[15:0] sum_o;

//Internal Signals
wire	[15:0] sum_o;
wire    [16:0] carry;
    
//Main function
/*your code here*/
assign carry[0] = 1'b0;
Full_adder  a1(sum_o[ 0], carry[ 1], carry[ 0], src1_i[ 0], src2_i[ 0]);
Full_adder  a2(sum_o[ 1], carry[ 2], carry[ 1], src1_i[ 1], src2_i[ 1]);
Full_adder  a3(sum_o[ 2], carry[ 3], carry[ 2], src1_i[ 2], src2_i[ 2]);
Full_adder  a4(sum_o[ 3], carry[ 4], carry[ 3], src1_i[ 3], src2_i[ 3]);
Full_adder  a5(sum_o[ 4], carry[ 5], carry[ 4], src1_i[ 4], src2_i[ 4]);
Full_adder  a6(sum_o[ 5], carry[ 6], carry[ 5], src1_i[ 5], src2_i[ 5]);
Full_adder  a7(sum_o[ 6], carry[ 7], carry[ 6], src1_i[ 6], src2_i[ 6]);
Full_adder  a8(sum_o[ 7], carry[ 8], carry[ 7], src1_i[ 7], src2_i[ 7]);
Full_adder  a9(sum_o[ 8], carry[ 9], carry[ 8], src1_i[ 8], src2_i[ 8]);
Full_adder a10(sum_o[ 9], carry[10], carry[ 9], src1_i[ 9], src2_i[ 9]);
Full_adder a11(sum_o[10], carry[11], carry[10], src1_i[10], src2_i[10]);
Full_adder a12(sum_o[11], carry[12], carry[11], src1_i[11], src2_i[11]);
Full_adder a13(sum_o[12], carry[13], carry[12], src1_i[12], src2_i[12]);
Full_adder a14(sum_o[13], carry[14], carry[13], src1_i[13], src2_i[13]);
Full_adder a15(sum_o[14], carry[15], carry[14], src1_i[14], src2_i[14]);
Full_adder a16(sum_o[15], carry[16], carry[15], src1_i[15], src2_i[15]);

endmodule

module Full_adder(sum,cout,cin,inp1,inp2);

    input cin, inp1, inp2;
    output sum,cout;

    wire w1, w2, w3;

    xor x1(w1, inp1, inp2);  // just an ordinary full adder
    and a1(w2, w1, cin);
    and a2(w3, inp1, inp2);
    xor x2(sum, w1, cin);
    or  o1(cout, w2, w3);

endmodule