#include "out.h"



int _init(EVP_PKEY_CTX *ctx)

{
  int iVar1;
  
  iVar1 = __gmon_start__();
  return iVar1;
}



void FUN_00101020(void)

{
                    // WARNING: Treating indirect jump as call
  (*(code *)(undefined *)0x0)();
  return;
}



// WARNING: Unknown calling convention -- yet parameter storage is locked

int printf(char *__format,...)

{
  int iVar1;
  
  iVar1 = printf(__format);
  return iVar1;
}



// WARNING: Unknown calling convention -- yet parameter storage is locked

int rand(void)

{
  int iVar1;
  
  iVar1 = rand();
  return iVar1;
}



void __cxa_finalize(void)

{
  __cxa_finalize();
  return;
}



void processEntry _start(undefined8 param_1,undefined8 param_2)

{
  undefined auStack_8 [8];
  
  __libc_start_main(main,param_2,&stack0x00000008,0,0,param_1,auStack_8);
  do {
                    // WARNING: Do nothing block with infinite loop
  } while( true );
}



// WARNING: Removing unreachable block (ram,0x001010a3)
// WARNING: Removing unreachable block (ram,0x001010af)

void deregister_tm_clones(void)

{
  return;
}



// WARNING: Removing unreachable block (ram,0x001010e4)
// WARNING: Removing unreachable block (ram,0x001010f0)

void register_tm_clones(void)

{
  return;
}



void __do_global_dtors_aux(void)

{
  if (completed_0 != '\0') {
    return;
  }
  __cxa_finalize(__dso_handle);
  deregister_tm_clones();
  completed_0 = 1;
  return;
}



void frame_dummy(void)

{
  register_tm_clones();
  return;
}



uint func0(void)

{
  bool bVar1;
  bool bVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  
  uVar3 = f_rand_3();
  uVar4 = f_rand_0();
  f_rand_2();
  uVar5 = f_rand_4();
  uVar6 = f_rand_1();
  printf("BB: %d",0);
  uVar8 = ~uVar5;
  uVar10 = uVar3 + uVar8 ^ uVar3;
  if (uVar3 + uVar8 == 0) {
    printf("BB: %d",8);
    if ((int)uVar4 < (int)uVar3) {
      printf("BB: %d",10);
      uVar3 = (int)(uVar6 ^ uVar3) % (int)~uVar3;
    }
    else {
      printf("BB: %d",9);
      uVar10 = ~uVar10;
      uVar3 = uVar4 - uVar10 & uVar3;
      uVar5 = (~uVar3 + uVar10) * uVar6;
    }
    printf("BB: %d",0xb);
    uVar3 = uVar3 + uVar5 ^ uVar3;
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar4 < (int)uVar8) {
      printf("BB: %d",2);
      uVar7 = uVar6 ^ uVar5;
      uVar5 = uVar5 | uVar6;
      uVar9 = ((uVar5 | uVar4) + uVar10) * uVar4;
      uVar3 = (uVar10 & uVar6) + ((uVar7 - uVar3) * uVar10 ^ uVar8 | uVar6);
    }
    else {
      printf("BB: %d",3);
      uVar3 = (int)(uVar3 * uVar10 & uVar8) % (int)uVar10;
      uVar9 = uVar4 * uVar6 + uVar8;
      uVar4 = (uVar3 | uVar9) ^ uVar5;
    }
    printf("BB: %d",4);
    if (0x15d < (int)uVar3) {
      do {
        printf("BB: %d",5);
        uVar9 = (int)uVar9 / (int)uVar10 ^ uVar4;
        uVar3 = ((int)(~((uVar9 | ~uVar4 & uVar10) ^ uVar6) - uVar5) % (int)uVar5) * uVar5 ^ uVar5;
      } while (0x15d < (int)uVar3);
    }
    printf("BB: %d",6);
    if (0x2f0 < (int)uVar9) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",7);
        bVar2 = 0x2f0 < (int)uVar9;
      } while (bVar1);
    }
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return (int)((-uVar3 | 1) - uVar10) % (int)uVar10 + uVar5 | uVar5;
}



undefined8 main(void)

{
  uint uVar1;
  
  uVar1 = func0();
  printf("%d",(ulong)uVar1);
  return 0;
}



int f_rand_0(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_0: %d",0);
  return iVar1;
}



int f_rand_1(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_1: %d",1);
  return iVar1;
}



int f_rand_2(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_2: %d",2);
  return iVar1;
}



int f_rand_3(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_3: %d",3);
  return iVar1;
}



int f_rand_4(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_4: %d",4);
  return iVar1;
}



void _fini(void)

{
  return;
}

