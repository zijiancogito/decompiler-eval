undefined4 main(void)

{
  int local_20;
  int local_1c;
  int local_18;
  int local_10;
  undefined4 local_c;
  
  local_c = 0;
  scanf("%d",&local_20);
  for (local_1c = 0; local_1c < local_20; local_1c = local_1c + 1) {
    local_18 = 1;
    l = 0;
    scanf("%d",&x);
    for (local_10 = 2; local_10 <= (int)x; local_10 = local_10 + 1) {
      if ((int)x % local_10 == 0) {
        *(int *)(a + (long)local_18 * 4) = local_10;
        local_18 = local_18 + 1;
      }
    }
    fff(local_18 + -1,1,x);
    _end("%d\n",(ulong)l,(ulong)x);
  }
  return local_c;
}



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