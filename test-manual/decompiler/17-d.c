int fun(int param_1,int param_2)

{
  int iVar1;
  int local_18;
  int local_14;
  
  local_18 = 0;
  for (local_14 = param_1; local_14 * local_14 <= param_2; local_14 = local_14 + 1) {
    if (param_2 % local_14 == 0) {
      iVar1 = fun(local_14,(long)param_2 / (long)local_14 & 0xffffffff,
                  (long)param_2 % (long)local_14 & 0xffffffff);
      local_18 = iVar1 + local_18 + 1;
    }
  }
  return local_18;
}



undefined8 main(void)

{
  int iVar1;
  undefined4 local_14;
  int local_10;
  undefined4 local_c;
  
  local_c = 0;
  scanf("%d",&local_10);
  while (0 < local_10) {
    local_10 = local_10 + -1;
    scanf("%d",&local_14);
    iVar1 = fun(2,local_14);
    printf("%d\n",(ulong)(iVar1 + 1));
  }
  return 0;
}