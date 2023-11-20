ulong func0(void)

{
  bool bVar1;
  bool bVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint local_40;
  
  uVar3 = f_rand_4();
  uVar4 = f_rand_3();
  uVar5 = f_rand_2();
  uVar6 = f_rand_1();
  local_40 = f_rand_0();
  printf("BB: %d",0);
  uVar7 = (int)~uVar5 % 0x12e + 0x2cfU & uVar3;
  uVar4 = uVar4 & uVar7;
  if (uVar6 == 0x21f) {
    printf("BB: %d",1);
    uVar3 = ~local_40;
    if (uVar7 == 0x39d) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    uVar6 = 0x21f;
    printf("BB: %d",3);
    if ((int)local_40 < 0x262) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",4);
        bVar2 = (int)local_40 < 0x262;
      } while (bVar1);
    }
  }
  printf("BB: %d",5);
  if (uVar3 != 0x273) {
    do {
      printf("BB: %d",6);
      if ((int)uVar3 < 0x160) {
        bVar2 = true;
        do {
          bVar1 = bVar2;
          printf("BB: %d",7);
          bVar2 = (int)uVar3 < 0x160;
        } while (bVar1);
        local_40 = 0x12e % (int)uVar7 & 0x12e;
        uVar4 = ~uVar3;
      }
      printf("BB: %d",8);
      printf("BB: %d",10);
    } while (uVar3 != 0x273);
  }
  printf("BB: %d",0xb);
  return (long)(int)((uVar5 - 0x2cf ^ uVar6) & local_40) % (long)(int)uVar4 & 0xffffffff;
}
