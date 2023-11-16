#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(void)
{
  int v3 = 78;
  int v0 = f_rand_0();
  int v1 = f_rand_1();
  int v2 = f_rand_2();
  printf("BB: %d", 0);
  int v4 = (v3 - v2) + v2;
  while(v2 == 547)
  {
    printf("BB: %d", 1);
    while(v4 >= v1)
    {
      printf("BB: %d", 2);
      v2 = (v0 & v3) | v3;
      v0 = ((v3 ^ v4) + v4) / v4;
      v4 = ~ (v1);
      v2 = ~ (v3);
      v0 = ((v1 | v0) & v3) ^ v4;
    } 
    printf("BB: %d", 3);
    v4 = (v1 / v4) / v2;
    int v5 = ~ (v2);
    int v6 = ((~ (v0)) | v0) | v1;
    if(v1 >= 287)
    {
      printf("BB: %d", 4);
      int v7 = (v0 ^ v0) - v1;
      v5 = ~ (v7);
      v3 = (v2 ^ v1) / v5;
      v0 = ~ (v5);
      v4 = ((v2 & v2) * v0) % v1;
    } 
  } 
  printf("BB: %d", 5);
  int v5 = ~ (v0);
  int v6 = (v4 - v3) - v4;
  if(v2 != v5)
  {
    printf("BB: %d", 6);
    v4 = ((((v1 ^ v3) % v0) * v6) | v5) % v0;
    v6 = ~ (v1);
    if(v5 <= v6)
    {
      printf("BB: %d", 7);
      v6 = (v2 % v2) / v3;
      v0 = (v2 + v3) - v5;
      int v7 = ((((v0 & v4) * v3) & v0) / v0) & v1;
      v5 = (v6 % v6) - v1;
      int v8 = ((~ (v0)) - v7) | v6;
    } 
    printf("BB: %d", 8);
    if(v4 > v2)
    {
      printf("BB: %d", 9);
      int v7 = (v2 % v5) & v2;
      int v8 = (((v5 * v4) ^ v1) % v5) ^ v1;
      int v9 = (~ v3) + v5;
      v2 = ((v4 * v5) - v5) + v8;
      int v10 = (v6 + v7) - v2;
    } 
    else
    {
      printf("BB: %d", 10);
      int v7 = ((((v3 / v5) * v6) / v5) + v2) % v0;
      int v8 = ((((v7 | v1) % v3) ^ v2) ^ v2) & v2;
      int v9 = (v7 % v7) / v3;
      v6 = (v2 % v6) & v5;
      int v10 = ((v8 & v2) + v5) / v0;
    } 
    printf("BB: %d", 11);
    int v7 = (((v6 + v4) / v4) - v4) % v1;
  } 

  printf("BB: %d", 12);
  int ret = v0 / v3;
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


