#include <stdio.h>

int fibonacci(int k);
int main(void) 
{
	int n,result;
   printf("Please input i : ");
	scanf("%d",&n);
   printf("%dth Fibonacci numbers is %d.\n", n, fibonacci(n));
   
   return 0;
}
 
int fibonacci(int k) {
   if(k == 0){
   	return 0;
   }else if(k == 1){
   	return 1;
   }else{
   	return fibonacci(k - 1) + fibonacci(k - 2);
   }
} 
