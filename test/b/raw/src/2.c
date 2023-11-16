#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(void)
{
  int v1 = f_rand_1();
  int v5 = 792;
  int v3 = f_rand_3();
  int v4 = f_rand_4();
  int v6 = 438;
  int v0 = f_rand_0();
  int v2 = f_rand_2();
  int v7 = 966;
  printf("BB: %d", 0);
  v6 = (v2 + v3) ^ v4;
  int v8 = (v3 ^ v1) | v6;
  while(v7 >= v5)
  {
    printf("BB: %d", 1);
    v5 = (v1 + v3) & v3;
    v8 = (v1 & v6) * v6;
    int v9 = ((((v1 - v3) + v2) ^ v7) + v7) & v5;
    int v10 = ~ (v4);
    v0 = ((v9 % v1) * v1) | v1;
  } 
  printf("BB: %d", 2);
  v2 = (v4 % v1) & v5;
  v1 = (v0 ^ v1) ^ v1;

  printf("BB: %d", 3);
  int ret = v3 ^ v0;
  return ret;
}


int main(void)
{
  int v0 = func0();
  printf("%d", v0);
  return 0;
}


int f_rand_0(void)
{
  int v0 = rand();
  printf("f_rand_0: %d", 0);
  return v0;
}


int f_rand_1(void)
{
  int v0 = rand();
  printf("f_rand_1: %d", 1);
  return v0;
}


int f_rand_2(void)
{
  int v0 = rand();
  printf("f_rand_2: %d", 2);
  return v0;
}


int f_rand_3(void)
{
  int v0 = rand();
  printf("f_rand_3: %d", 3);
  return v0;
}


int f_rand_4(void)
{
  int v0 = rand();
  printf("f_rand_4: %d", 4);
  return v0;
}


