uint func0(void)

{
  uint uVar1;
  uint uVar2;
  ulong uVar3;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  
  uVar1 = f_rand_3();
  local_10 = f_rand_0();
  f_rand_2();
  local_18 = f_rand_4();
  local_1c = f_rand_1();
  printf("BB: %d",0);
  local_14 = (local_18 ^ 0xffffffff) + uVar1 ^ uVar1;
  if (uVar1 == local_14) {
    printf("BB: %d",8);
    if ((int)local_10 < (int)uVar1) {
      printf("BB: %d",10);
      uVar2 = uVar1 ^ 0xffffffff;
      local_10 = (int)(local_1c ^ 0xffffffff ^ uVar2) % (int)uVar2;
      uVar3 = (long)((ulong)(uint)((int)((long)(int)local_10 / (long)(int)uVar2) >> 0x1f) << 0x20 |
                    (long)(int)local_10 / (long)(int)uVar2 & 0xffffffffU) % (long)(int)uVar1 &
              0xffffffff;
    }
    else {
      printf("BB: %d",9);
      local_14 = local_14 ^ 0xffffffff;
      local_10 = local_10 - local_14 & uVar1;
      local_18 = ((local_10 ^ 0xffffffff) + local_14) * local_1c;
      uVar3 = (ulong)((int)((int)((local_14 ^ local_18) * uVar1 - uVar1) % (int)local_1c + local_10)
                      % (int)local_18 - local_18);
    }
    printf("BB: %d",0xb,uVar3);
    local_c = local_18 + local_10 ^ local_10;
  }
  else {
    printf("BB: %d",1);
    local_20 = local_18 ^ 0xffffffff;
    if ((int)local_10 < (int)local_20) {
      printf("BB: %d",2);
      local_c = ((local_1c ^ local_18) - uVar1) * local_14 ^ local_20 | local_1c;
      local_18 = local_18 | local_1c;
      local_20 = ((local_18 | local_10) + local_14) * local_10;
      local_14 = (local_14 | local_c) & local_14;
      local_c = (local_1c & local_14) + local_c;
    }
    else {
      printf("BB: %d",3);
      local_c = (int)((local_14 * uVar1 | local_18) - local_18) % (int)local_14;
      local_20 = local_10 * local_1c + local_20;
      local_10 = (local_c | local_20) ^ local_18;
    }
    printf("BB: %d",4);
    for (; 0x15d < (int)local_c;
        local_c = ((int)((((local_10 ^ local_14) & local_14 | local_20) ^ local_1c ^ 0xffffffff) -
                        local_c) % (int)local_18) * local_c ^ local_c) {
      printf("BB: %d",5);
      local_20 = (int)local_20 / (int)local_14 ^ local_10;
      local_c = (local_18 | local_20) & local_18;
    }
    printf("BB: %d",6);
    uVar3 = (long)(int)((local_10 ^ 0xffffffff) * local_1c - local_c) % (long)(int)local_18;
    while (0x2f0 < (int)local_20) {
      printf("BB: %d",7,uVar3 & 0xffffffff);
      uVar1 = (local_20 ^ 0xffffffff) & local_c;
      uVar3 = (long)(int)(uVar1 | local_1c | uVar1 | local_14) % (long)(int)local_c;
      local_1c = local_18 + local_c;
    }
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return local_18 +
         (int)(((int)local_c / (int)local_c | ((local_14 ^ 0xffffffff) + local_14) * local_c) -
              local_14) % (int)local_14 | local_18;
}
