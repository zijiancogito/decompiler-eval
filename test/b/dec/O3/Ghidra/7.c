undefined8 func0(void)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  
  iVar1 = f_rand_0();
  uVar2 = f_rand_1();
  uVar3 = f_rand_2();
  printf("BB: %d",0);
  if (iVar1 == 999) {
    printf("BB: %d",1);
    if ((int)uVar3 < 0x138) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    uVar6 = (uVar3 + (uVar3 ^ 999) * 0x28) * uVar2;
    printf("BB: %d",3);
    uVar2 = (~uVar6 | uVar3) + 0x28;
    printf("BB: %d",4);
    uVar4 = ((uint)((long)(ulong)(uVar2 & 999) % (long)(int)uVar2) ^ 0x28) - uVar6;
    uVar5 = ~((int)uVar2 / (int)uVar3 & (int)~uVar4 % (int)uVar2) * uVar6 ^ 0x28;
    printf("BB: %d",6,(long)(int)uVar2 % (long)(int)uVar3 & 0xffffffff);
    uVar3 = uVar4 * uVar6 * uVar5;
  }
  else {
    uVar5 = 0x28;
  }
  printf("BB: %d",7);
  if (uVar3 != 0x2a) {
    if (uVar2 != uVar5) {
      do {
        printf("BB: %d",8);
        printf("BB: %d",10);
      } while( true );
    }
    printf("BB: %d",8);
    do {
      printf("BB: %d",9);
    } while( true );
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return 0xffffffd5;
}
