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