undefined func0(void)

{
  long lVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  ulong uVar5;
  int iVar6;
  uint uVar7;
  ulong uVar8;
  undefined auVar9 [16];
  
  uVar2 = f_rand_0();
  uVar3 = f_rand_1();
  uVar4 = f_rand_2();
  printf("BB: %d",0);
  if (uVar4 == 0x223) {
    uVar2 = ~uVar3;
    if ((int)uVar3 < 0x11f) {
      printf("BB: %d",1);
      if ((int)uVar3 <= (int)uVar2) {
        if (0x4e < (int)uVar3) {
          iVar6 = 0x4e;
          do {
            printf("BB: %d",3);
            lVar1 = (long)iVar6;
            iVar6 = ((int)uVar3 / iVar6) / 0x223;
            printf("BB: %d",1,(long)(int)uVar3 % lVar1 & 0xffffffff);
          } while (iVar6 < (int)uVar3);
        }
        do {
          printf("BB: %d",2);
        } while( true );
      }
      uVar7 = 0x4e;
      uVar4 = 0x4e;
      if (0x4e < (int)uVar3) {
        uVar4 = 0x4e;
        do {
          printf("BB: %d",3);
          lVar1 = (long)(int)uVar4;
          uVar4 = ((int)uVar3 / (int)uVar4) / 0x223;
          printf("BB: %d",1,(long)(int)uVar3 % lVar1 & 0xffffffff);
        } while ((int)uVar4 < (int)uVar3);
      }
      printf("BB: %d",2);
      iVar6 = (uVar4 ^ 0x4e) + uVar4;
      uVar2 = (iVar6 / (int)uVar4 | uVar3) & 0x4e ^ uVar2;
      printf("BB: %d",3,(long)iVar6 % (long)(int)uVar4 & 0xffffffff);
      uVar4 = 0xffffffb1;
    }
    else {
      if ((int)uVar3 <= (int)uVar2) {
        printf("BB: %d",1);
        do {
          printf("BB: %d",3);
          printf("BB: %d",4);
          printf("BB: %d",1);
        } while( true );
      }
      uVar2 = -uVar3;
      uVar8 = 0x4e;
      uVar5 = 0x4e;
      do {
        printf("BB: %d",1);
        uVar4 = 0x223;
        if ((int)uVar3 <= (int)uVar5) {
          printf("BB: %d",2);
          uVar4 = ~(uint)uVar8;
        }
        printf("BB: %d",3);
        printf("BB: %d",4);
        uVar5 = (long)(int)(uVar4 ^ uVar3) / (long)(int)(uVar3 - 1);
        uVar8 = uVar5 & 0xffffffff;
        uVar7 = (uint)uVar5;
        uVar5 = (long)(int)(uVar4 * uVar2) % (long)(int)uVar3 & 0xffffffff;
      } while (uVar4 == 0x223);
    }
  }
  else {
    uVar7 = 0x4e;
  }
  printf("BB: %d",5);
  if (uVar4 != ~uVar2) {
    printf("BB: %d",6);
    iVar6 = (int)(~uVar2 | -(((int)(uVar7 ^ uVar3) % (int)uVar2) * uVar7)) % (int)uVar2;
    if ((int)uVar3 <= (int)uVar2) {
      printf("BB: %d",7);
      uVar2 = uVar2 + 1 + uVar4 + uVar7;
    }
    printf("BB: %d",8);
    printf("BB: %d",(ulong)(10 - ((int)uVar4 < iVar6)));
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  auVar9._0_8_ = (long)(int)uVar2 / (long)(int)uVar7 & 0xffffffff;
  auVar9._8_8_ = (long)(int)uVar2 % (long)(int)uVar7 & 0xffffffff;
  return auVar9;
}
