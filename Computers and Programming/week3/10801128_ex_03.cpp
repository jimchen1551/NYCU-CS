#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(){
    time_t t;
    srand(time(&t));
    int d = rand()%64;
    int b[6];
    int i = 0;
    int temp = d;
    while(temp){
        b[i] = temp%2;
        temp = (temp-b[i])/2;
        i++;
    }
    printf("Decimal number = %d\n", d);
    printf("Binary number = ");
    for (i; i>0; i--){
        printf("%d", b[i-1]);
    }
    printf("\n");
    return 0;
}