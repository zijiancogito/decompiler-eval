void main(void)

{
  int iVar1;
  int local_1a4;
  int local_1a0;
  uint local_19c;
  undefined4 local_198 [100];
  
  scanf("%d",&local_1a4);
  for (local_1a0 = 0; local_1a0 < local_1a4; local_1a0 = local_1a0 + 1) {
    scanf("%d",local_198 + local_1a0);
  }
  for (local_1a0 = 0; local_1a0 < local_1a4; local_1a0 = local_1a0 + 1) {
    iVar1 = f(1,local_198[local_1a0]);
    local_19c = iVar1 + 1;
    printf("%d\n",(ulong)local_19c);
  }
  return;
}



int f(int param_1,int param_2)

{
  int iVar1;
  double dVar2;
  int local_1c;
  int local_14;
  
  local_1c = 0;
  for (local_14 = param_1; iVar1 = local_1c, dVar2 = sqrt((double)param_2),
      local_14 < (int)dVar2 + 1; local_14 = local_14 + 1) {
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
  }
  return local_1c;
}
