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