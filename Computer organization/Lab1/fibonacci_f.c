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
   }

   int a = 0, b = 1, c = 1, i;
   for(i = 2; i <= k; i++)
   {
      c = a + b;
      a = b;
      b = c;
   }
   return c;
} 
