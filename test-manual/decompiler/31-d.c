undefined8 main(void)

{
  uint uVar1;
  undefined4 local_14;
  int local_10;
  undefined4 local_c;
  
  local_c = 0;
  scanf("%d",&local_10);
  while( true ) {
    if (local_10 == 0) break;
    local_10 = local_10 + -1;
    scanf("%d",&local_14);
    uVar1 = calc(2,local_14);
    printf("%d\n",(ulong)uVar1);
  }
  return 0;
}
