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
