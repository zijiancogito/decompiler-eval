#include <stdio.h>

int func0(int p1, int p2){
	int v1, v2;
	scanf("%d", &v1);
	v2 = rand();
	int v3 = p1 + p2 + v1 + v2;
	printf("%d", v3);
	return v1 * v2 * p1 * p2;
}

int main(){
	int p1, p2;
	scanf("%d %d", &p1, &p2);
	printf("%d", func0(p1, p2));

	return 0;
}




