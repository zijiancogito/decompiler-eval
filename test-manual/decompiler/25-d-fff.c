
undefined4 fff(int param_1,int param_2,int param_3)

{
  int local_1c;
  int local_18;
  undefined4 local_c;
  
  local_18 = param_3;
  for (local_1c = param_2; local_1c <= param_1; local_1c = local_1c + 1) {
    if (local_18 % *(int *)(a + (long)local_1c * 4) == 0) {
      local_18 = local_18 / *(int *)(a + (long)local_1c * 4);
      if (local_18 == 1) {
        l = l + 1;
      }
      if (1 < local_18) {
        fff(param_1,local_1c,local_18);
      }
      local_18 = local_18 * *(int *)(a + (long)local_1c * 4);
    }
  }
  return local_c;
}