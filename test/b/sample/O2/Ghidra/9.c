undefined func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  ulong uVar8;
  undefined auVar9 [16];
  uint local_3c;
  
  uVar1 = f_rand_0();
  uVar2 = f_rand_1();
  uVar3 = f_rand_2();
  printf("BB: %d",0);
  if (uVar3 == 0x223) {
    uVar6 = ~uVar2;
    uVar4 = -uVar2;
    local_3c = 0x4e;
    uVar8 = 0x4e;
    do {
      while( true ) {
        printf("BB: %d",1);
        uVar3 = 0x223;
        uVar7 = (uint)uVar8;
        if ((int)uVar2 <= (int)uVar7) {
          do {
            printf("BB: %d",2);
          } while ((int)uVar2 <= (int)uVar6);
          uVar3 = ~local_3c;
          uVar1 = ((int)((uVar7 ^ local_3c) + uVar7) / (int)uVar7 | uVar2) & local_3c ^ uVar6;
          uVar7 = uVar6;
        }
        printf("BB: %d",3);
        uVar8 = (ulong)(uint)((int)((long)(int)uVar2 / (long)(int)uVar7) >> 0x1f) << 0x20 |
                (long)(int)uVar2 / (long)(int)uVar7 & 0xffffffffU;
        if (0x11e < (int)uVar2) break;
        uVar8 = (long)uVar8 / (long)(int)uVar3 & 0xffffffff;
        if (uVar3 != 0x223) goto LAB_00101298;
      }
      printf("BB: %d",4,(long)uVar8 % (long)(int)uVar3 & 0xffffffff);
      local_3c = (int)(uVar3 ^ uVar2) / (int)(uVar2 - 1);
      uVar8 = (long)(int)(uVar3 * uVar4) % (long)(int)uVar2 & 0xffffffff;
      uVar1 = uVar4;
    } while (uVar3 == 0x223);
  }
  else {
    local_3c = 0x4e;
  }
LAB_00101298:
  printf("BB: %d",5);
  if (uVar3 != ~uVar1) {
    printf("BB: %d",6);
    iVar5 = (int)(~uVar1 | -(((int)(local_3c ^ uVar2) % (int)uVar1) * local_3c)) % (int)uVar1;
    if ((int)uVar2 <= (int)uVar1) {
      printf("BB: %d",7);
      uVar1 = uVar1 + 1 + uVar3 + local_3c;
    }
    printf("BB: %d",8);
    printf("BB: %d",(ulong)(10 - ((int)uVar3 < iVar5)));
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  auVar9._0_8_ = (long)(int)uVar1 / (long)(int)local_3c & 0xffffffff;
  auVar9._8_8_ = (long)(int)uVar1 % (long)(int)local_3c & 0xffffffff;
  return auVar9;
}
