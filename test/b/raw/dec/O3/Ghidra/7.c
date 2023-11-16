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



undefined8 func0(void)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  
  iVar1 = f_rand_0();
  uVar2 = f_rand_1();
  uVar3 = f_rand_2();
  printf("BB: %d",0);
  if (iVar1 == 999) {
    printf("BB: %d",1);
    if ((int)uVar3 < 0x138) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    uVar6 = (uVar3 + (uVar3 ^ 999) * 0x28) * uVar2;
    printf("BB: %d",3);
    uVar2 = (~uVar6 | uVar3) + 0x28;
    printf("BB: %d",4);
    uVar4 = ((uint)((long)(ulong)(uVar2 & 999) % (long)(int)uVar2) ^ 0x28) - uVar6;
    uVar5 = ~((int)uVar2 / (int)uVar3 & (int)~uVar4 % (int)uVar2) * uVar6 ^ 0x28;
    printf("BB: %d",6,(long)(int)uVar2 % (long)(int)uVar3 & 0xffffffff);
    uVar3 = uVar4 * uVar6 * uVar5;
  }
  else {
    uVar5 = 0x28;
  }
  printf("BB: %d",7);
  if (uVar3 != 0x2a) {
    if (uVar2 != uVar5) {
      do {
        printf("BB: %d",8);
        printf("BB: %d",10);
      } while( true );
    }
    printf("BB: %d",8);
    do {
      printf("BB: %d",9);
    } while( true );
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return 0xffffffd5;
}



undefined8 main(void)

{
  func0();
  printf("%d",0xffffffd5);
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


