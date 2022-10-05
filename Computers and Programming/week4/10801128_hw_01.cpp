#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
int main(){
    int m, n, p;
    scanf("%d %d %d", &m, &n, &p);
    int A[10][10];
    int B[10][10];
    for (int i=0; i<m; i++){
        for (int j=0; j<n; j++){
            scanf("%d", &A[i][j]);
        }
    }
    for (int i=0; i<n; i++){
        for (int j=0; j<p; j++){
            scanf("%d", &B[i][j]);
        }
    }
    for (int i=0; i<m; i++){
        for (int j=0; j<p; j++){
            int temp=0;
            for (int k=0; k<n; k++){
                temp += A[i][k]*B[k][j];
            }
            printf("%d ", temp);
        }
        printf("\n");
    }
    system("pause");
    return 0;
}