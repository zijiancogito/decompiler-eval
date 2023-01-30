int calc(int param_1,int param_2)

{
  int iVar1;
  double dVar2;
  int local_18;
  int local_14;
  
  local_18 = 1;
  local_14 = param_1;
  while( true ) {
    dVar2 = sqrt((double)param_2);
    if (dVar2 < (double)local_14) break;
    if (param_2 % local_14 == 0) {
      iVar1 = calc(local_14,(long)param_2 / (long)local_14 & 0xffffffff,
                   (long)param_2 % (long)local_14 & 0xffffffff);
      local_18 = local_18 + iVar1;
    }
    local_14 = local_14 + 1;
  }
  return local_18;
}