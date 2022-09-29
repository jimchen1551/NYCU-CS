#include <stdio.h>
#include <stdlib.h>
int comb(int i, int j){
    if (i==0 || j==0 || i==j) return 1;
    else{
        int m=1, n=1;
        for (int k=0; k<j; k++){
            m = m*(i-k);
            n = n*(k+1);
        }
        return m/n;
    }
}
int main(){
    int n;
    scanf("%d", &n);
    for(int i=0; i<n; i++){
        for(int j=n-i; j>1; j--){
            printf("   ");
        }
        for(int j=0; j<i+1; j++){
            printf("%6d", comb(i, j));
        }
        printf("\n");
    }
    return 0;
}