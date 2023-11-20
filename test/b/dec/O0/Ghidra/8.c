int func0(void)

{
  ulong uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_c;
  
  local_c = f_rand_1();
  uVar2 = f_rand_2();
  local_14 = f_rand_0();
  local_18 = f_rand_4();
  local_1c = f_rand_3();
  printf("BB: %d",0);
  while (local_1c != uVar2) {
    printf("BB: %d",1);
    while (0x252 < (int)uVar2) {
      printf("BB: %d",2);
      local_14 = (int)(local_1c * local_14) % (int)uVar2 | local_1c;
      local_c = (uint)((long)((ulong)(uint)((int)((long)(int)local_14 / (long)(int)local_c) >> 0x1f)
                              << 0x20 | (long)(int)local_14 / (long)(int)local_c & 0xffffffffU) %
                      (long)(int)local_14) & uVar2;
      local_18 = local_14 ^ local_c ^ local_18;
    }
    printf("BB: %d",3);
    while (0x244 < (int)uVar2) {
      printf("BB: %d",4);
      uVar3 = local_14 & uVar2;
      uVar4 = local_18 ^ 0xffffffff;
      local_18 = (local_14 ^ 0xffffffff) + local_14;
      local_14 = (int)(local_18 - local_1c) / (int)uVar2;
      local_c = (int)(uVar4 - local_18 & (int)uVar3 % (int)local_1c) % (int)local_1c;
    }
    printf("BB: %d",5);
    if (uVar2 == local_1c) {
      printf("BB: %d",7);
      uVar1 = (long)(int)(((local_14 ^ 0xffffffff) & local_1c) + uVar2) %
              (long)(int)(local_18 & uVar2 & local_c);
    }
    else {
      printf("BB: %d",6);
      uVar1 = (long)(int)((int)uVar2 % (int)local_14 & uVar2) % (long)(int)uVar2;
      local_1c = local_c ^ 0xffffffff;
    }
    printf("BB: %d",8,uVar1 & 0xffffffff);
  }
  printf("BB: %d",9);
  if ((int)local_18 < (int)local_14) {
    printf("BB: %d",10);
    uVar3 = (int)local_1c % (int)local_1c + local_1c;
    local_c = ((local_1c & uVar3) - local_18) * uVar2;
    local_18 = (uVar3 ^ 0xffffffff) + (uVar3 & local_18 | local_1c);
  }
  else {
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  uVar3 = uVar2 * 2 - local_18;
  printf("BB: %d",0xd,
         (long)((ulong)(uint)((int)((long)(int)uVar3 % (long)(int)local_18) >> 0x1f) << 0x20 |
               (long)(int)uVar3 % (long)(int)local_18 & 0xffffffffU) % (long)(int)uVar3 & 0xffffffff
        );
  return ((local_14 ^ uVar3 | local_c) + uVar2) - uVar2;
}
