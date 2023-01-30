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
