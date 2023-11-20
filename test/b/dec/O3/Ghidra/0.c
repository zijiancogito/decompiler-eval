ulong func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  
  uVar1 = f_rand_4();
  uVar2 = f_rand_3();
  uVar3 = f_rand_2();
  uVar4 = f_rand_1();
  uVar5 = f_rand_0();
  printf("BB: %d",0);
  uVar6 = (int)~uVar3 % 0x12e + 0x2cfU & uVar1;
  if (uVar4 == 0x21f) {
    printf("BB: %d",1);
    if (uVar6 == 0x39d) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    printf("BB: %d",3);
    if ((int)uVar5 < 0x262) {
      do {
        printf("BB: %d",4);
      } while( true );
    }
    uVar1 = ~uVar5;
  }
  printf("BB: %d",5);
  if (uVar1 == 0x273) {
    printf("BB: %d",0xb);
    return (long)(int)((uVar4 ^ uVar3 - 0x2cf) & uVar5) % (long)(int)(uVar6 & uVar2) & 0xffffffff;
  }
  if (0x15f < (int)uVar1) {
    do {
      printf("BB: %d",6);
      printf("BB: %d",8);
      printf("BB: %d",10);
    } while( true );
  }
  printf("BB: %d",6);
  do {
    printf("BB: %d",7);
  } while( true );
}
