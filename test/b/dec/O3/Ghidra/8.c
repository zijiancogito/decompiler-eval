uint func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  uint uVar5;
  
  uVar1 = f_rand_1();
  uVar2 = f_rand_2();
  uVar3 = f_rand_0();
  iVar4 = f_rand_4();
  uVar5 = f_rand_3();
  printf("BB: %d",0);
  if (uVar5 != uVar2) {
    if (0x252 < (int)uVar2) {
      printf("BB: %d",1);
      do {
        printf("BB: %d",2);
      } while( true );
    }
    if (0x244 < (int)uVar2) {
      printf("BB: %d",1);
      printf("BB: %d",3);
      do {
        printf("BB: %d",4);
      } while( true );
    }
    if (uVar2 != ~uVar1) {
      do {
        printf("BB: %d",1);
        printf("BB: %d",3);
        printf("BB: %d",5);
        printf("BB: %d",6);
        printf("BB: %d",8);
      } while( true );
    }
    printf("BB: %d",1);
    printf("BB: %d",3);
    printf("BB: %d",5);
    printf("BB: %d",6);
    printf("BB: %d",8);
  }
  printf("BB: %d",9);
  if (iVar4 < (int)uVar3) {
    printf("BB: %d",10);
    uVar1 = (uVar2 - iVar4) * uVar2;
    iVar4 = -1;
  }
  else {
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return uVar2 * 2 - iVar4 ^ uVar3 | uVar1;
}
