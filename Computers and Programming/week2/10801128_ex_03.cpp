#include <stdio.h>
#include <stdlib.h>
int main()
{
    float a, b, c, D;
    printf("ax^2+bx+c\n");
    printf("Please input the coefficients: a b c");
    scanf("%f %f %f", &a, &b, &c);
    D = b*b-4*a*c;
    printf("\'%fx^2+%fx+%f\' has ", a, b, c);
    if (D>0) printf("two distinct roots\n");
    if (D<0) printf("no real root\n");
    if (D==0) printf("double roots\n");
    system("pause");
    return 0;
}