undefined4 main(void)

{
  uint uVar1;
  undefined4 local_18;
  int local_14;
  int local_10;
  undefined4 local_c;
  
  local_c = 0;
  scanf("%d",&local_10);
  for (local_14 = 1; local_14 <= local_10; local_14 = local_14 + 1) {
    scanf("%d",&local_18);
    uVar1 = number(local_18,2);
    printf("%d\n",(ulong)uVar1);
  }
  return local_c;
}



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