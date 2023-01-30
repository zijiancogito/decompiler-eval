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