uint func0(void)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  undefined8 uVar5;
  
  uVar1 = f_rand_2();
  iVar2 = f_rand_1();
  uVar3 = f_rand_0();
  printf("BB: %d",0);
  iVar4 = (int)((ulong)((long)(int)(uVar3 + 0x5b) * -0x6a5fda97) >> 0x20) + uVar3 + 0x5b;
  if (((iVar4 >> 7) - (iVar4 >> 0x1f)) * -0xdb + uVar3 + 0x5b == uVar1) {
    printf("BB: %d",1);
    uVar3 = (uVar3 * uVar3 * (uVar3 + 0x37f) - uVar1) * uVar1;
    goto LAB_00101293;
  }
  printf("BB: %d",3);
  if (0x22b < (int)uVar1) {
    do {
      printf("BB: %d",4);
    } while( true );
  }
  printf("BB: %d",5);
  if (iVar2 < (int)uVar3) {
    do {
      printf("BB: %d",6);
    } while (iVar2 < 0);
    uVar3 = 0;
    printf("BB: %d",7);
LAB_0010126e:
    uVar5 = 9;
  }
  else {
    printf("BB: %d",7);
    uVar5 = 8;
    if ((int)uVar3 < 0x356) goto LAB_0010126e;
  }
  printf("BB: %d",uVar5);
  printf("BB: %d",10);
LAB_00101293:
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return uVar3 | uVar1;
}
