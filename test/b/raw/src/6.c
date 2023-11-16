#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(void)
{
  int v0 = f_rand_0();
  int v5 = 298;
  int v4 = f_rand_4();
  int v2 = f_rand_2();
  int v1 = f_rand_1();
  int v3 = f_rand_3();
  printf("BB: %d", 0);
  int v6 = (v3 % v5) + v5;
  if(v6 >= v4)
  {
    printf("BB: %d", 1);
    v3 = ((v6 ^ v3) + v2) + v3;
    while(v1 > 685)
    {
      printf("BB: %d", 2);
      v1 = (v5 % v6) - v2;
      v2 = (v5 / v2) % v2;
      v3 = (v0 % v1) + v2;
      v6 = (v0 + v4) * v4;
      int v7 = (v3 | v1) & v4;
    } 
    printf("BB: %d", 3);
    int v7 = ((((v3 + v6) % v0) * v5) % v1) + v1;
    v4 = (~ (v6)) + v1;
    while(v1 == v5)
    {
      printf("BB: %d", 4);
      v4 = (v7 * v3) / v3;
      v2 = ~ (v6);
      v1 = (v7 - v0) - v2;
      int v8 = (~ v4) - v6;
      v3 = (~ (v8)) / v0;
    } 
  } 
  else
  {
    printf("BB: %d", 5);
    while(v3 < v2)
    {
      printf("BB: %d", 6);
      int v7 = (v0 - v1) + v2;
      int v8 = ((((~ v4) + v5) - v2) ^ v5) & v6;
      int v9 = (v7 % v0) / v5;
      int v10 = ~ (v2);
      int v11 = ~ (v3);
    } 
    printf("BB: %d", 7);
    v4 = (v6 * v3) & v0;
    int v7 = ((v1 ^ v6) * v0) ^ v3;
    int v8 = (v3 / v7) | v3;
    while(v1 > 406)
    {
      printf("BB: %d", 8);
      int v9 = (v1 ^ v6) * v8;
      v4 = (~ v9) | v7;
      int v10 = ((v9 - v4) & v9) * v9;
      v1 = ((v7 - v4) + v4) * v7;
      v0 = (v6 | v6) / v2;
    } 
  } 
  printf("BB: %d", 9);
  v6 = (v6 & v6) + v5;
  int v7 = ((v6 / v6) | v6) + v4;
  v4 = ((((v4 - v1) ^ v4) / v7) + v6) | v6;

  printf("BB: %d", 10);
  int ret = v5 ^ v4;
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


