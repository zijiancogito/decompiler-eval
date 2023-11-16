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
  int iVar3;
  int iVar4;
  
  f_rand_4();
  uVar1 = f_rand_0();
  iVar2 = f_rand_1();
  iVar3 = f_rand_3();
  iVar4 = f_rand_2();
  printf("BB: %d",0);
  for (; (int)uVar1 <= iVar4; uVar1 = iVar2 % (int)uVar1 + uVar1 & 300) {
    printf("BB: %d",1);
    printf("BB: %d",3);
    if (iVar2 < 0x232) {
      printf("BB: %d",4);
      do {
        printf("BB: %d",4);
      } while( true );
    }
    printf("BB: %d",5);
  }
  printf("BB: %d",6);
  if (iVar3 < 0x3c2) {
    printf("BB: %d",7);
    if (0x220 < iVar3) {
      do {
        printf("BB: %d",8);
      } while( true );
    }
    printf("BB: %d",9);
    if (iVar2 <= iVar4) {
      printf("BB: %d",10);
      do {
        printf("BB: %d",10);
      } while( true );
    }
    printf("BB: %d",0xb);
    uVar1 = iVar3 - iVar4;
  }
  else {
    printf("BB: %d",0xc);
    uVar1 = -uVar1;
  }
  printf("BB: %d",0xd);
  printf("BB: %d",0xe);
  return ~uVar1;
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


