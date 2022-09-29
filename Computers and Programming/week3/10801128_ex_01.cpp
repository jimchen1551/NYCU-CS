#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main(){
    int n, sum;
    printf("Input the number of terms : ");
    scanf("%d", &n);
    sum = 0;
    for (int i=0; i<n; i++){
        for (int j=0; j<=i; j++){
            printf("1");
            sum += pow(10, j);
        }
        if (i!=n-1) printf("  + ");
    }
    printf("\nThe Sum is : %d", sum);
    return 0;
}