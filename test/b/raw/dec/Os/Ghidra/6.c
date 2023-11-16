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
  ulong uVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  ulong uVar7;
  uint uVar8;
  uint uVar9;
  
  uVar2 = f_rand_0();
  iVar3 = f_rand_4();
  uVar4 = f_rand_2();
  uVar7 = (ulong)uVar4;
  uVar5 = f_rand_1();
  uVar6 = f_rand_3();
  printf("BB: %d",0);
  uVar9 = (int)uVar6 % 0x12a + 0x12a;
  if ((int)uVar9 < iVar3) {
    printf("BB: %d",5);
    if ((int)uVar6 < (int)uVar4) {
      do {
        printf("BB: %d",6);
      } while( true );
    }
    printf("BB: %d",7);
    uVar8 = uVar9 ^ uVar5;
    uVar4 = uVar8 * uVar2 ^ uVar6;
    if ((int)uVar5 < 0x197) {
      uVar4 = uVar6 * uVar9 & uVar2;
    }
    else {
      uVar5 = uVar4 * uVar4;
      do {
        printf("BB: %d",8);
      } while (0x196 < uVar5);
      uVar4 = uVar4 | ~(uVar8 * ((int)uVar6 / (int)uVar4 | uVar6));
    }
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar5 < 0x2ae) {
      iVar3 = uVar4 + uVar6 + (uVar9 ^ uVar6);
    }
    else {
      uVar4 = (uVar2 + iVar3) * iVar3;
      do {
        printf("BB: %d",2);
        iVar3 = (int)uVar7;
        uVar5 = (int)(0x12a % (long)(int)uVar9) - iVar3;
        uVar1 = (long)((ulong)(uint)((int)(0x12a / (long)iVar3) >> 0x1f) << 0x20 |
                      0x12a / (long)iVar3 & 0xffffffffU) % (long)iVar3;
        uVar7 = uVar1 & 0xffffffff;
        uVar9 = uVar4;
      } while (0x2ad < (int)uVar5);
      iVar3 = (int)uVar1 + (int)uVar2 % (int)uVar5;
    }
    printf("BB: %d",3);
    if (uVar5 == 0x12a) {
      uVar4 = (((int)(iVar3 + uVar9) % (int)uVar2) * 0x12a) % (int)uVar5 + 0x12a;
      uVar5 = (uVar9 - uVar2) + uVar4 + 1;
      do {
        printf("BB: %d",4);
      } while (uVar5 == 0x12a);
    }
    else {
      uVar4 = ~uVar9 + uVar5;
    }
  }
  printf("BB: %d",9);
  iVar3 = (uVar9 + 0x12a | 1) + uVar4;
  uVar4 = uVar4 - uVar5 ^ uVar4;
  printf("BB: %d",10,(long)(int)uVar4 % (long)iVar3 & 0xffffffff);
  return ((int)uVar4 / iVar3 + uVar9 + 0x12a | uVar9 + 0x12a) ^ 0x12a;
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


