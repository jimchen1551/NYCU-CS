#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(){
    int a, b;
    int C = 0;
    int D = 0;
    char A[20];
    char B[20];
    char E[20];
    gets_s(A);
    gets_s(B);

    for (int i=19; i>-1; i--){
        a = (int)A[i] - 48;
        b = (int)B[i] - 48;
        D = C + a + b;
        C = D / 10;
        E[i] = D - 10 * C;
    }

    if (C) printf("%d", C);
    for (int i=0; i<20; i++) printf("%d", E[i]);
    printf("\n");

    system("pause");
    return 0;
}