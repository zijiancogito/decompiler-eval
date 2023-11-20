int func0(void)

{
  ulong uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint local_28;
  uint local_24;
  uint local_20;
  uint local_1c;
  uint local_14;
  uint local_10;
  uint local_c;
  
  local_c = 0x12e;
  local_10 = f_rand_4();
  uVar2 = f_rand_3();
  local_1c = f_rand_2();
  local_20 = f_rand_1();
  local_24 = f_rand_0();
  printf("BB: %d",0);
  local_28 = (local_20 & 0xe) * local_24 | uVar2;
  uVar3 = (int)((long)(CONCAT44((int)(local_1c ^ 0xffffffff) >> 0x1f,local_1c) ^ 0xffffffff) % 0x12e
               ) + 0x2cfU & local_10;
  local_14 = (local_24 & uVar2 | uVar2) & uVar3;
  if (local_20 == 0x21f) {
    printf("BB: %d",1);
    local_28 = (local_14 | local_10 | 0x2cf) & uVar3;
    uVar2 = local_1c - 0x2d0;
    local_10 = local_24 ^ 0xffffffff;
    while (uVar3 == 0x39d) {
      printf("BB: %d",2);
      local_c = local_10 * local_c - local_20;
      uVar4 = local_20 ^ 0xffffffff;
      local_20 = (int)(0x39d - local_28) % (int)local_20 & uVar2 & local_20;
      local_28 = (int)((int)(local_28 ^ local_14 ^ local_c) / (int)local_14 | uVar4) / (int)local_24
      ;
      local_1c = (local_10 & 0x2cf) * local_24 ^ local_1c;
    }
    printf("BB: %d",3);
    while ((int)local_24 < 0x262) {
      printf("BB: %d",4);
      local_28 = (uVar2 | 0x2cf) * local_28;
    }
  }
  printf("BB: %d",5);
  while (local_10 != 0x273) {
    printf("BB: %d",6);
    while ((int)local_10 < 0x160) {
      printf("BB: %d",7);
      local_14 = local_10 ^ 0xffffffff;
      local_24 = (int)local_c % (int)uVar3 & local_c;
    }
    printf("BB: %d",8);
    uVar1 = (long)(int)(local_c ^ 0x2cf) % 0x2cf;
    if (0x2cf < (int)local_c) {
      printf("BB: %d",9);
      local_14 = (int)local_10 / (int)uVar3 & local_1c;
      local_20 = (uint)((long)(CONCAT44((int)(uVar3 ^ 0xffffffff) >> 0x1f,uVar3) ^ 0xffffffff) %
                       (long)(int)local_c);
      uVar1 = (long)(int)((local_c - local_1c) - local_28) % (long)(int)uVar1;
    }
    printf("BB: %d",10,uVar1 & 0xffffffff);
    local_28 = (int)(uVar3 * local_20 ^ uVar3) % (int)uVar3;
  }
  printf("BB: %d",0xb);
  return (int)((local_1c - 0x2cf ^ local_20) & local_24) % (int)local_14;
}
