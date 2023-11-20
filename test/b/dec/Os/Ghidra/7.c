undefined8 func0(void)

{
  bool bVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  bool bVar6;
  uint uVar7;
  uint uVar8;
  
  iVar2 = f_rand_0();
  uVar3 = f_rand_1();
  uVar4 = f_rand_2();
  printf("BB: %d",0);
  if (iVar2 == 999) {
    printf("BB: %d",1);
    if ((int)uVar4 < 0x138) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    uVar8 = (uVar4 + (uVar4 ^ 999) * 0x28) * uVar3;
    printf("BB: %d",3);
    uVar3 = (~uVar8 | uVar4) + 0x28;
    printf("BB: %d",4);
    uVar5 = ((uint)((long)(ulong)(uVar3 & 999) % (long)(int)uVar3) ^ 0x28) - uVar8;
    uVar7 = ~((int)uVar3 / (int)uVar4 & (int)~uVar5 % (int)uVar3) * uVar8 ^ 0x28;
    printf("BB: %d",6,(long)(int)uVar3 % (long)(int)uVar4 & 0xffffffff);
    uVar4 = uVar5 * uVar8 * uVar7;
  }
  else {
    uVar7 = 0x28;
  }
  printf("BB: %d",7);
  if (uVar4 != 0x2a) {
    printf("BB: %d",8);
    if (uVar3 != uVar7) {
      bVar6 = false;
      do {
        printf("BB: %d",10);
        printf("BB: %d",8);
        bVar1 = !bVar6;
        bVar6 = uVar3 == uVar7;
      } while (bVar1);
    }
    do {
      printf("BB: %d",9);
    } while( true );
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return 0xffffffd5;
}
