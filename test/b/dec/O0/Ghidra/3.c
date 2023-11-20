uint func0(void)

{
  ulong uVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int local_2c;
  uint local_14;
  uint local_10;
  uint local_c;
  
  local_c = f_rand_4();
  local_10 = 0x1ed;
  local_14 = f_rand_0();
  uVar2 = f_rand_2();
  uVar3 = f_rand_1();
  iVar4 = f_rand_3();
  printf("BB: %d",0);
  local_2c = -0x36562 % (int)uVar3;
  while (local_2c <= (int)local_10) {
    printf("BB: %d",1);
    while (0x100 < (int)local_c) {
      printf("BB: %d",2);
      local_14 = (iVar4 / local_2c - local_2c) % iVar4;
      local_2c = (uVar3 - 0x100 & local_14) - uVar3;
    }
    printf("BB: %d",3);
    uVar1 = 0x100 % (long)(int)local_c;
    while (local_10 != 0x1c3) {
      printf("BB: %d",4,uVar1 & 0xffffffff);
      uVar1 = (long)iVar4 % (long)(0x100 / (int)local_c + 0x362);
      local_2c = (int)((long)((ulong)(uint)((int)uVar1 >> 0x1f) << 0x20 | uVar1 & 0xffffffff) /
                      (long)(int)uVar2);
      local_10 = local_14 ^ 0xffffffff;
      uVar1 = (long)((ulong)(uint)((int)((long)(int)local_14 / (long)(int)local_10) >> 0x1f) << 0x20
                    | (long)(int)local_14 / (long)(int)local_10 & 0xffffffffU) / (long)(int)local_10
      ;
      uVar1 = (long)((ulong)(uint)((int)uVar1 >> 0x1f) << 0x20 | uVar1 & 0xffffffff) %
              (long)(int)uVar2;
    }
    printf("BB: %d",5,uVar1 & 0xffffffff);
    local_14 = (int)local_14 % 0x1c3 + 0x100;
  }
  printf("BB: %d",6);
  if ((int)local_c < 0x289) {
    printf("BB: %d",7);
    uVar1 = (long)(iVar4 * 3) % (long)(int)local_10;
    while ((int)local_10 < 0x292) {
      printf("BB: %d",8,uVar1 & 0xffffffff);
      uVar1 = -0x101 % (long)(int)local_14;
    }
    printf("BB: %d",9,uVar1 & 0xffffffff);
    while ((int)local_c < 0x101) {
      printf("BB: %d",10);
      local_c = (iVar4 * 3) / (int)local_10 & 0x362U | uVar3;
    }
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return uVar2 ^ 0x100;
}
