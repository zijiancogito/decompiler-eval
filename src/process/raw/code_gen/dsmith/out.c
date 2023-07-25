#include <stdlib.h>
#include <stdio.h>

int f_rand_0() __attribute__((noinline));
int f_rand_1() __attribute__((noinline));
int f_rand_2() __attribute__((noinline));
int f_rand_3() __attribute__((noinline));
int f_rand_4() __attribute__((noinline));

int func0(int p0)
{
  int v9 = 699;
  int v0 = f_rand_0();
  int v3 = f_rand_3();
  int v5 = 393;
  int v2 = f_rand_2();
  int v8 = 356;
  int v6 = 47;
  int v7 = 317;
  int v1 = f_rand_1();
  int v4 = f_rand_4();
  printf("BB: %d", 0);
  while(v0 != v8)
  {
    printf("BB: %d", 1);
    v2 = (v0 | v0) / v9;
    v2 = (v8 | v3) & v6;
    v9 = (~ (v6)) % v8;
    v4 = v3 - v5;
    while(v8 >= 434)
    {
      printf("BB: %d", 2);
      if(v3 <= v2)
      {
        printf("BB: %d", 3);
        v5 = (v1 & v4) | p0;
        int v11 = (v0 % v6) + v1;
        int v12 = p0 | v3;
        v6 = v3 ^ v1;
        v4 = v5 & v4;
      } 
      printf("BB: %d", 4);
      if(v4 >= 798)
      {
        printf("BB: %d", 5);
        int v11 = ~ v3;
        v1 = v6 | v2;
        v3 = v3 + v1;
        p0 = ~ p0;
        v7 = ((v2 - v0) - v2) & v2;
      } 
      else
      {
        printf("BB: %d", 6);
        int v11 = v5 - v4;
        v3 = ((v4 & v6) | v7) + v5;
        int v12 = v8 + v7;
        v7 = v0 - v4;
        v1 = (~ (v3)) + v5;
      } 
      printf("BB: %d", 7);
      v8 = v5 - v2;
      v1 = v1 * v6;
      int v11 = (p0 / v5) ^ v3;
    } 
  } 
  printf("BB: %d", 8);
  while(v4 != v7)
  {
    printf("BB: %d", 9);
    v0 = v0 / v5;
    v7 = v8 & v7;
    v5 = p0 + v0;
    v3 = ((p0 ^ v2) & p0) ^ p0;
    int v11 = v5 - v2;
  } 
  printf("BB: %d", 10);
  v7 = v8 | v5;
  v2 = v8 / v9;
  p0 = p0 - v2;

  printf("BB: %d", 11);
  int ret = p0 | p0;
  return ret;
}


int main(void)
{
  int v0 = f_rand_0();
  int v1 = f_rand_1();
  int v2 = 513;
  int v3 = func0(v1);
  printf("%d", v3);
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


