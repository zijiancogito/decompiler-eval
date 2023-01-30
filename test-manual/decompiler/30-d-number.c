int number(int param_1,int param_2)

{
  int iVar1;
  int local_18;
  int local_14;
  
  local_18 = 0;
  for (local_14 = param_2; local_14 * local_14 <= param_1; local_14 = local_14 + 1) {
    if (param_1 % local_14 == 0) {
      iVar1 = number((long)param_1 / (long)local_14 & 0xffffffff,local_14,
                     (long)param_1 % (long)local_14 & 0xffffffff);
      local_18 = local_18 + iVar1;
    }
  }
  return local_18 + 1;
}