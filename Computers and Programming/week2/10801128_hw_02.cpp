#include <stdio.h>
#include <stdlib.h>
int max(int a, int b, int c)
{
    if ((a>=b) && (a>=c)) return a;
    if ((b>=a) && (b>=c)) return b;
    if ((c>=a) && (c>=b)) return c;
}
int main()
{
    int a, b, c;
    scanf("%d %d %d", &a, &b, &c);
    if ((a+b>c) && (b+c>a) && (c+a>b))
    {
        printf("%d %d %d can form a triangle\n", a, b, c);
        int m = max(a, b, c);
        int n = (a==m) ? b : a;
        int p = (c==m) ? b : c;
        if (m*m==n*n+p*p) printf("%d %d %d can form a right triangle\n", a, b, c);
        else if ((m*m)>(n*n+p*p)) printf("%d %d %d can form an obtuse triangle\n", a, b, c);
        else printf("%d %d %d can form an acute triangle\n", a, b, c);
        if ((m==n) && (n==p)) printf("%d %d %d can form an equilateral triangle\n", a, b, c);
        if ((m==n) || (n==p)) printf("%d %d %d can form an isosceles triangle\n", a, b, c);
        else if ((m==n) && (n==p)) printf("%d %d %d can form a scalene triangle\n", a, b, c);
    }
    else
    {
        printf("%d %d %d cannot form a triangle\n", a, b, c);
    }
    return 0;
}