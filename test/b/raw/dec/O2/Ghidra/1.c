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
    goto LAB_001012af;
  }
  printf("BB: %d",3);
  if (0x22b < (int)uVar1) {
    printf("BB: %d",4);
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
LAB_0010128a:
    uVar5 = 9;
  }
  else {
    printf("BB: %d",7);
    uVar5 = 8;
    if ((int)uVar3 < 0x356) goto LAB_0010128a;
  }
  printf("BB: %d",uVar5);
  printf("BB: %d",10);
LAB_001012af:
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return uVar3 | uVar1;
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


