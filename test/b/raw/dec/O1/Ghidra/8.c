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
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  ulong uVar6;
  ulong uVar7;
  
  uVar1 = f_rand_1();
  uVar7 = (ulong)uVar1;
  uVar2 = f_rand_2();
  uVar3 = f_rand_0();
  uVar6 = (ulong)uVar3;
  uVar4 = f_rand_4();
  uVar5 = f_rand_3();
  printf("BB: %d",0);
  while (uVar5 != uVar2) {
    printf("BB: %d",1);
    while (0x252 < (int)uVar2) {
      printf("BB: %d",2);
      uVar1 = (int)((uint)uVar6 * uVar5) % (int)uVar2 | uVar5;
      uVar6 = (ulong)uVar1;
      uVar7 = (long)(int)uVar1 / (long)(int)uVar7;
      uVar3 = (uint)((long)((ulong)(uint)((int)uVar7 >> 0x1f) << 0x20 | uVar7 & 0xffffffff) %
                    (long)(int)uVar1) & uVar2;
      uVar7 = (ulong)uVar3;
      uVar4 = uVar4 ^ uVar1 ^ uVar3;
    }
    printf("BB: %d",3);
    if (0x244 < (int)uVar2) {
      do {
        printf("BB: %d",4);
      } while (0x244 < (int)uVar2);
      uVar7 = (long)(int)(-uVar4 & (int)((uint)uVar6 & uVar2) % (int)uVar5) % (long)(int)uVar5 &
              0xffffffff;
      uVar4 = 0xffffffff;
      uVar6 = (long)(int)~uVar5 / (long)(int)uVar2 & 0xffffffff;
    }
    uVar3 = (uint)uVar6;
    printf("BB: %d",5);
    printf("BB: %d",6);
    uVar1 = (uint)uVar7;
    printf("BB: %d",8);
    uVar5 = ~uVar1;
  }
  printf("BB: %d",9);
  if ((int)uVar4 < (int)uVar3) {
    printf("BB: %d",10);
    uVar1 = (uVar5 - uVar4) * uVar2;
    uVar4 = 0xffffffff;
  }
  else {
    printf("BB: %d",0xb);
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return uVar2 * 2 - uVar4 ^ uVar3 | uVar1;
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


