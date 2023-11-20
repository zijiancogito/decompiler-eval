uint func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  ulong uVar6;
  ulong uVar7;
  
  uVar1 = f_rand_1();
  uVar7 = (ulong)uVar1;
  uVar2 = f_rand_2();
  uVar3 = f_rand_0();
  uVar6 = (ulong)uVar3;
  uVar4 = f_rand_4();
  uVar5 = f_rand_3();
  printf("BB: %d",0);
  while (uVar5 != uVar2) {
    printf("BB: %d",1);
    while (0x252 < (int)uVar2) {
      printf("BB: %d",2);
      uVar1 = (int)((uint)uVar6 * uVar5) % (int)uVar2 | uVar5;
      uVar6 = (ulong)uVar1;
      uVar7 = (long)(int)uVar1 / (long)(int)uVar7;
      uVar3 = (uint)((long)((ulong)(uint)((int)uVar7 >> 0x1f) << 0x20 | uVar7 & 0xffffffff) %
                    (long)(int)uVar1) & uVar2;
      uVar7 = (ulong)uVar3;
      uVar4 = uVar4 ^ uVar1 ^ uVar3;
    }
    printf("BB: %d",3);
    if (0x244 < (int)uVar2) {
      do {
        printf("BB: %d",4);
      } while (0x244 < (int)uVar2);
      uVar7 = (long)(int)(-uVar4 & (int)((uint)uVar6 & uVar2) % (int)uVar5) % (long)(int)uVar5 &
              0xffffffff;
      uVar4 = 0xffffffff;
      uVar6 = (long)(int)~uVar5 / (long)(int)uVar2 & 0xffffffff;
    }
    uVar3 = (uint)uVar6;
    printf("BB: %d",5);
    printf("BB: %d",6);
    uVar1 = (uint)uVar7;
    printf("BB: %d",8);
    uVar5 = ~uVar1;
  }
  printf("BB: %d",9);
  if ((int)uVar4 < (int)uVar3) {
    printf("BB: %d",10);
    uVar1 = (uVar5 - uVar4) * uVar2;
    uVar4 = 0xffffffff;
  }
  else {
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return uVar2 * 2 - uVar4 ^ uVar3 | uVar1;
}
