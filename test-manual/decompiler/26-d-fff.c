undefined4 fff(int param_1,int param_2)

{
  long lVar1;
  int local_18;
  undefined4 local_c;
  
  for (local_18 = param_2; local_18 <= param_1; local_18 = local_18 + 1) {
    if (x % *(int *)(a + (long)local_18 * 4) == 0) {
      lVar1 = (long)x;
      x = x / *(int *)(a + (long)local_18 * 4);
      if (x == 1) {
        l = l + 1;
      }
      if (1 < x) {
        fff(param_1,local_18,lVar1 % (long)*(int *)(a + (long)local_18 * 4) & 0xffffffff);
      }
      x = x * *(int *)(a + (long)local_18 * 4);
    }
  }
  return local_c;
}