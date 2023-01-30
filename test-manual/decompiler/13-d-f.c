
int f(int param_1,int param_2)

{
  int iVar1;
  int local_18;
  int local_14;
  
  local_18 = 0;
  if (param_2 == param_1) {
    local_18 = 1;
  }
  else {
    param_1 = param_1 / param_2;
    for (local_14 = param_2; local_14 <= param_1; local_14 = local_14 + 1) {
      if (param_1 % local_14 == 0) {
        iVar1 = f(param_1,local_14);
        local_18 = iVar1 + local_18;
      }
    }
  }
  return local_18;
}