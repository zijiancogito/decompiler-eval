#include <stdio.h>

int *main()
{
  int b;
  int v4[12];

  v4[2] = 2;
  b = &v4[2];
  
  return b;
}
