#include <stdlib.h>
#include <stdio.h>

int f_rand_0(void)
{
  int v0 = rand();
  printf("%d", 0);
  return v0;
}


int f_rand_1(void)
{
  int v0 = rand();
  printf("%d", 1);
  return v0;
}


int f_rand_2(void)
{
  int v0 = rand();
  printf("%d", 2);
  return v0;
}


int func0(int p0, int p1, int p2)
{
  int v1 = f_rand_1();
  int v2 = 566;
  int v4 = 68;
  int v0 = f_rand_0();
  int v3 = 179;
  printf("%d", 0);
  int v8 = v1;
  while(p2 < 734)
  {
    printf("%d", 1);
    while(v2 < v1)
    {
      printf("%d", 2);
      if(v3 == v2)
      {
        printf("%d", 3);
        int v9 = v1;
      } 
    } 
    printf("%d", 5);
    while(v2 > v4)
    {
      printf("%d", 6);
      if(v3 <= p1)
      {
        printf("%d", 7);
        int v9 = p2;
      } 
      else
      {
        printf("%d", 8);
        p0 = ((v1 - p2) * v2) - v8;
        int v9 = ((v2 * v3) % p0) + p1;
        p1 = ((v9 % p2) * p1) - v2;
      } 
      printf("%d", 9);
      p2 = v4 - p0;
      v1 = ~ p0;
      if(v0 == p0)
      {
        printf("%d", 10);
        v3 = v3;
        int v9 = ((v4 ^ v1) | p1) & p1;
        int v10 = p2;
        int v11 = v4;
      } 
    } 
  } 
  printf("%d", 13);
  if(p0 > v1)
  {
    printf("%d", 14);
    while(v2 < 527)
    {
      printf("%d", 15);
      int v9 = (p1 ^ p1) * v3;
      if(v0 <= p1)
      {
        printf("%d", 16);
        int v10 = v1 | v3;
        int v11 = ((v3 % v4) | p2) - v4;
      } 
      printf("%d", 17);
      v1 = p2 ^ p0;
    } 
  } 

  printf("%d", 19);
  int ret = ((p0 ^ v2) - p2) / v2;
  return ret;
}


int main(void)
{
  int v0 = 779;
  int v1 = f_rand_1();
  int v2 = f_rand_2();
  int v3 = func0(v2, v0, v0);
  printf("%d", v3);
  return 0;
}


