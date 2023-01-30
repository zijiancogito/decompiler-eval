undefined4 fff(int param_1,int param_2,int param_3,int param_4)

{
  int local_20;
  int local_1c;
  undefined4 local_c;
  
  local_1c = param_4;
  for (local_20 = param_3; local_20 <= param_2; local_20 = local_20 + 1) {
    if (local_1c % *(int *)(a + (long)local_20 * 4) == 0) {
      local_1c = local_1c / *(int *)(a + (long)local_20 * 4);
      if (local_1c == 1) {
        l = l + 1;
      }
      if (1 < local_1c) {
        fff(param_1 + 1,param_2,local_20,local_1c);
      }
      local_1c = local_1c * *(int *)(a + (long)local_20 * 4);
    }
  }
  return local_c;
}