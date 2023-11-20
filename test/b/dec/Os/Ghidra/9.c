undefined func0(void)

{
  ulong uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  uint uVar7;
  undefined auVar8 [16];
  uint local_3c;
  
  uVar2 = f_rand_0();
  uVar3 = f_rand_1();
  uVar4 = f_rand_2();
  printf("BB: %d",0);
  if (uVar4 == 0x223) {
    uVar7 = ~uVar3;
    local_3c = 0x4e;
    uVar5 = 0x4e;
    do {
      printf("BB: %d",1);
      uVar4 = 0x223;
      if ((int)uVar3 <= (int)uVar5) {
        do {
          printf("BB: %d",2);
        } while ((int)uVar3 <= (int)uVar7);
        uVar4 = ~local_3c;
        uVar2 = ((int)((uVar5 ^ local_3c) + uVar5) / (int)uVar5 | uVar3) & local_3c ^ uVar7;
        uVar5 = uVar7;
      }
      printf("BB: %d",3);
      uVar1 = (ulong)(uint)((int)((long)(int)uVar3 / (long)(int)uVar5) >> 0x1f) << 0x20 |
              (long)(int)uVar3 / (long)(int)uVar5 & 0xffffffffU;
      if ((int)uVar3 < 0x11f) {
        uVar5 = (uint)((long)uVar1 / (long)(int)uVar4);
      }
      else {
        printf("BB: %d",4,(long)uVar1 % (long)(int)uVar4 & 0xffffffff);
        local_3c = (int)(uVar4 ^ uVar3) / (int)(uVar3 - 1);
        uVar5 = (int)(uVar4 * -uVar3) % (int)uVar3;
        uVar2 = -uVar3;
      }
    } while (uVar4 == 0x223);
  }
  else {
    local_3c = 0x4e;
  }
  printf("BB: %d",5);
  if (uVar4 != ~uVar2) {
    printf("BB: %d",6);
    iVar6 = (int)(~uVar2 | -(((int)(local_3c ^ uVar3) % (int)uVar2) * local_3c)) % (int)uVar2;
    if ((int)uVar3 <= (int)uVar2) {
      printf("BB: %d",7);
      uVar2 = uVar2 + 1 + uVar4 + local_3c;
    }
    printf("BB: %d",8);
    printf("BB: %d",(ulong)(10 - ((int)uVar4 < iVar6)));
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  auVar8._0_8_ = (long)(int)uVar2 / (long)(int)local_3c & 0xffffffff;
  auVar8._8_8_ = (long)(int)uVar2 % (long)(int)local_3c & 0xffffffff;
  return auVar8;
}
