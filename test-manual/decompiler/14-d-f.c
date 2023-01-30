
int f(int param_1,int param_2)

{
  int iVar1;
  double dVar2;
  int local_1c;
  int local_14;
  
  local_1c = 0;
  iVar1 = local_1c;
  dVar2 = sqrt((double)param_2);
  for (local_14 = param_1; local_14 < (int)dVar2 + 1; local_14 = local_14 + 1) {
    if (local_14 == 1) {
      local_1c = 0;
    }
    else if ((param_2 % local_14 == 0) && (local_14 <= param_2 / local_14)) {
      local_1c = f(local_14,(long)param_2 / (long)local_14 & 0xffffffff,
                   (long)param_2 % (long)local_14 & 0xffffffff);
      local_1c = local_1c + 1;
    }
    else {
      local_1c = 0;
    }
    local_1c = local_1c + iVar1;
    iVar1 = local_1c;
    dVar2 = sqrt((double)param_2);
  }
  return local_1c;
}
