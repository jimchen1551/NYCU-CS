#include <stdio.h>
#include <stdlib.h>
int main()
{
    printf("Which operation would you like to perform?\n");
    printf("\tA, addition\n\tB, subtraction\n\tC, multiplication\n\tD, division\n");
    char op;
    float a, b, result;
    scanf("%c", &op);
    printf("Please input the first number\n");
    scanf("%f", &a);
    printf("Please input the second number\n");
    scanf("%f", &b);
    if ((op=='A') || (op=='a')){
        result = a + b;
        op = '+';
    }
    else if ((op=='B') || (op=='b')){
        result = a - b;
        op = '-';
    }
    else if ((op=='C') || (op=='c')){
        result = a * b;
        op = '*';
    }
    else if ((op=='D') || (op=='d')){
        result = a / b;
        op = '/';
    }
    printf("%.6f%c%.6f=%.6f", a, op, b, result);
    system("pause");
    return 0;
}