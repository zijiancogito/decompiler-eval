#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(void)
{
  int v6 = 302;
  int v4 = f_rand_4();
  int v3 = f_rand_3();
  int v5 = 719;
  int v2 = f_rand_2();
  int v1 = f_rand_1();
  int v0 = f_rand_0();
  printf("BB: %d", 0);
  int v7 = (((v5 & v6) & v1) * v0) | v3;
  int v8 = (((~ v2) % v6) + v5) & v4;
  v3 = ((v0 & v3) | v3) & v8;
  if(v1 == 543)
  {
    printf("BB: %d", 1);
    v7 = ((v3 | v4) | v5) & v8;
    int v9 = (~ (v5)) + v2;
    v4 = ~ (v0);
    while(v8 == 925)
    {
      printf("BB: %d", 2);
      v6 = ((v4 | v4) * v6) - v1;
      int v10 = ~ (v1);
      v1 = (((v8 - v7) % v1) & v9) & v1;
      v7 = ((((v7 ^ v3) ^ v6) / v3) | v10) / v0;
      v2 = ((v5 & v4) * v0) ^ v2;
    } 
    printf("BB: %d", 3);
    while(v0 <= 609)
    {
      printf("BB: %d", 4);
      int v10 = ~ (v6);
      v7 = (v5 | v9) * v7;
      int v11 = ~ (v2);
      int v12 = (v9 * v2) ^ v2;
      v11 = ((((v10 | v3) & v8) | v6) * v3) * v3;
    } 
  } 
  printf("BB: %d", 5);
  while(v4 != 627)
  {
    printf("BB: %d", 6);
    while(v4 <= 351)
    {
      printf("BB: %d", 7);
      v3 = ~ (v4);
      v0 = (v6 % v8) & v6;
      int v9 = (v6 & v5) / v4;
      int v10 = (v2 * v6) - v9;
      v10 = ((v10 + v7) + v5) | v3;
    } 
    printf("BB: %d", 8);
    int v9 = (((v6 + v3) - v3) ^ v5) % v5;
    if(v6 > v5)
    {
      printf("BB: %d", 9);
      v3 = (v4 / v8) & v2;
      v1 = (~ (v8)) % v6;
      int v10 = (v7 * v8) * v0;
      int v11 = (((v6 - v2) - v7) / v9) - v3;
      int v12 = (~ v11) + v10;
    } 
    printf("BB: %d", 10);
    int v10 = (v7 * v4) / v4;
    v7 = ((v8 * v1) ^ v8) % v8;
  } 

  printf("BB: %d", 11);
  int ret = (((v2 - v5) ^ v1) & v0) % v3;
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


