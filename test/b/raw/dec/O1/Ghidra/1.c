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
  int iVar4;
  uint uVar5;
  int iVar6;
  
  uVar3 = f_rand_2();
  iVar4 = f_rand_1();
  uVar5 = f_rand_0();
  printf("BB: %d",0);
  iVar6 = (int)((ulong)((long)(int)(uVar5 + 0x5b) * -0x6a5fda97) >> 0x20) + uVar5 + 0x5b;
  if (((iVar6 >> 7) - (iVar6 >> 0x1f)) * -0xdb + uVar5 + 0x5b == uVar3) {
    printf("BB: %d",1);
    uVar5 = (uVar5 * uVar5 * (uVar5 + 0x37f) - uVar3) * uVar3;
  }
  else {
    printf("BB: %d",3);
    if (0x22b < (int)uVar3) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",4);
        bVar2 = 0x22b < (int)uVar3;
      } while (bVar1);
    }
    printf("BB: %d",5);
    if (iVar4 < (int)uVar5) {
      do {
        uVar5 = 0;
        printf("BB: %d",6);
      } while (iVar4 < 0);
    }
    printf("BB: %d",7);
    printf("BB: %d",(ulong)(0x355 < (int)uVar5 ^ 9));
    printf("BB: %d",10);
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return uVar5 | uVar3;
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


