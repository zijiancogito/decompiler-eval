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

