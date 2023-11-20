int func0(void)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  ulong uVar4;
  uint local_30;
  uint local_2c;
  uint local_1c;
  uint local_18;
  uint local_10;
  uint local_c;
  
  local_c = 0x4e;
  local_10 = f_rand_0();
  uVar1 = f_rand_1();
  local_18 = f_rand_2();
  printf("BB: %d",0);
  local_1c = 0x4e;
  while (local_18 == 0x223) {
    printf("BB: %d",1);
    while ((int)uVar1 <= (int)local_1c) {
      printf("BB: %d",2);
      uVar2 = (int)((local_c ^ local_1c) + local_1c) / (int)local_1c;
      local_1c = uVar1 ^ 0xffffffff;
      local_18 = local_c ^ 0xffffffff;
      local_10 = (uVar1 | uVar2) & local_c ^ local_1c;
    }
    printf("BB: %d",3);
    uVar4 = (ulong)(uint)((int)((long)(int)uVar1 / (long)(int)local_1c) >> 0x1f) << 0x20 |
            (long)(int)uVar1 / (long)(int)local_1c & 0xffffffffU;
    local_1c = (uint)((long)uVar4 / (long)(int)local_18);
    if (0x11e < (int)uVar1) {
      printf("BB: %d",4,(long)uVar4 % (long)(int)local_18 & 0xffffffff);
      local_10 = -uVar1;
      local_c = (int)(local_18 ^ uVar1) / (int)(local_10 ^ 0xffffffff);
      local_1c = (int)(local_18 * local_10) % (int)uVar1;
    }
  }
  printf("BB: %d",5);
  local_2c = local_10 ^ 0xffffffff;
  if (local_18 != local_2c) {
    printf("BB: %d",6);
    iVar3 = (int)(((int)(uVar1 ^ local_c) % (int)local_10) * -local_c | local_2c) % (int)local_10;
    local_30 = uVar1 ^ 0xffffffff;
    if ((int)local_2c <= (int)local_30) {
      printf("BB: %d",7);
      local_30 = (uint)((long)((ulong)(uint)((int)((long)(int)local_18 % (long)(int)local_18) >>
                                            0x1f) << 0x20 |
                              (long)(int)local_18 % (long)(int)local_18 & 0xffffffffU) /
                       (long)(int)local_c);
      local_10 = (local_18 + local_c) - local_2c;
      local_2c = (int)local_30 % (int)local_30 - uVar1;
    }
    printf("BB: %d",8);
    if ((int)local_18 < iVar3) {
      printf("BB: %d",9);
      uVar4 = (ulong)((int)(local_2c * iVar3 ^ uVar1) % (int)local_2c ^ uVar1);
    }
    else {
      printf("BB: %d",10);
      uVar4 = (long)(int)(((int)((int)((int)(((int)local_c / (int)local_2c) * local_30) /
                                       (int)local_2c + local_18) % (int)local_10 | uVar1) %
                           (int)local_c & local_18 & local_18) + local_2c) % (long)(int)local_10 &
              0xffffffff;
    }
    printf("BB: %d",0xb,uVar4);
  }
  printf("BB: %d",0xc);
  return (int)local_10 / (int)local_c;
}
