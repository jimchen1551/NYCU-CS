#include <stdio.h>
#include <stdlib.h>
int isPrime(int n){
    if(n==1||n==2) return 0;
    for(int i=2; i<=n/2; i++){
        if(n%i==0) return 0;
    }
    return 1;
}
int main(){
    int n, i, j, k;
    scanf("%d", &n);
    k = 0;
    for(i=1; i<=n/2; i++){
        j = n-i;
        if(isPrime(i) && isPrime(j)) {
            k = 1;
            printf("%d can be written as %d+%d.\n", n, i, j);
        }
    }
    if(k==0) printf("The number can’t be express as sum of two prime numbers.\n");
    return 0;
}