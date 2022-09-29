#include <stdio.h>
#include <stdlib.h>
int main()
{
    int a, b;
    int add, sub, mul, rem;
    double div;
    scanf("%d %d", &a, &b);
    add = a + b;
    sub = a - b;
    mul = a * b; 
    div = (1.0*a) / (1.0*b);
    rem = a % b;
    printf("%d\n%d\n%d\n%.2f\n%d", add, sub, mul, div, rem);
    system("pause");
    return 0;
}