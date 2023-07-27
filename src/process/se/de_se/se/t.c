uint func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  undefined8 uVar4;
  
  uVar1 = f_rand_2();
  uVar2 = f_rand_0();
  uVar3 = f_rand_3();
  f_rand_1();
  printf("BB: %d",0);
  if (uVar1 == 0x14b) {
    printf("BB: %d",1);
    uVar1 = 0xca;
    if (-0x14d < (int)uVar3) {
      if (0x93b5 < (int)uVar2) {
        do {
          printf("BB: %d",2);
        } while( true );
      }
      printf("BB: %d",2);
      uVar1 = (uint)(0x61d31 / (ulong)(0x9501 - uVar2)) ^ 0x279;
    }
    printf("BB: %d",3);
    printf("BB: %d",4);
    printf("BB: %d",6);
    uVar4 = 7;
  }
  else {
    printf("BB: %d",8);
    printf("BB: %d",9);
    uVar2 = ~uVar3 & 0xfffffe07;
    uVar1 = ((~uVar1 & 0x94) % 0x94) * 0x16df4;
    uVar4 = 10;
  }
  printf("BB: %d",uVar4);
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return uVar1 | uVar2;
}


