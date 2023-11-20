uint func0(void)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  f_rand_4();
  uVar1 = f_rand_0();
  iVar2 = f_rand_1();
  iVar3 = f_rand_3();
  iVar4 = f_rand_2();
  printf("BB: %d",0);
  for (; (int)uVar1 <= iVar4; uVar1 = iVar2 % (int)uVar1 + uVar1 & 300) {
    printf("BB: %d",1);
    printf("BB: %d",3);
    if (iVar2 < 0x232) {
      do {
        printf("BB: %d",4);
      } while( true );
    }
    printf("BB: %d",5);
  }
  printf("BB: %d",6);
  if (iVar3 < 0x3c2) {
    printf("BB: %d",7);
    if (0x220 < iVar3) {
      do {
        printf("BB: %d",8);
      } while( true );
    }
    printf("BB: %d",9);
    if (iVar2 <= iVar4) {
      do {
        printf("BB: %d",10);
      } while( true );
    }
    printf("BB: %d",0xb);
    uVar1 = iVar3 - iVar4;
  }
  else {
    printf("BB: %d",0xc);
    uVar1 = -uVar1;
  }
  printf("BB: %d",0xd);
  printf("BB: %d",0xe);
  return ~uVar1;
}
