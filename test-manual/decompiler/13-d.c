void main(void)

{
  int iVar1;
  uint local_1c;
  int local_18;
  int local_14;
  int local_10;
  int local_c;
  
  scanf("%d",&local_18);
  local_1c = 0;
  for (local_10 = 1; local_10 <= local_18; local_10 = local_10 + 1) {
    scanf("%d",&local_c);
    for (local_14 = 2; local_14 <= local_c; local_14 = local_14 + 1) {
      if (local_c % local_14 == 0) {
        iVar1 = f(local_c,local_14);
        local_1c = iVar1 + local_1c;
      }
    }
    printf("%d\n",(ulong)local_1c);
    local_1c = 0;
  }
  return;
}


