#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main(){
    int n, m, row, column;
    printf("Input the size of the diamond :");
    scanf("%d", &n);
    m = 2*n-1;
    for (row=0; row<m; row++){
        for (column=0; column<m; column++){
            if (abs(row-n+1)+abs(column-n+1)<=n-1) printf("*");
            else printf(" ");
        }
        printf("\n");
    }
    return 0;
}