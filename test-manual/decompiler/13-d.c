void main(void)

{
  int iVar1;
  uint local_1c;
  int local_18;
  int local_14;
  int local_10;
  int local_c;
  
  scanf("%d",&local_18);
  for (local_10 = 1; local_1c = 0, local_10 <= local_18; local_10 = local_10 + 1) {
    scanf("%d",&local_c);
    for (local_14 = 2; local_14 <= local_c; local_14 = local_14 + 1) {
      if (local_c % local_14 == 0) {
        iVar1 = f(local_c,local_14);
        local_1c = iVar1 + local_1c;
      }
    }
    printf("%d\n",(ulong)local_1c);
  }
  return;
}



int f(int param_1,int param_2)

{
  int iVar1;
  int local_18;
  int local_14;
  
  local_18 = 0;
  if (param_2 == param_1) {
    local_18 = 1;
  }
  else {
    param_1 = param_1 / param_2;
    for (local_14 = param_2; local_14 <= param_1; local_14 = local_14 + 1) {
      if (param_1 % local_14 == 0) {
        iVar1 = f(param_1,local_14);
        local_18 = iVar1 + local_18;
      }
    }
  }
  return local_18;
}