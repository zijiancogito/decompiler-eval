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
