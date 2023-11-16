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
  int v7 = 493;
  int v0 = f_rand_0();
  int v6 = 256;
  int v2 = f_rand_2();
  int v1 = f_rand_1();
  int v3 = f_rand_3();
  int v5 = 866;
  printf("BB: %d", 0);
  int v8 = ((~ v6) * v5) % v1;
  while(v7 >= v8)
  {
    printf("BB: %d", 1);
    while(v6 < v4)
    {
      printf("BB: %d", 2);
      v0 = ((v3 / v8) - v8) % v3;
      v8 = (v7 * v2) & v3;
      int v9 = ((v3 - v2) * v6) + v0;
      v8 = ((v1 - v6) & v0) - v1;
      int v10 = (((v7 + v3) + v8) & v9) | v5;
    } 
    printf("BB: %d", 3);
    int v9 = (((v0 / v5) / v8) | v8) / v0;
    int v10 = (v6 / v4) + v5;
    while(v7 != 451)
    {
      printf("BB: %d", 4);
      v8 = (v3 % v10) / v2;
      v7 = ~ (v0);
      int v11 = (((v7 * v0) % v5) % v4) - v1;
      int v12 = ((((v0 / v7) / v7) / v2) * v6) * v10;
      int v13 = (v6 & v9) & v1;
    } 
    printf("BB: %d", 5);
    v0 = (v0 % v7) + v6;
  } 
  printf("BB: %d", 6);
  if(v4 <= 648)
  {
    printf("BB: %d", 7);
    v3 = ((v5 / v6) * v3) / v7;
    while(v7 <= 657)
    {
      printf("BB: %d", 8);
      int v9 = (v2 | v5) / v8;
      v9 = (v0 | v6) ^ v5;
      v9 = (~ v6) / v0;
      int v10 = (v3 * v9) & v2;
      v8 = (v8 & v0) - v3;
    } 
    printf("BB: %d", 9);
    while(v6 >= v4)
    {
      printf("BB: %d", 10);
      int v9 = (v7 / v0) ^ v3;
      int v10 = ((v6 * v7) ^ v9) + v6;
      v4 = (v3 & v5) | v1;
      int v11 = (v0 - v9) & v1;
      int v12 = (((v2 | v10) ^ v1) / v10) ^ v9;
    } 
    printf("BB: %d", 11);
    int v9 = ((v8 - v1) / v3) & v0;
    int v10 = (v2 - v9) ^ v4;
  } 
  printf("BB: %d", 12);
  int v9 = (v4 ^ v7) + v6;
  int v10 = (v7 - v7) & v3;

  printf("BB: %d", 13);
  int ret = v2 ^ v6;
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


