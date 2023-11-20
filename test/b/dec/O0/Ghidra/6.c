uint func0(void)

{
  ulong uVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  ulong uVar6;
  uint local_24;
  int local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  
  uVar2 = f_rand_0();
  iVar3 = f_rand_4();
  local_18 = f_rand_2();
  local_1c = f_rand_1();
  uVar4 = f_rand_3();
  printf("BB: %d",0);
  local_24 = (int)uVar4 % 0x12a + 0x12a;
  if ((int)local_24 < iVar3) {
    printf("BB: %d",5);
    while ((int)uVar4 < local_18) {
      printf("BB: %d",6);
    }
    printf("BB: %d",7);
    local_14 = local_24 * uVar4 & uVar2;
    uVar2 = (local_1c ^ local_24) * uVar2 ^ uVar4;
    uVar6 = (long)(int)uVar4 % (long)(int)uVar2;
    while (uVar6 = uVar6 & 0xffffffff, 0x196 < (int)local_1c) {
      printf("BB: %d",8,uVar6);
      local_14 = (local_1c ^ local_24) * ((int)uVar4 / (int)uVar2 | uVar4) ^ 0xffffffff | uVar2;
      uVar6 = (long)(int)local_24 % (long)local_18;
      local_1c = ((uVar2 - local_14) + local_14) * uVar2;
    }
  }
  else {
    printf("BB: %d",1);
    local_20 = (local_24 ^ uVar4) + local_18 + uVar4;
    while (0x2ad < (int)local_1c) {
      printf("BB: %d",2);
      local_1c = 0x12a % (int)local_24 - local_18;
      local_18 = (int)((long)((ulong)(uint)((int)(0x12a / (long)local_18) >> 0x1f) << 0x20 |
                             0x12a / (long)local_18 & 0xffffffffU) % (long)local_18);
      local_20 = (int)uVar2 % (int)local_1c + local_18;
      local_24 = (uVar2 + iVar3) * iVar3;
    }
    printf("BB: %d",3);
    uVar4 = (((int)(local_20 + local_24) % (int)uVar2) * 0x12a) % (int)local_1c + local_1c;
    uVar6 = (ulong)uVar4;
    local_14 = (local_24 ^ 0xffffffff) + local_1c;
    while (local_1c == 0x12a) {
      printf("BB: %d",4,uVar6);
      local_14 = (int)(uVar4 * local_20) / local_20;
      uVar5 = (local_14 ^ 0xffffffff) - local_24;
      uVar1 = CONCAT44((int)(uVar5 ^ 0xffffffff) >> 0x1f,uVar5) ^ 0xffffffff;
      uVar6 = (long)uVar1 % (long)(int)uVar2 & 0xffffffff;
      local_20 = (int)((long)uVar1 / (long)(int)uVar2);
      local_1c = (uVar4 - uVar2) - (local_24 ^ 0xffffffff);
    }
  }
  printf("BB: %d",9,uVar6);
  local_24 = local_24 + 0x12a;
  iVar3 = ((int)local_24 / (int)local_24 | local_24) + local_14;
  local_14 = local_14 - local_1c ^ local_14;
  printf("BB: %d",10,(long)(int)local_14 % (long)iVar3 & 0xffffffff);
  return ((int)local_14 / iVar3 + local_24 | local_24) ^ 0x12a;
}
