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
  bool bVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  
  iVar3 = f_rand_4();
  uVar4 = f_rand_0();
  uVar5 = f_rand_2();
  iVar6 = f_rand_1();
  iVar7 = f_rand_3();
  printf("BB: %d",0);
  iVar8 = -0x36562 % iVar6;
  bVar2 = false;
  do {
    printf("BB: %d",1);
    while (0x100 < iVar3) {
      printf("BB: %d",2);
      uVar4 = (iVar7 / iVar8 - iVar8) % iVar7;
      iVar8 = (uVar4 & iVar6 - 0x100U) - iVar6;
    }
    printf("BB: %d",3);
    uVar9 = (uint)(0x100 % (long)iVar3);
    if (!bVar2) {
      do {
        printf("BB: %d",4);
      } while (uVar4 != 0xfffffe3c);
      uVar1 = (long)iVar7 % (long)((int)(0x100 / (long)iVar3) + 0x362);
      uVar1 = (ulong)(uint)((int)uVar1 >> 0x1f) << 0x20 | uVar1 & 0xffffffff;
      uVar9 = (uint)((long)uVar1 % (long)(int)uVar5);
      iVar8 = (int)((long)uVar1 / (long)(int)uVar5);
    }
    printf("BB: %d",5,(ulong)uVar9);
    uVar4 = (int)uVar4 % 0x1c3 + 0x100;
    bVar2 = true;
  } while (iVar8 < 0x1c4);
  printf("BB: %d",6);
  if (iVar3 < 0x289) {
    printf("BB: %d",7);
    do {
      printf("BB: %d",8);
    } while( true );
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return uVar5 ^ 0x100;
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


