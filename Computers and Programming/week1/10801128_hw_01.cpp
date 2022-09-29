#include <stdio.h>
#include <stdlib.h>
int main()
{
    float w, h;
    int a; 
    float TDEE;
    scanf("%f %f %d", &w, &h, &a);
    TDEE = 1.2 * (13.7*w+5.0*h-6.8*a+66);
    printf("%.2f", TDEE);
    return 0;
}