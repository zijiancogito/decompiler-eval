#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(void)
{
  int v6 = 777;
  int v3 = f_rand_3();
  int v2 = f_rand_2();
  int v7 = 982;
  int v1 = f_rand_1();
  int v4 = f_rand_4();
  int v0 = f_rand_0();
  int v5 = 817;
  printf("BB: %d", 0);
  v6 = (v0 | v6) & v4;
  int v8 = (v6 - v7) ^ v3;
  while(v5 >= 104)
  {
    printf("BB: %d", 1);
    v7 = (v1 * v2) & v3;
    if(v1 != v0)
    {
      printf("BB: %d", 2);
      int v9 = (v0 / v3) / v3;
      int v10 = (v2 * v7) * v2;
      int v11 = ((v9 / v4) | v4) / v4;
      v6 = (v1 - v6) & v2;
      v6 = (v0 & v3) / v8;
    } 
    else
    {
      printf("BB: %d", 3);
      v8 = (~ v8) / v1;
      int v9 = ((v3 + v0) * v8) - v2;
      int v10 = ((((~ v7) & v5) / v5) & v5) - v2;
      int v11 = (~ v5) + v6;
      int v12 = (~ (v9)) / v6;
    } 
    printf("BB: %d", 4);
    while(v5 < v2)
    {
      printf("BB: %d", 5);
      v8 = ((~ v4) % v4) + v8;
      v3 = (v7 | v5) / v0;
      v0 = (~ v8) * v4;
      int v9 = (v6 | v2) * v4;
      v7 = (v2 + v8) * v0;
    } 
    printf("BB: %d", 6);
    while(v0 <= 222)
    {
      printf("BB: %d", 7);
      v7 = ~ (v7);
      v0 = ((((v5 ^ v8) - v2) * v0) | v0) | v1;
      v0 = (~ v4) & v8;
      int v9 = (((v1 + v0) * v5) & v3) / v8;
      v7 = (v0 & v0) * v6;
    } 
    printf("BB: %d", 8);
    v0 = ((v3 + v8) / v6) / v0;
  } 
  printf("BB: %d", 9);
  if(v0 == 79)
  {
    printf("BB: %d", 10);
    int v9 = (~ v0) - v5;
    v9 = (v7 / v6) % v0;
    v4 = ~ (v4);
    int v10 = (~ (v5)) & v1;
    v6 = (((v1 / v9) * v1) * v0) - v2;
  } 
  else
  {
    printf("BB: %d", 11);
    v3 = (v0 * v1) | v7;
    int v9 = (v4 * v1) & v7;
    int v10 = ((v5 | v2) % v7) % v5;
    v3 = (v7 | v9) ^ v5;
    v0 = (v0 - v8) - v10;
  } 
  printf("BB: %d", 12);
  int v9 = ~ (v2);

  printf("BB: %d", 13);
  int ret = ~ ((v0 + v2) ^ v4);
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


