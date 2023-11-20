uint func0(void)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  uVar1 = f_rand_1();
  uVar2 = f_rand_3();
  f_rand_4();
  f_rand_0();
  iVar3 = f_rand_2();
  printf("BB: %d",0);
  uVar4 = uVar2 + uVar1 & uVar2;
  do {
    printf("BB: %d",1);
  } while ((int)uVar4 < 0x3c7);
  printf("BB: %d",2);
  printf("BB: %d",3);
  return (uVar1 | ((int)(((uVar1 - uVar2) + iVar3 ^ 0x3c6) + 0x3c6 & uVar4) % (int)uVar1) * uVar1) ^
         uVar2;
}
