#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(void)
{
  int v4 = f_rand_4();
  int v0 = f_rand_0();
  int v1 = f_rand_1();
  int v3 = f_rand_3();
  int v5 = 300;
  int v6 = 562;
  int v2 = f_rand_2();
  printf("BB: %d", 0);
  while(v0 <= v2)
  {
    printf("BB: %d", 1);
    while(v6 < 33)
    {
      printf("BB: %d", 2);
      v3 = (v1 / v6) | v5;
      v6 = (~ (v3)) - v0;
      int v7 = (~ (v5)) + v2;
      v5 = ~ (v6);
      int v8 = ~ (v3);
    } 
    printf("BB: %d", 3);
    v4 = ((((v0 / v6) | v3) % v0) - v0) & v4;
    while(v1 < v6)
    {
      printf("BB: %d", 4);
      int v7 = (~ v2) + v0;
      int v8 = (v1 + v5) - v1;
      v2 = ((v6 + v0) | v4) - v0;
      int v9 = (~ v0) + v6;
      v8 = (v7 * v3) + v9;
    } 
    printf("BB: %d", 5);
    v0 = ((v1 % v0) + v0) & v5;
    int v7 = (v2 ^ v6) / v1;
  } 
  printf("BB: %d", 6);
  if(v3 <= 961)
  {
    printf("BB: %d", 7);
    while(v3 > 544)
    {
      printf("BB: %d", 8);
      v2 = (v3 ^ v1) + v4;
      v4 = (v4 * v2) / v0;
      int v7 = (~ (v4)) | v0;
      int v8 = (~ v0) & v0;
      int v9 = ((((v5 & v6) + v1) | v8) & v2) & v4;
    } 
    printf("BB: %d", 9);
    while(v2 >= v1)
    {
      printf("BB: %d", 10);
      int v7 = ((~ v6) / v6) + v5;
      v0 = (v2 & v2) * v4;
      int v8 = (v4 - v1) / v6;
      v0 = (v0 & v3) - v4;
      int v9 = (~ (v1)) ^ v7;
    } 
    printf("BB: %d", 11);
    v5 = (~ v6) / v6;
    v0 = (v2 & v1) ^ v3;
    v3 = (v2 * v5) + v3;
  } 
  else
  {
    printf("BB: %d", 12);
    v6 = (((~ v2) - v5) - v3) / v1;
    v3 = (v5 ^ v5) - v0;
    v6 = ((((v4 + v5) * v2) / v5) * v3) ^ v6;
    v5 = ((v5 / v3) | v3) / v1;
    v4 = (v4 | v4) & v0;
  } 
  printf("BB: %d", 13);
  int v7 = (v6 % v4) % v2;
  v4 = (v7 | v7) + v3;
  v5 = (v4 | v5) + v2;

  printf("BB: %d", 14);
  int ret = ~ v3;
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


