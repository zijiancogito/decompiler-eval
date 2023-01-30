void calc(int param_1,int param_2)

{
  int local_14;
  
  if (param_1 == 1) {
    t = t + 1;
  }
  else {
    local_14 = param_2;
    if (param_2 <= param_1) {
      for (; local_14 <= param_1; local_14 = local_14 + 1) {
        if (param_1 % local_14 == 0) {
          calc((long)param_1 / (long)local_14 & 0xffffffff,local_14,
               (long)param_1 % (long)local_14 & 0xffffffff);
        }
      }
    }
  }
  return;
}



void main(void)

{
  undefined4 local_14;
  int local_10;
  int local_c;
  
  scanf("%d",&local_c);
  for (local_10 = 1; local_10 <= local_c; local_10 = local_10 + 1) {
    scanf("%d",&local_14);
    t = 0;
    calc(local_14,2);
    printf("%d\n",(ulong)t);
  }
  return;
}