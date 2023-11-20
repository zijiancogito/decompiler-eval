uint func0(void)

{
  long lVar1;
  short sVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  
  uVar3 = f_rand_0();
  iVar4 = f_rand_4();
  iVar5 = f_rand_2();
  uVar6 = f_rand_1();
  uVar7 = f_rand_3();
  printf("BB: %d",0);
  uVar10 = (int)uVar7 % 0x12a + 0x12a;
  if ((int)uVar10 < iVar4) {
    printf("BB: %d",5);
    if ((int)uVar7 < iVar5) {
      do {
        printf("BB: %d",6);
      } while( true );
    }
    printf("BB: %d",7);
    uVar9 = uVar10 ^ uVar6;
    uVar8 = uVar9 * uVar3 ^ uVar7;
    if ((int)uVar6 < 0x197) {
      uVar8 = uVar7 * uVar10 & uVar3;
    }
    else {
      uVar6 = uVar8 * uVar8;
      if (0x196 < uVar6) {
        do {
          printf("BB: %d",8);
        } while( true );
      }
      printf("BB: %d",8,(long)(int)uVar7 % (long)(int)uVar8 & 0xffffffff);
      uVar8 = uVar8 | ~(uVar9 * ((int)uVar7 / (int)uVar8 | uVar7));
    }
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar6 < 0x2ae) {
      iVar4 = iVar5 + uVar7 + (uVar10 ^ uVar7);
    }
    else {
      uVar7 = (iVar4 + uVar3) * iVar4;
      printf("BB: %d",2);
      uVar6 = 0x12aU % (uVar10 & 0xffff) - iVar5;
      lVar1 = (long)((ulong)(uint)((int)(0x12a / (long)iVar5) >> 0x1f) << 0x20 |
                    0x12a / (long)iVar5 & 0xffffffffU) % (long)iVar5;
      sVar2 = (short)lVar1;
      iVar4 = (int)lVar1;
      if (0x2ad < (int)uVar6) {
        printf("BB: %d",2);
        uVar6 = (int)(0x12a % (long)(int)uVar7) - iVar4;
        iVar4 = (int)(short)((short)(0x12a / (int)sVar2) % sVar2);
      }
      iVar4 = (int)uVar3 % (int)uVar6 + iVar4;
      uVar10 = uVar7;
    }
    printf("BB: %d",3);
    if (uVar6 == 0x12a) {
      uVar8 = (((int)(iVar4 + uVar10) % (int)uVar3) * 0x12a) % (int)uVar6 + 0x12a;
      uVar6 = (uVar10 - uVar3) + uVar8 + 1;
      if (uVar6 == 0x12a) {
        do {
          printf("BB: %d",4);
        } while( true );
      }
      printf("BB: %d",4);
    }
    else {
      uVar8 = ~uVar10 + uVar6;
    }
  }
  printf("BB: %d",9);
  iVar4 = (uVar10 + 0x12a | 1) + uVar8;
  uVar8 = uVar8 - uVar6 ^ uVar8;
  printf("BB: %d",10,(long)(int)uVar8 % (long)iVar4 & 0xffffffff);
  return ((int)uVar8 / iVar4 + uVar10 + 0x12a | uVar10 + 0x12a) ^ 0x12a;
}
