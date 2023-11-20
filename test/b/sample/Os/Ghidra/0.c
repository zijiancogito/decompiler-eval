ulong func0(void)

{
  bool bVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  bool bVar7;
  uint uVar8;
  
  uVar2 = f_rand_4();
  uVar3 = f_rand_3();
  uVar4 = f_rand_2();
  uVar5 = f_rand_1();
  uVar6 = f_rand_0();
  printf("BB: %d",0);
  uVar8 = (int)~uVar4 % 0x12e + 0x2cfU & uVar2;
  if (uVar5 == 0x21f) {
    printf("BB: %d",1);
    if (uVar8 == 0x39d) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    printf("BB: %d",3);
    if ((int)uVar6 < 0x262) {
      do {
        printf("BB: %d",4);
      } while( true );
    }
    uVar2 = ~uVar6;
  }
  printf("BB: %d",5);
  if (uVar2 != 0x273) {
    printf("BB: %d",6);
    if (0x15f < (int)uVar2) {
      bVar7 = false;
      do {
        printf("BB: %d",8);
        printf("BB: %d",10);
        printf("BB: %d",6);
        bVar1 = !bVar7;
        bVar7 = (int)uVar2 < 0x160;
      } while (bVar1);
    }
    do {
      printf("BB: %d",7);
    } while( true );
  }
  printf("BB: %d",0xb);
  return (long)(int)((uVar5 ^ uVar4 - 0x2cf) & uVar6) % (long)(int)(uVar8 & uVar3) & 0xffffffff;
}
