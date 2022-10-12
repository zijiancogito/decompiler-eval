int f(int param_1,int param_2)

{
  int iVar1;
  int local_10;
  int local_c;
  
  local_10 = 0;
  if (param_2 == param_1) {
    local_10 = 1;
  }
  else {
    param_1 = param_1 / param_2;
    for (local_c = param_2; local_c <= param_1; local_c = local_c + 1) {
      if (param_1 % local_c == 0) {
        iVar1 = f(param_1,local_c);
        local_10 = local_10 + iVar1;
      }
    }
  }
  return local_10;
}
