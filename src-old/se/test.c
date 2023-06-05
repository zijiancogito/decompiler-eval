#include <stdio.h>
#include <stdlib.h>

int sum(int a, int b){
	int c = rand();
	return a + b + c;
}

int main(){
	int x, y;
	scanf("%d %d", &x, &y);
	int z = sum(x, y);
	if ( z == 10){
		printf("Success.");
	} else {
		printf("Fail.");
	}
	return 0;
}
