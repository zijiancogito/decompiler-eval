uint func0(void)

{
  uint uVar1;
  uint uVar2;
  ulong uVar3;
  uint local_24;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  
  uVar1 = f_rand_2();
  local_10 = f_rand_1();
  local_1c = f_rand_0();
  printf("BB: %d",0);
  uVar2 = (int)(local_1c + 0x5b) % 0xdb;
  local_18 = (local_1c + 0x37f) * local_1c;
  if (uVar2 == uVar1) {
    printf("BB: %d",1);
    local_1c = (local_1c * local_18 - uVar1) * uVar1;
    local_10 = (local_10 & local_1c ^ local_18) & local_18 & local_10;
    local_24 = (local_18 * uVar1 + local_10) * local_1c & local_10;
    uVar3 = (long)(int)(local_18 & uVar2) % (long)(int)local_1c;
    while (uVar3 = uVar3 & 0xffffffff, 0x2dd < (int)uVar1) {
      printf("BB: %d",2,uVar3);
      uVar3 = (long)(CONCAT44((int)(uVar2 ^ 0xffffffff) >> 0x1f,uVar2) ^ 0xffffffff) %
              (long)(int)uVar2;
      uVar3 = (long)(int)(local_18 + uVar1) %
              (long)(int)((int)((long)((ulong)(uint)((int)uVar3 >> 0x1f) << 0x20 |
                                      uVar3 & 0xffffffff) / (long)(int)local_24) + local_1c);
      local_24 = (uint)uVar3;
    }
  }
  else {
    printf("BB: %d",3);
    local_14 = ((int)local_10 % (int)uVar1 ^ local_1c) - local_1c;
    while (0x22b < (int)uVar1) {
      printf("BB: %d",4);
      local_18 = (local_1c - (((int)(local_10 | local_14) % (int)local_10 ^ local_10) + uVar1) ^
                 local_14) - local_10;
      local_14 = ((int)local_10 / (int)local_10 ^ local_1c) + local_10;
    }
    printf("BB: %d",5);
    while ((int)local_10 < (int)local_1c) {
      printf("BB: %d",6);
      local_18 = 0 / (int)uVar1;
      local_1c = (uint)((long)((ulong)(uint)((int)(0 % (long)(int)local_14) >> 0x1f) << 0x20 |
                              0 % (long)(int)local_14 & 0xffffffffU) / (long)(int)local_10);
    }
    printf("BB: %d",7);
    if ((int)local_1c < 0x356) {
      printf("BB: %d",9);
    }
    else {
      printf("BB: %d",8);
      local_14 = local_18 | local_1c | local_14;
      uVar2 = local_14 ^ 0xffffffff;
      local_14 = (uVar2 + local_14) - uVar1;
      local_10 = (local_18 - uVar2) + local_1c;
    }
    printf("BB: %d",10);
    uVar3 = (long)(int)((local_10 ^ local_1c) * local_18) % (long)(int)local_14 & 0xffffffff;
  }
  printf("BB: %d",0xb,uVar3);
  printf("BB: %d",0xc);
  return local_1c | uVar1;
}
